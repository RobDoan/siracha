# Remove unit test folder
remove_dir 'test'

# add test helpers
generate 'rspec:install'
remove_dir 'spec'
directory 'spec'