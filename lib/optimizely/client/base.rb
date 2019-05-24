require "active_support/core_ext/module/delegation"

module Optimizely
  class Client
    class NoCredentials < StandardError; end

    attr_accessor :connection

    def initialize
      raise NoCredentials, "API token has not been set" unless Optimizely.api_token

      @connection = Faraday.new "https://api.optimizely.com/v2" do |conn|
        conn.authorization :Bearer, Optimizely.api_token
        conn.request :json
        conn.response :json, :content_type => /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end

    def get(*args)
      @connection.get(*args).body.deep_symbolize_keys
    end
  end
end
