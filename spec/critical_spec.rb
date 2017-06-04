# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Critical do
  let(:expected_css) { <<~'CSS' }
    p {
      color: red;
    }
  CSS

  context 'from the filesystem' do
    it 'extracts critical CSS' do
      css = Critical.generate(base: 'spec/fixtures/static', src: 'test.html')
      expect(css).to eq expected_css
    end
  end

  context 'from a server' do
    before :all do
      StaticFileServer.start
    end

    after :all do
      StaticFileServer.stop
    end

    it 'extracts critical CSS' do
      css = Critical.generate(src: "#{StaticFileServer.url}/test.html")
      expect(css).to eq expected_css
    end
  end
end
