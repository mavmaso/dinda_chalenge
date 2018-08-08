class InvalidResponseError < StandardError
end

class Crawler
  require 'net/http'
  require 'json'

  ENDPOINT='https://api.github.com'.freeze

  def initialize(http_client: Net::HTTP)
    @http_client = http_client
  end

  def craw_commits(org: 'Dinda-com-br', repository: 'braspag-rest')
    uri = URI("#{ENDPOINT}/repos/#{org}/#{repository}/commits")
    response = @http_client.get_response(uri)
    if response.code == '200'
      JSON.parse(response.body)
    else
      fail InvalidResponseError, "HTTP Code: #{response.code} - #{response.message}"
    end

    JSON.parse(response.body)
  end
end