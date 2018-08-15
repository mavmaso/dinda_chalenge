class GithubCommitsMapper
  def initialize(commits:)
    @commits = commits
  end

  def map_commit_to_commiter
    @commits.map do |commit|
      {
        name: commit.dig("commit", "author", "name"),
        email: commit.dig("commit", "author", "email"),
        login: commit.dig("author", "login"),
        avatar_url: commit.dig("author", "avatar_url"),
      }
    end
  end
end
