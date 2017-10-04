if @install_devise
  gem 'devise'
  after_bundle do
    bundle_command("exec spring stop")
    generate "devise:install"
    @devise_modal_name = 'user' if @devise_modal_name.blank?
    generate "devise", @devise_modal_name
  end
end