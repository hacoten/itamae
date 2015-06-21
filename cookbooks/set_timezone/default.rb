# set_timezone

## ntpd stop ( centos7 )
execute "disable ntpd" do
  user "root"
  command <<-EOH
    systemctl stop ntpd
    systemctl disable ntpd
  EOH
  only_if "systemctl status ntpd"
end

## chrony install
package "chrony" do
  action :install
end

## copy file
remote_file "/etc/chrony.conf" do
  owner "root"
  group "root"
  source "files/etc/chrony.conf"
end

service 'chronyd' do
  action [:enable, :start]
end

## timezone
execute "change jst" do
  user "root"
  command "timedatectl set-timezone Asia/Tokyo"
  not_if "date | grep JST"
end
