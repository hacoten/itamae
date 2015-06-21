# postgresql

## variable
data_dir = node["postgresql"]["data_dir"]
user = node["postgresql"]["user"]
passwd = node["postgresql"]["passwd"]

## install
package 'postgresql-server' do
  action :install
end

## service stop
service 'postgresql' do
  action [:stop]
end

## init db
execute "postgresql-init" do
  user "postgres"
  command "initdb --encoding=UTF8 --no-locale --pgdata=#{data_dir}"
  only_if "test -z \"`ls #{data_dir}`\"" # only empty directory
end

template "#{data_dir}/postgresql.conf" do
  source :auto
  mode "600"
  owner "postgres"
  group "postgres"
end

template "#{data_dir}/pg_hba.conf" do
  source :auto
  mode "600"
  owner "postgres"
  group "postgres"
end

## service start
service 'postgresql' do
  action [:start]
end

## password
execute "password" do
  user "postgres"
  command "psql -U postgres -c \"ALTER USER #{user} with password '#{passwd}'\" && touch #{data_dir}/passwd_created"
  not_if "test -e #{data_dir}/passwd_created"
end

## service stop
service 'postgresql' do
  action [:stop]
end

## service start
service 'postgresql' do
  action [:enable, :start]
end