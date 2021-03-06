if @install_rubocop
  gem 'rubocop', '~> 0.49.1', require: false, group: [:development, :test]
  gem 'rubocop-rspec', '~> 1.15.1', require: false, group: [:development, :test]
  template 'rubocop/.rubocop.yml.erb', '.rubocop.yml'
  after_bundle do
    bundle_command 'exec rubocop --auto-gen-config --exclude-limit 0'
  end
end