require 'rails/generators'
require 'rails/generators/rails/app/app_generator'
require 'siracha/version'

module Siracha
  autoload :ActionMethods, 'siracha/action_methods'
  autoload :AppBuilder, 'siracha/app_builder'
  autoload :AppGenerator, 'siracha/app_generator'
end
