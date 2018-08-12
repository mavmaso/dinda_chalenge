require './src/github_crawler'
require './src/github_commiter'
require './src/github_rank'
require 'json'
require 'net/http'

class DindaChalenge
  class << self
    def save_commits
      craw = GithubCrawler.new.craw_commits
      commits = craw
      #GithubCommiter.new(commits)
      File.open('teste.txt', 'w') do |file|
        file.write(craw)
      end
      File.read('teste.txt')
      File.open('teste2.txt', 'w') do |file|
        file.write(commits)
      end
      File.read('teste2.txt')
    end
  end
end
