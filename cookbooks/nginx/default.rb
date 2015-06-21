# nginx

## dependencies
include_recipe "../epel/default.rb"
include_recipe "../ssl/default.rb"

## install
package 'nginx' do
  action :install
end

## service stop
service 'nginx' do
  action [:stop]
end

remote_file "/etc/nginx/nginx.conf" do
  user "root"
  source :auto
  mode "644"
  owner "root"
  group "root"
end

template "/etc/nginx/conf.d/node.conf" do
  user "root"
  source :auto
  mode "644"
  owner "root"
  group "root"
end

remote_directory "/var/www/html" do
  source "files/var/www/html"
  mode "755"
  owner "root"
  group "root"
end

# execute "copy file" do
#   user "root"
#   command "cp -pr /usr/share/nginx/html/* #{node["nginx"]["doc_root"]}"
#   only_if "test -e /usr/share/nginx/html"
# end

## service start
service 'nginx' do
  action [:enable, :start]
end

# template "/etc/nginx/conf.d/site" do
#   source "nginx/site.erb"
#   notifies :reload, "service[nginx]"
# end

# service "nginx" do
#   action :restart
# end

# remote_file "/etc/nginx/conf.d/static.conf"
# template "/etc/nginx/conf.d/dynamic.conf"


