require 'awesome_print'

ap "----------------- platform -----------------"
ap node[:platform]

ap "----------------- platform family -----------------"
ap node[:platform_family]

ap "----------------- platform version -----------------"
ap node[:platform_version]
ap node[:platform_version].to_i.to_s

ap "----------------- ipaddress -----------------"
ap node[:ipaddress]

ap "----------------- hostname -----------------"
ap node[:hostname]

ap "----------------- macaddress -----------------"
ap node['macaddress']

ap "----------------- fqdn -----------------"
ap node['fqdn']

ap "----------------- current_user -----------------"
ap node[:current_user]

ap "----------------- os -----------------"
ap node[:os]

ap "----------------- cpu -----------------"
ap node[:cpu]

ap "----------------- filesystem -----------------"
ap node[:filesystem]

ap "----------------- uptime -----------------"
ap node[:uptime]