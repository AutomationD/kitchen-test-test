require 'rubygems'
require 'bundler/setup'

require 'serverspec'
require 'pathname'
require 'net/ssh'

RSpec.configure do |config|
  set :host, ENV['KITCHEN_HOSTNAME']
  # ssh options at http://net-ssh.github.io/net-ssh/Net/SSH.html#method-c-start
  # ssh via ssh key (only)
  set :ssh_options,
    :user => ENV['KITCHEN_USERNAME'],
    :port => ENV['KITCHEN_PORT'],
    :password => ENV['KITCHEN_PASSWORD'],
    :auth_methods => [ 'publickey','password' ],
    :keys => [ ENV['KITCHEN_SSH_KEY'] ],
    :keys_only => false,
    :paranoid => false,
    :verbose => :debug
  set :backend, :ssh
  set :request_pty, true
end
