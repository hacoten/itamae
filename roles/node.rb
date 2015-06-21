# roles

# In the future, "default.rb" can be omitted.

## init server
include_recipe "../cookbooks/package_update/default.rb"
include_recipe "../cookbooks/set_timezone/default.rb"
include_recipe "../cookbooks/selinux/default.rb"
include_recipe "../cookbooks/git/default.rb"
include_recipe "../cookbooks/mlocate/default.rb"
include_recipe "../cookbooks/vim/default.rb"

## web server
include_recipe "../cookbooks/ssl/default.rb"
include_recipe "../cookbooks/nginx/default.rb"

## db server
include_recipe "../cookbooks/postgresql/default.rb"

