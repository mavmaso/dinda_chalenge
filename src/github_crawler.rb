class GithubCrawler
  require 'json'
  require_relative 'http_client'

  ENDPOINT='https://api.github.com'.freeze

  def initialize(http_client: HttpClient.new)
    @http_client = http_client
  end

  def craw_commits(org: 'Dinda-com-br', repository: 'braspag-rest')
    response = @http_client.get("#{ENDPOINT}/repos/#{org}/#{repository}/commits")

    JSON.parse(response)
  end
end
