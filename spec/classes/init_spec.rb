require 'spec_helper'
require 'inifile'

describe 'puppet::agent' do
  it 'compiles' do
    is_expected.to compile
    File.write('catalogs/puppet__agent.json', PSON.pretty_generate(catalogue))
  end

  it 'should contain file /etc/puppetlabs/puppet/puppet.conf' do
    is_expected.to contain_file('/etc/puppetlabs/puppet/puppet.conf').with({
      'ensure' => 'present',
      'owner' => 'root',
      'group' => 'root',
      'mode' => '0444',
    })
  end

  it 'certname in /etc/puppetlabs/puppet/puppet.conf should be correct' do
    inifile_data = catalogue
      .resource('file', '/etc/puppetlabs/puppet/puppet.conf')
      .send(:parameters)[:content]
    parsed = IniFile.new(:content => inifile_data)
    expect(parsed.sections).to eq ['main']
    expect(parsed['main']['certname']).to eq 'agent01.example.com'
  end
end
