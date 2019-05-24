module Optimizely
  class Metric < Hashie::Dash
    include Optimizely::Model

    property :aggregator
    property :event_id
    property :scope
    property :winning_direction
  end
end
