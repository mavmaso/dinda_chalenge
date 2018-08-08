class InvalidResponseError < StandardError
end

class InvalidUrlFormatError < StandardError
end

class GithubCrawler
  require 'json'

  ENDPOINT='https://api.github.com'.freeze

  def initialize(http_client: HttpClient.new)
    @http_client = http_client
  end

  def craw_commits(org: 'Dinda-com-br', repository: 'braspag-rest')
    response = @http_client.get("#{ENDPOINT}/repos/#{org}/#{repository}/commits")

    JSON.parse(response)
  end
end

class HttpClient
  require 'net/http'

  def initialize(overrides: {})
    @http_client = overrides.fetch(:http_client) { Net::HTTP }
  end

  def get(url)
    response = request(url)
    validate_response(response)
  end

  private

  def request(url)
    if valid_url?(url)
      uri = URI(url)
      @http_client.get_response(uri)
    else
      raise InvalidUrlFormatError, "#{url} is not a valid URL format."
    end
  end

  def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def validate_response(response)
    if response.is_a?(Net::HTTPSuccess)
      response.body
    else
      fail InvalidResponseError, "HTTP Code: #{response.code} - #{response.message}"
    end
  end
end
