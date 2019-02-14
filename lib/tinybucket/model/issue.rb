# frozen_string_literal: true

module Tinybucket
  module Model
    # issue
    #
    # @see https://developer.atlassian.com/bitbucket/api/2/reference/resource/repositories/%7Busername%7D/%7Brepo_slug%7D/issues
    #   issue Resource
    #
    # @!attribute [rw] links
    #   @return [Hash]
    # @!attribute [rw] type
    #   @return [String]
    # @!attribute [rw] name
    #   @return [String]
    # @!attribute [rw] repository
    #   @return [Hash]
    # @!attribute [rw] target
    #   @return [Hash]
    class Issue < Base
      include Tinybucket::Model::Concerns::RepositoryKeys

      acceptable_attributes :links, :type, :name, :repository

      private

      def issues_api
        create_api('Issues', repo_keys)
      end

      def load_model
        issues_api.find(name, {})
      end
    end
  end
end
