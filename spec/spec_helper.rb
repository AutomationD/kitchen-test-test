require 'rubygems'
require 'bundler/setup'

require 'serverspec'
require 'pathname'
require 'net/ssh'



RSpec.configure do |config|
  set :host, '127.0.0.1'
  # ssh options at http://net-ssh.github.io/net-ssh/Net/SSH.html#method-c-start
  # ssh via ssh key (only)
  set :ssh_options,
      :user => 'root',
      :password => 'root',
      :port => '2222',
      :auth_methods => [ 'password', 'publickey' ],
      :keys_only => false,
      :paranoid => false,
      :verbose => :debug
  set :backend, :ssh
  set :request_pty, true
end
