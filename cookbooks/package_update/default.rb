# package update

case node[:platform]
  when "ubuntu"
    execute 'apt-get-upgrade' do
      user "root"
      command 'apt-get upgrade -y'
    end

    execute 'apt-get update' do
      user "root"
      command 'apt-get update -y'
    end

  when "centos", "redhat"
    execute "update yum repo" do
      user "root"
      command "yum -y update"
    end
  # when "amazon"
end