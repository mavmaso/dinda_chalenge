require 'spec_helper'
require './dinda_chalenge'

describe 'Json final' do
  context 'successfully' do
    it 'ok' do
      file = DindaChalenge.save_commits
      expect((file)).to eq('tasas')
    end
  end
end