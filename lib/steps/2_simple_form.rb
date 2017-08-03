if yes?("Do you want to install simple_form?")
  gem 'simple_form'
  @after_bundle_callbacks << ->(){
    generate "simple_form:install --bootstrap"
  }
end