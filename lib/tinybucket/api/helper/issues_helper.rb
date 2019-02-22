# frozen_string_literal: true

module Tinybucket
  module Api
    module Helper
      module IssuesHelper
        include ::Tinybucket::Api::Helper::ApiHelper

        private

        def path_to_list
          build_path(base_path)
        end

        def path_to_find(issue)
          build_path(base_path,
                     [issue, 'issue'])
        end

        def base_path
          build_path('/repositories',
                     [repo_owner, 'repo_owner'],
                     [repo_slug, 'repo_slug'], 
                     'issues')
        end
      end
    end
  end
end
