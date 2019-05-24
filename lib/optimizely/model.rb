require "hashie"
require "active_support/concern"

module Optimizely
  module Model
    extend ActiveSupport::Concern

    included do
      include Hashie::Extensions::MergeInitializer
      include Hashie::Extensions::Dash::PropertyTranslation
      include Hashie::Extensions::Dash::Coercion
    end

    class_methods do
      def from_response(path)
        new Optimizely.client.get(path)
      end
    end
  end
end
