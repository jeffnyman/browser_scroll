# BrowserScroll

[![Gem Version](https://badge.fury.io/rb/browser_scroll.svg)](http://badge.fury.io/rb/browser_scroll)
[![License](http://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/jeffnyman/browser_scroll/blob/master/LICENSE.md)

This gem provides a small API on top of the JavaScript functionality that allows scrolling within the browser.

## Installation

To get the latest stable release, add this line to your application's Gemfile:

```ruby
gem 'browser_scroll'
```

To get the latest code:

```ruby
gem 'browser_scroll', git: 'https://github.com/jeffnyman/browser_scroll'
```

After doing one of the above, execute the following command:

    $ bundle

You can also install BrowserScroll just as you would any other gem:

    $ gem install browser_scroll

## Usage

There are two means of scrolling: one is based on the browser window and the other is relative to an element within the browser window.

### Browser Scrolling

The API provides a simple means of scrolling to the top, middle, or bottom of the page.

```ruby
browser.scroll.to.top
browser.scroll.to.middle
browser.scroll.to.bottom
```

It is also scroll to specific x and y coordinates as such:

```ruby
browser.scroll.to [30, 30]
```

Finally, it is also possible to scroll by an offset. You can provide a horizontal and vertical offset.

```ruby
browser.scroll.by 30, 10
```

This would scroll to the left by 30 pixels and down by 10 pixels.

```ruby
browser.scroll.by -30, -10
```

Here the negative values means this would scroll to the right by 30 pixels and up by 10 pixels.

You can chain the API calls:

```ruby
browser.scroll.to.top.by(0, 30)
```

This would scroll to the top of the page and then 30 pixels down.

### Element Scrolling

Unlike scrolling in the browser itself, you can scroll relative to an element. Consider the following element:

```ruby
search = @browser.button(text: 'Search')
```

The API provides a simple means of scrolling to the top, middle, or bottom of a given element.

```ruby
search.scroll.to.top
search.scroll.to.middle
search.scroll.to.bottom
```

Note that this is not referring to the top, middle and bottom of the element. Rather, what this is doing is scrolling the element to the top of the browser, to the middle of the browser, or to the bottom of the browser. There is a shorthand for scrolling an element to the top of the browser:

```ruby
search.scroll_to
```

Unlike the browser, you won't scroll to the coordinates of the element but you can scroll the element itself by horizontal and vertical offsets.

```ruby
search.scroll.by 30, 10
```

This would scroll the element to the left by 30 pixels and down by 10 pixels.

```ruby
search.scroll.by -30, -10
```

Here the negative values means this would scroll the element to the right by 30 pixels and up by 10 pixels.

You can chain the API calls:

```ruby
search.scroll_to.by(0, 30)
```

Here this scrolls to the element and then 30 pixels down.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake spec:all` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

The default `rake` command will run all tests as well as a RuboCop analysis.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/jeffnyman/browser_scroll](https://github.com/jeffnyman/browser_scroll). The testing ecosystem of Ruby is very large and this project is intended to be a welcoming arena for collaboration on yet another test-supporting tool. As such, contributors are very much welcome but are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

The BrowserScroll gems follows [semantic versioning](http://semver.org).

To contribute to BrowserScroll:

1. [Fork the project](http://gun.io/blog/how-to-github-fork-branch-and-pull-request/).
2. Create your feature branch. (`git checkout -b my-new-feature`)
3. Commit your changes. (`git commit -am 'new feature'`)
4. Push the branch. (`git push origin my-new-feature`)
5. Create a new [pull request](https://help.github.com/articles/using-pull-requests).

## Author

* [Jeff Nyman](http://testerstories.com)

## Credits

This code is based upon the [watir-scroll](https://github.com/p0deje/watir-scroll) gem. I wanted to create a more chained API than one that relied on symbols. I also wanted to remove the notion that this is Watir specific. While that is currently the case, future expansion will be about being able to scroll in the browser independent of Watir.

## License

BrowserScroll is distributed under the [MIT](http://www.opensource.org/licenses/MIT) license.
See the [LICENSE](https://github.com/jeffnyman/browser_scroll/blob/master/LICENSE.md) file for details.
