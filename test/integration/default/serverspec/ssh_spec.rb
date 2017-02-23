require_relative 'spec_helper.rb'
require 'serverspec'

set :backend, :exec
set :os, :family => 'linux'

describe file('/etc/dropbear/authorized_keys') do
  it { should be_file }
end

describe file('/etc/hosts') do
  it { should be_file }
end


describe file('/etc/init.d') do
  it { should be_directory }
end


describe port(22) do
  it { should be_listening }
end
