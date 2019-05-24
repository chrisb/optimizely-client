require "active_support/core_ext/module/attribute_accessors"
require "active_support/core_ext/hash"
require "faraday_middleware"
require "optimizely/client/version"
require "optimizely/client/base"
require "optimizely/model"
require "optimizely/metric"
require "optimizely/variation"
require "optimizely/environment"
require "optimizely/experiment"
require "optimizely/project"

module Optimizely
  mattr_accessor :api_token, instance_writer: false, instance_reader: false

  module_function

  def client
    @client ||= Optimizely::Client.new
  end
end

Optimizely.api_token ||= ENV['OPTIMIZELY_API_TOKEN']
