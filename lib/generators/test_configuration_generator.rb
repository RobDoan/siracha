module Siracha
  module Generators
    class RspecGenerator < Rails::Generators::Base
      hide!
      source_root File.expand_path("../../../templates/rspec", __FILE__)
      desc "blabaalanalanla"

      def generate_test
        generate 'rspec:install'
        copy_file "rails_helper.rb", "spec/rails_helper.rb"
        copy_file "spec_helper.rb", "spec/spec_helper.rb"
      end
    end
  end
end