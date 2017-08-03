if options[:devise]
  gem 'devise'
  @after_bundle_callbacks << lambda {
    bundle_command("exec spring stop")
    generate "devise:install"
    model_name = options[:devise]
    generate "devise", model_name
  }
end