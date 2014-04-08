module Anynines
  module RabbitMQ
    autoload :Utility, File.expand_path('../a9s_rabbitmq/utility', __FILE__)
  
    def self.version
      file = File.open(File.expand_path("../../VERSION", __FILE__))
      return file.read.to_s.tr("\n","")
    end
  end
end