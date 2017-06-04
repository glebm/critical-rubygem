# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Critical do
  before :all do
    StaticFileServer.start
  end

  after :all do
    StaticFileServer.stop
  end

  it 'extracts critical CSS' do
  end
end
