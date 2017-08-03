gem 'title'
gem 'webpacker'
gem 'nokogiri'

data_development_test_gem_group = <<-GEMGROUP
  gem 'foreman'
  gem 'brakeman', require: false
GEMGROUP

inject_into_file('Gemfile', "\n" + data_development_test_gem_group, after: /group\s?\:development,\s?\:test\s+do/)
inject_into_file('Gemfile', "\n" + File.read(File.join(template_folder, 'Gemfile.development')), after: /group\s?\:development\s+do/)

gem_group :test do
  gem 'capybara-webkit', version: '~> 1.14.0'
  gem 'cucumber-rails', require: false
  gem 'rspec-rails', version: '~> 3.6.0'
  gem 'spreewald'
  gem 'poltergeist', version: '~> 1.9.0'
  gem 'capybara-screenshot', version: '~> 1.0.0'
  gem 'fuubar', version: '~> 2.2.0'
  gem 'rspec-retry'
  gem 'rspec_profiling'
  gem 'rspec-set'
  gem 'database_cleaner'
  gem 'formulaic'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'email_spec'
  gem 'json-schema'
  gem 'test_after_commit'
  gem 'sham_rack'
  gem 'timecop'
  gem 'webmock'
end

gem_group :development, :staging do
  gem 'rack-mini-profiler', require: false
end
