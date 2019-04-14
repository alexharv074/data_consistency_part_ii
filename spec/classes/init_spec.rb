require 'spec_helper'
require 'yaml'

describe 'hiera' do
  it 'compiles' do
    is_expected.to compile
    File.write('catalogs/hiera.json', PSON.pretty_generate(catalogue))
  end

  it 'datadir in hiera.yaml should be correct' do
    yaml_data = catalogue
      .resource('file', '/etc/puppetlabs/puppet/hiera.yaml')
      .send(:parameters)[:content]
    parsed = YAML.load(yaml_data)
    expect(parsed[:"yaml"][:"datadir"])
      .to eq '/etc/puppetlabs/code/environments/%{::environment}/hieradata'
  end
end
