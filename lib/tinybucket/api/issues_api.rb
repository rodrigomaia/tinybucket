# frozen_string_literal: true

module Tinybucket
  module Api
    # Issues Api client
    #
    # @!attribute [rw] repo_owner
    #   @return [String] repository owner name.
    # @!attribute [rw] repo_slug
    #   @return [String] {https://developer.atlassian.com/bitbucket/api/2/reference/resource/repositories/%7Busername%7D/%7Brepo_slug%7D repo_slug}.
    class IssuesApi < BaseApi
      include Tinybucket::Api::Helper::IssuesHelper

      attr_accessor :repo_owner, :repo_slug

      # Send 'GET a issues list for a repository' request
      #
      # @see https://developer.atlassian.com/bitbucket/api/2/reference/resource/repositories/%7Busername%7D/%7Brepo_slug%7D/issues#get
      #   GET a issues list for a repository
      #
      # @param options [Hash]
      # @return [Tinybucket::Model::Page]
      def list(options = {})
        get_path(
          path_to_list,
          options,
          get_parser(:collection, Tinybucket::Model::Issue)
        )
      end

      # Send 'GET an individual issue' request
      #
      # @see https://developer.atlassian.com/bitbucket/api/2/reference/resource/repositories/%7Busername%7D/%7Brepo_slug%7D/issues/%7Bname%7D#get
      #   GET an individual issue
      #
      # @param name [String] The issue name
      # @param options [Hash]
      # @return [Tinybucket::Model::Issue]
      def find(name, options = {})
        get_path(
          path_to_find(name),
          options,
          get_parser(:object, Tinybucket::Model::Issue)
        )
      end
    end
  end
end
