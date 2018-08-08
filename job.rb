require './src/github_crawler'
require './src/github_commiter'
require './src/github_rank'
require 'json'
require 'net/http'

class Job
  class << self
    def save_commits
      craw = GithubCrawler.new.craw_commits
      File.open('teste.txt', 'w') do |file|
        file.write(craw)
      end
      File.read('teste.txt')
    end
  end
end
