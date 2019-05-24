module Optimizely
  class Environment < Hashie::Dash
    include Optimizely::Model

    property :status
    property :environment_name
    property :id, from: :environment_id
    property :percentage_included
  end
end
