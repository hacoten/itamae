require 'spec_helper'

# describe command('jps | grep NameNode') do
#   its(:exit_status) { should eq 0 }
# end

# init
## set_timezone
describe command('systemctl status chronyd') do
  its(:exit_status) { should eq 0 }
end

## jst check
describe command('date | grep JST') do
  its(:exit_status) { should eq 0 }
end

# SELinux should be disabled
describe selinux do
  it { should be_disabled }
end

## git
describe package('git') do
  it { should be_installed }
end

## epel repo
describe yumrepo('epel') do
  it { should exist }
end
describe yumrepo('epel') do
  it { should be_enabled }
end

## mlocate
describe package('mlocate') do
  it { should be_installed }
end


# web
## nginx
### nginx package
describe package('nginx') do
  it { should be_installed }
  # it { should be_installed.with_version "1.8.0" }
end
### nginx service status
describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end
### port check
describe port(80) do
  it { should be_listening }
end
describe port(443) do
  it { should be_listening }
end

# database
## postgresql
describe package('postgresql') do
  it { should be_installed }
end
### postgresql service status
describe service('postgresql') do
  it { should be_enabled }
  it { should be_running }
end
### port check
describe port(5432) do
  it { should be_listening }
end
### psql check
describe command("psql -U postgres -c \"select passwd from pg_shadow\" | tail -n+3 | head -n-2 | grep -v \"md5\" -c") do
  its(:stdout) { should match(/^0/) }
end

# AWS
# describe user('root') do
#   it { should exist }
# end