# Nerdier

It is a ruby gem which provides an interface to NERD http://nerd.eurecom.fr

## Installation

Add this line to your application's Gemfile:

    gem 'nerdier'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nerdier

## Usage

    export NERD_API="your nerd api"
    bundle exec irb
    require 'nerdier'
    nerd = Nerdier::Nerd.new
    entities = nerd.extract("http://www.bbc.co.uk/news/uk-england-london-22385389")
	

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
