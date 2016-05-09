# Logstash Logmatic.io's Output Plugin
*Link to the [Logmatic.io documentation](http://doc.logmatic.io/docs/using-logstash)*

This project is an output plugin to send logs to Logmatic.io from Logstash >v1.5.0.

## How to install it?

The gem should be published in the main repository.
To install it in your Logstash install:

- Edit Logstash `Gemfile` and add the local plugin path, for example:

```
gem "logstash-output-logmatic"
```

- Then install plugin:

```
bin/plugin install --no-verify
```

## How to use it?

Then you just need to configure the output as follow:

```
output {
    logmatic {
        key => "<your_api_key>"
    }
}

```
Don’t forget to change `<your_api_key>` to your provided api key.
Once you are happy with your configuration you have to restart Logstash to take it account.

## Need Help?

If you need any support please contact us Logmatic.io's support team.

## Developing

#### 1. Run in a local Logstash clone

- Edit Logstash `Gemfile` and add the local plugin path, for example:
```ruby
gem "logstash-output-logmatic", :path => "/your/local/logstash-output-logmatic"
```
- Install plugin
```sh
bin/plugin install --no-verify
```
- Run Logstash with your plugin
```sh
bin/logstash -e 'output {logmatic {...}}'
```
At this point any modifications to the plugin code will be applied to this local Logstash setup. After modifying the plugin, simply rerun Logstash.

#### 2. Run in an installed Logstash

You can use the same **1.** method to run your plugin in an installed Logstash by editing its `Gemfile` and pointing the `:path` to your local plugin development directory or you can build the gem and install it using:

- Build your plugin gem
```sh
gem build logstash-output-logmatic.gemspec
```
- Install the plugin from the Logstash home
```sh
bin/plugin install /your/local/plugin/logstash-output-logmatic.gem
```
- Start Logstash and proceed to test the plugin
