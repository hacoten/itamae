# mlocate

## install
package "mlocate" do
  action :install
end

## updatedb
execute "updatedb" do
  user "root"
  command "updatedb"
end