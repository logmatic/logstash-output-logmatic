# encoding: utf-8
require "logstash/outputs/base"
require "logstash/namespace"
require "stud/buffer"

# Ship log from logstash straight to Logmatic
# 
# To use this you will need a valid Logmatic API Key
class LogStash::Outputs::LogmaticBatch < LogStash::Outputs::Base
  include Stud::Buffer

  config_name "logmatic"
  milestone 2

  # The Logmatic api key
  # You can find it in the 'Account' section in the Logmatic interface.
  config :key, :validate => :string, :required => true

  # How many events to queue before flushing to Logmatic
  # prior to schedule set in @timeframe
  config :queue_size, :validate => :number, :default => 10

  # How often (in seconds) to flush queued events to Logmatic
  config :timeframe, :validate => :number, :default => 10

  public
  def register
    require "net/https"
    require "uri"
    @url = "https://api.logmatic.io/v1/input/#{@key}"
    @uri = URI.parse(@url)
    @client = Net::HTTP.new(@uri.host, @uri.port)
    @client.use_ssl = true
    @client.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @logger.debug("Logmatic URL", :url => @url)

    buffer_initialize(
      :max_items => @queue_size,
      :max_interval => @timeframe,
      :logger => @logger
    )
  end

  public
  def receive(event)
    return unless output?(event)
    buffer_receive(event)
  end

  public
  def flush(events, final=false)
    # Send the event over http.
    request = Net::HTTP::Post.new(@uri.path)
    request.body = events.to_json
    request.add_field("Content-Type", 'application/json')
    response = @client.request(request)
    if response.is_a?(Net::HTTPSuccess)
      @logger.debug("Event sent to Logmatic OK!")
    else
      @logger.warn("HTTP error", :error => response.error!)
    end
  end # def receive
end # class LogStash::Outputs::LogmaticBatch