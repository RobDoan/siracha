if yes?("Do you want to install devise?")
  gem 'devise'
  after_bundle do
    bundle_command("exec spring stop")
    generate "devise:install"
    model_name = ask("What is modal name[user]?")
    model_name = 'user' if model_name.blank?
    generate "devise", model_name
  end
end