# I18nAccessors

[![Gem Version](https://badge.fury.io/rb/i18n_accessors.svg)][gem]
[![Build Status](https://travis-ci.org/shioyama/i18n_accessors.svg?branch=master)][travis]

[gem]: https://rubygems.org/gems/i18n_accessors
[travis]: https://travis-ci.org/shioyama/i18n_accessors

Define locale accessors for your translated attributes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'i18n_accessors', '~> 0.1.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install i18n_accessors

## Usage

### Accessor Methods

To define a set of accessors for a translated attribute of the form
`<attribute>_<locale>`, include an instance of the `I18nAccessors::Methods`
class in your model with translated attribute names as arguments:

```ruby
class Post

  def title
    # ...
  end

  def title?
    # ...
  end

  def title=(title)
    # ...
  end

  include I18nAccessors::Methods.new(:title)
end
```
By default, `I18n.available_locales` will be used to determine which locales to
define accessors for. So if `I18n.available_locales` is `[:en, :fr]`, then this
will define methods: `title_en`, `title_en?`, `title_en=`, `title_fr`,
`title_fr?` and `title_fr=`. Each of these methods is an alias to `title` (or
`title?`, or `title=`) with `I18n.locale` changed to the locale in the suffix.

If you want to specify explicitly which locales to define accessors for, pass
the locales as an option with the `locales` key to `new` when creating the
module:

```ruby
def Post

  # ...

  include I18nAccessors::Methods.new(:title, :content, locales: [:en, :fr])
end
```

This will define accessor methods for both `title` and `content`, in both
English (`en`) and French (`fr`).

### Method Missing

`I18nAccessors::Missing` does a similar thing, but using `method_missing` to
respond to messages of the form `<attribute>_<locale>`. This is generally
slower (due to how `method_missing` works), but can be used to handle *any* locale:

```ruby
class Post

  # ...

  include I18nAccessors::Missing.new(:title, :content)
end
```

No options are accepted to the constructor for this class.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shioyama/i18n_accessors. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
