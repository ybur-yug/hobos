# Hobo API/Module

A simple wrapper to return hobos.

## Why?

Fuck off and read a hobo name.

## Installation:

```BASH
git clone 'https://www.github.com/rhgraysonii/hobo_api.git'
cd hobo_api
gem build hobo_api.gemspec
gem install hobo_api.gem
cd ..
```

Add it to your Gemfile

`gem "hobo_api"

And now you can simply

```RUBY
api = Hobos::HoboAPI.new
api.hobo 1
# => 'Stewbuilder Dennis'
```
