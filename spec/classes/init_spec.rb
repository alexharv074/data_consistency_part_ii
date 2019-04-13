require 'spec_helper'
require 'json'

describe 'loopback' do
  it 'compiles' do
    is_expected.to compile
    File.write('catalogs/loopback.json', PSON.pretty_generate(catalogue))
  end

  it 'should contain file /server/config.json' do
    is_expected.to contain_file('/server/config.json').with({
      'ensure' => 'present',
      'owner' => 'root',
      'group' => 'root',
      'mode' => '0444',
    })
  end

  it '/server/config.json should be valid JSON' do
    json_data = catalogue.resource('file', '/server/config.json').send(:parameters)[:content]
    expect { JSON.parse(json_data) }.to_not raise_error
  end

  it 'restApiRoot, host and port should look ok' do
    json_data = catalogue.resource('file', '/server/config.json').send(:parameters)[:content]
    parsed = JSON.parse(json_data)
    expect(parsed['restApiRoot']).to match %r{^/[\w/]+$}
    expect(parsed['host']).to match /^(\d+(\.|$)){4}$/
    expect(parsed['port']).to be_a(Fixnum)
  end
end
