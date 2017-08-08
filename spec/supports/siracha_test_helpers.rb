# These code was adapted from Suspenders gems of [thoughtbot](https://thoughtbot.com/)
module SirachaTestHelpers
  APP_NAME = "dummy_app"

  def remove_project_directory
    FileUtils.rm_rf(project_path)
  end

  def create_tmp_directory
    FileUtils.mkdir_p(tmp_path)
  end

  def run_siracha(arguments = [], config={})
    args = [APP_NAME] + arguments
    templates_root = File.expand_path(File.join("../../", "templates"), File.dirname(__FILE__))
    Siracha::AppGenerator.source_root templates_root
    Siracha::AppGenerator.source_paths << Rails::Generators::AppGenerator.source_root << templates_root
    silence_stream($stdout) do
      Dir.chdir(tmp_path) do
        with_env('BUNDLE_GEMFILE', nil) do
          Siracha::AppGenerator.start(args, { destination_root: tmp_path }.merge(config))
        end
      end
    end
  end

  def siracha_help_command
    Dir.chdir(tmp_path) do
      Bundler.with_clean_env do
        `
        #{siracha_bin} -h
        `
      end
    end
  end

  def shell
    Thor::Base.shell.new
  end

  def setup_app_dependencies
    if File.exist?(project_path)
      Dir.chdir(project_path) do
        Bundler.with_clean_env do
          `bundle check || bundle install`
        end
      end
    end
  end

  def drop_dummy_database
    if File.exist?(project_path)
      Dir.chdir(project_path) do
        Bundler.with_clean_env do
          `rails db:drop`
        end
      end
    end
  end

  def project_path
    @project_path ||= Pathname.new("#{tmp_path}/#{APP_NAME}")
  end

  def usage_file
    @usage_path ||= File.join(root_path, "USAGE")
  end

  private

  def tmp_path
    @tmp_path ||= Pathname.new("#{root_path}/tmp")
  end

  def siracha_bin
    File.join(root_path, 'bin', 'siracha')
  end


  def root_path
    File.expand_path('../../../', __FILE__)
  end

  def with_env(name, new_value)
    prior = ENV[name]
    ENV[name] = new_value.to_s

    yield

  ensure
    ENV[name] = prior
  end
end
