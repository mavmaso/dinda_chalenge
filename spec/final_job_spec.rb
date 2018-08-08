require 'spec_helper'
require './job'

describe 'Json final' do
  context 'successfully' do
    it 'ok' do
      file = Job.save_commits
      expect((file)).to eq('tasas')
    end
  end
end