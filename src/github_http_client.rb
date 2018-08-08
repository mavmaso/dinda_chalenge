class HttpClient
  require 'net/http'
  require_relative 'invalid_response_error'
  require_relative 'invalid_url_format_error'

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
