require 'spec_helper'
require 'java-properties'

describe 'javaprops' do
  it 'compiles' do
    is_expected.to compile
    File.write('catalogs/javaprops.json', PSON.pretty_generate(catalogue))
  end

  it 'dataSource.username in /home/webapp/config.properties should be root' do
    java_properties = catalogue
      .resource('file', '/home/webapp/config.properties')
      .send(:parameters)[:content]
    parsed = JavaProperties.parse(java_properties)
    expect(parsed[:"dataSource.username"]).to eq '"root"'
  end
end
