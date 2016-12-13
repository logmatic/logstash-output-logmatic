# Logstash Logmatic.io's Output Plugin
*Link to the [Logmatic.io documentation](http://doc.logmatic.io/docs/using-logstash)*

This project is an output plugin to send logs to Logmatic.io from Logstash >v1.5.0.

## How to install it?

The gem is published in the main repository.

```bash
# Logstash 5.x
bin/logstash-plugin install logstash-output-logmatic

# Logstash 2.x
bin/logstash-plugin --version 0.2 logstash-output-logmatic

# Logstash 1.5x
bin/plugin install --version 0.2 logstash-output-logmatic
```

Check the installation.
```bash
bin/logstash-plugin list  | grep logstash-output-logmatic
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

