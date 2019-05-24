module Optimizely
  class Experiment < Hashie::Dash
    include Optimizely::Model

    property :allocation_policy
    property :audience_conditions
    property :campaign_id
    property :changes
    property :created
    property :description
    property :earliest
    property :environments, transform_with: ->(e) { e.transform_values { |v| Environment.new(v) } }
    property :holdback
    property :id
    property :is_classic
    property :key
    property :last_modified
    property :latest
    property :metrics, coerce: Array[Metric]
    property :name
    property :page_ids
    property :project_id
    property :status
    property :type
    property :whitelist
    property :variations, coerce: Array[Variation]

    def self.find(experiment_id)
      from_response "experiments/#{experiment_id}"
    end
  end
end
