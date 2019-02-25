# frozen_string_literal: true

module Tinybucket
  module Resource
    class Issues < Tinybucket::Resource::Base
      def initialize(repo, options)
        @repo = repo
        @args = [options]
      end

      def repo_owner= x
        puts x
      end

      # Find the issue
      #
      # @param issue [String]
      # @param options [Hash]
      # @return [Tinybucket::Model::Issue]
      def find(issue, options = {})
        issues_api.find(issue, options).tap do |m|
          inject_repo_keys(m, @repo.repo_keys)
        end
      end

      # Create a issue
      #
      # @param key [String]
      # @param options [Hash]
      # @return [Tinybucket::Model::Issue]
      def create(options)
        issues_api.post(options).tap do |m|
          m.repo_keys = @repo.repo_keys
        end
      end

      private

      def issues_api
        create_api('Issues', @repo.repo_keys)
      end

      def enumerator
        create_enumerator(issues_api, :list, *@args) do |m|
          inject_repo_keys(m, @repo.repo_keys)
        end
      end
    end
  end
end
