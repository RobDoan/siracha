gem 'simple_form'

after_bundle do
  bundle_command("exec spring stop")
  generate "simple_form:install --bootstrap"
end
