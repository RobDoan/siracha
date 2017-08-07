module Siracha
  module Generators
    class BootstrapGenerator < Rails::Generators::AppBase
      hide!
      source_root File.expand_path("../../../templates/bootstrap", __FILE__)

      def add_gems
        gem 'bootstrap-sass', '~> 3.3.7'
      end

      def run_bundle_install
        bundle_command('install')
      end

      def css_template
        remove_file('app/assets/stylesheets/application.css')
        directory 'stylesheets', 'app/assets/stylesheets'
      end

      def js_configuration
        insert_into_file('app/assets/javascripts/application.js', "\n//= require bootstrap-sprockets\n", after: '//= require_tree .')
      end
    end
  end
end