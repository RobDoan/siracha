module Siracha
  class AppBuilder < ::Rails::AppBuilder

    def app
      before_build_app
      super
    end

    def leftovers
      configure_generators
      set_ruby_to_version_being_used
      Dir[load_file_root + '/*.rb'].each do |file|
        apply file
      end
    end

    def load_file_root
      File.expand_path("../steps/", File.dirname(__FILE__))
    end

    private

    def before_build_app
      apply File.join(__dir__, 'before_build.rb')
    end

    def configure_generators
      config = <<-RUBY
        config.generators do |generate|
          generate.helper false
          generate.javascripts false
          generate.request_specs false
          generate.routing_specs false
          generate.stylesheets false
          generate.test_framework :rspec
          generate.view_specs false
        end
      RUBY
      inject_into_class 'config/application.rb', 'Application', config
    end

    def set_ruby_to_version_being_used
      create_file '.ruby-version', "#{Siracha::RUBY_VERSION}\n"
    end

  end
end