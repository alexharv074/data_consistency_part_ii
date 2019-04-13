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
    json_data = File.read('files/config.json')
    expect { JSON.parse(json_data) }.to_not raise_error
  end
end
