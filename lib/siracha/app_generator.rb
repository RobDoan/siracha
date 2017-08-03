module Siracha
  class AppGenerator < ::Rails::Generators::AppGenerator
    #  Default database is postgres
    hide!
    class_option :database,           type: :string, aliases: "-d", default: "postgresql",
                 desc: "Preconfigure for selected database (options: #{DATABASES.join('/')})"

    class_option :devise, type: :string, default: nil, banner: 'ModelName',
                 desc: "Preconfigure for authorization default user"


    private
      def get_builder_class
        Siracha::AppBuilder
      end

      def template_folder
        File.expand_path( '../../templates/', __dir__)
      end
  end
end