# a9s_rabbitmq

The a9s_rabbitmq gem simplifies the configuration of Ruby applications using the anynines RabbitMQ service.
It provides methods for generating configuration hashes for
* the [amqp gem](https://github.com/ruby-amqp/amqp)
* the [bunny gem](https://github.com/ruby-amqp/bunny)

If you would like to use other gems to connect to the RabbitMQ service you can also retrieve a standard credentials hash (see below). 


## Usage

### AMQP gem

	AMQP.start(Anynines::RabbitMQ::Utility.amqp_hash) do |connection|
		...
	end
	
### bunny gem

	conn = Bunny.new(Anynines::RabbitMQ::Utility.bunny_hash)

### Other rabbitmq gems

	credentials_hash = Anynines::RabbitMQ::Utility.credentials_hash # => returns a Hash

## Contributing to a9s_rabbitmq
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break the gem in a future version unintentionally.
* Please try not to touch the Rakefile, version, or history. If you want to have your own version, or in case it is otherwise necessary, that is fine, but please isolate your change to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2014 Julian Weber. See LICENSE.txt for
further details.

