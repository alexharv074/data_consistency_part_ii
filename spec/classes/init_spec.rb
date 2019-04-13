require 'spec_helper'

describe 'loopback' do
  it 'compiles' do
    is_expected.to compile
    File.write('catalogs/loopback.json', PSON.pretty_generate(catalogue))
  end
end
