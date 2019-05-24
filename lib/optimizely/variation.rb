module Optimizely
  class Variation < Hashie::Dash
    include Optimizely::Model

    property :actions
    property :archived
    property :key
    property :status
    property :id, from: :variation_id
    property :weight
  end
end
