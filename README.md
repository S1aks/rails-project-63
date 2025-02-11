# HexletCode
[![CI](https://github.com/S1aks/rails-project-63/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/S1aks/rails-project-63/actions/workflows/main.yml)
[![hexlet-check](https://github.com/S1aks/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/S1aks/rails-project-63/actions/workflows/hexlet-check.yml)
[![Minitest Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop-minitest)
[![Minitest Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://minitest.rubystyle.guide)

Form Generator is a DSL that makes it easy to save forms. This library takes on tasks that usually require writing a lot of boilerplate code, such as error handling. In the Rails world, Simple Form is used for this. Our generator is similar to it conceptually, but is much simpler.

## Installation

**`This is examle code, not for use!`**

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add hexlet_code
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install hexlet_code
```

## Usage

```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new job: 'hexlet'

form = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end

puts form
# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text" value="">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="hexlet">
#   <input type="submit" value="Wow">
# </form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/S1aks/hexlet_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/S1aks/hexlet_code/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/S1aks/hexlet_code/blob/master/CODE_OF_CONDUCT.md).
