# Critical [![Build Status](https://travis-ci.org/glebm/critical-rubygem.svg?branch=master)](https://travis-ci.org/glebm/critical-rubygem)

This gem provides a Ruby wrapper for the [critical] npm package.

The npm package is "built" during gem installation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'critical', '~> 0.1.2'
```

And then execute:

```bash
bundle
```

## Usage

```ruby
Critical.generate(options)
```

The options are passed directly to [critical].

You can also pass JavaScript regexes as strings, like this:

```ruby
Critical.generate(
  ignore: [
    {RegExp: '\.fa-(?!fw|lg|inline|inverse|spin|stack)'}
  ]
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you
to experiment.

To update critical to the latest npm version, run:

```bash
rake update
```

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release`, which will create a git tag
for the version, push git commits and tags,
and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub
at https://github.com/glebm/critical-rubygem. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to adhere
to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of
the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Critical project’s codebases, issue trackers,
chat rooms and mailing lists is expected to follow the [code of conduct].


[critical]: https://github.com/addyosmani/critical
[code of conduct]: https://github.com/glebm/critical-rubygem/blob/master/CODE_OF_CONDUCT.md 
