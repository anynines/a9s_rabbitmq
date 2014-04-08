require 'json'

module Anynines
  module RabbitMQ
    class Utility
      # Returns a credentials hash for the rabbitmq service
      def self.credentials_hash
        # parse the VCAP_SERVICES environment variable
        services = JSON.parse(ENV["VCAP_SERVICES"])  
        raise "Couldn't find the VCAP_SERVICE env variable! Are you running within an anynines environment?" if services.nil?
        raise "Couldn't access the a9s rabbitmq service credentials from env! Have you bound a rabbitmq service instance to the application?" if services["rabbitmq-2.8"].nil?
        rabbit_service = services["rabbitmq-2.8"].first
        
        return {
          name: rabbit_service["credentials"]["name"],
          hostname: rabbit_service["credentials"]["hostname"],
          host: rabbit_service["credentials"]["host"],
          port: rabbit_service["credentials"]["port"],
          admin_port: rabbit_service["credentials"]["admin_port"],
          vhost: rabbit_service["credentials"]["vhost"],
          username: rabbit_service["credentials"]["username"],
          user: rabbit_service["credentials"]["user"],
          password: rabbit_service["credentials"]["password"],
          pass: rabbit_service["credentials"]["pass"],
          url: rabbit_service["credentials"]["url"]
        }
      end

      # returns an amqp gem compatible hash
      # takes an optional hash for specifying additional options like:
      # :ssl (Hash) — TLS (SSL) parameters to use.
      # :heartbeat (Fixnum) — default: 0 — Connection heartbeat, in seconds. 0 means no heartbeat. Can also be configured server-side starting with RabbitMQ 3.0.
      # :on_tcp_connection_failure (#call) — A callable object that will be run if connection to server fails
      # :on_possible_authentication_failure (#call) — A callable object that will be run if authentication fails (see Authentication failure section)
      #
      # @param additional_options [Hash] - additional options hash
      # @returns [Hash] an amqp session hash
      def self.amqp_hash(additional_options = {})
        creds = credentials_hash
        
        hash = {
          host: creds[:host],
          port: creds[:port],
          vhost: creds[:vhost],
          username: creds[:username],
          password: creds[:password]
        }
        
        hash = additional_options.merge hash
        return hash
      end


      # returns a bunny compatible hash
      # takes an optional hash for specifying additional options like:
      # :heartbeat or :heartbeat_interval, in seconds, default is 0 (no heartbeats). :server means "use the value from RabbitMQ config"
      # :log_level (symbol or integer, default: Logger::WARN): log level to use.
      # :log_file (string or IO): log file or IO object to use. Defaults to STDOUT.
      # :automatically_recover (boolean, default: true): when false, will disable automatic network failure recovery
      # :network_recovery_interval (number, default: ``): interval between reconnection attempts
      # :threaded (boolean): switches to single-threaded connections when set to false. Only recommended for apps that only publish messages.
      # :continuation_timeout (integer): timeout for client operations that expect a response (e.g. Bunny::Queue#get), in milliseconds. Default is 4000 ms.
      #
      # @param additional_options [Hash] - additional options hash
      # @returns [Hash] a bunny session hash
      def self.bunny_hash(additional_options = {})
        creds = credentials_hash
        
        hash = {
          host: creds[:host],
          port: creds[:port],
          vhost: creds[:vhost],
          username: creds[:username],
          password: creds[:password],
        }
        
        hash = additional_options.merge hash
        return hash
      end
    end
  end
end