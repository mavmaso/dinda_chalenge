require '../src/github_crawler'

describe 'GithubCrawler' do
  context 'when crawling a given github repository' do
    context 'when the given URL is valid' do
      context 'when the response from the endpoint is valid' do
        it 'returns the content of the body' do

        end
      end

      context 'when the response from the endpoint is invalid' do
        it 'raises an InvalidResponseError' do

        end
      end
    end

    context 'when the given URL is invalid' do
      it 'raises an InvalidUrlFormatError' do

      end
    end
  end
end
