module Buildkit
  class Client
    # Methods for the Builds API
    #
    # @see https://buildkite.com/docs/api/builds
    module Builds
      # List all builds
      #
      # @return [Array<Sawyer::Resource>] Array of hashes representing Buildkite builds.
      # @see https://buildkite.com/docs/api/builds#list-all-builds
      # @example
      #   Buildkit.builds
      def builds(options = {})
        get('/v1/builds', options)
      end

      # List builds for an organization
      #
      # @param org [String] Organization slug.
      # @return [Array<Sawyer::Resource>] Array of hashes representing Buildkite builds.
      # @see https://buildkite.com/docs/api/builds#list-builds-for-an-organization
      # @example
      #   Buildkit.organization_builds('my-great-org'))
      def organization_builds(org, options = {})
        get("/v1/organizations/#{org}/builds", options)
      end

      # List builds for a project
      #
      # @param org [String] Organization slug.
      # @param project [String] Project slug.
      # @return [Array<Sawyer::Resource>] Array of hashes representing Buildkite builds.
      # @see https://buildkite.com/docs/api/builds#list-builds-for-a-project
      # @example
      #   Buildkit.project_builds('my-great-org', 'great-project')
      def project_builds(org, project, options = {})
        get("/v1/organizations/#{org}/projects/#{project}/builds", options)
      end

      # List builds for a project
      #
      # @param org [String] Organization slug.
      # @param project [String] Project slug.
      # @param number [Integer] Build number.
      # @return [Sawyer::Resource] Hash representing Buildkite build.
      # @see https://buildkite.com/docs/api/builds#get-a-build
      # @example
      #   Buildkit.project_builds('my-great-org', 'great-project', 42)
      def build(org, project, number, options = {})
        get("/v1/organizations/#{org}/projects/#{project}/builds/#{number}", options)
      end
    end
  end
end