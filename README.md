## Siracha

Siracha is a rails generator I create to init project with `project_name` and some practice gems that I usually used.

## Installation

Install siracha:

    gem install siracha
    
Then run: 
  
    siracha projectname 
    
to create a rails app.

Rails application will be generate with gems:

- [Simple form][simpleform] 
- [Devise][devise]
- [Cucumber][cucumber]
- [Rspec][rspec]
- [haml-lint][haml-lint]  
- [scss-lint][scss_lint]  
- [Rubocop][rubocop]
- [foreman][foreman]
- [benchmark-ips][benchmark-ips]
- [knapsack][knapsack]
- [stackprof][stackprof]
- [factory_girl][factory_girl]
- [Autoprefixer Rails][autoprefix-rails]
- [Title][title-gem]
- [Bundler Audit][bundler-audit]
- [Timecop][timecop] for testing time

run `siracha --help` for more info

## Using

I make it for me to be easier to add configuration step for generating next project. So I split each setting in to files.
You can add your setting by create a new file to `steps`. 

## TODO 

- [ ] Init Angular4 app
- [ ] Init Reactjs app with Redux, GraphQL, Immutable, and Replay
- [ ] Deploy to heroku 
- [ ] Dockers


[simpleform]: https://github.com/plataformatec/simple_form
[devise]: https://github.com/plataformatec/devise
[cucumber]: https://github.com/cucumber/cucumber
[rspec]: https://github.com/rspec/rspec
[haml-lint]: https://github.com/brigade/haml-lint
[scss_lint]: https://github.com/brigade/scss-lint
[rubocop]: https://github.com/bbatsov/rubocop
[foreman]: https://github.com/ddollar/foreman
[benchmark-ips]: https://github.com/evanphx/benchmark-ips
[knapsack]: https://github.com/ArturT/knapsack
[stackprof]: https://github.com/tmm1/stackprof
[factory_girl]: https://github.com/thoughtbot/factory_girl
[autoprefix-rails]: https://github.com/ai/autoprefixer-rails
[title-gem]: https://github.com/calebthompson/title
[bundler-audit]: https://github.com/rubysec/bundler-audit
[timecop]: https://github.com/travisjeffery/timecop

[material]: https://material.angular.io/
