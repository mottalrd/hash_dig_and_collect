## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hash_dig_and_collect'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_dig_and_collect

## Usage

Hash#dig  in Ruby 2.3 completely changed the way I navigate deeply nested hashes. This repo contains an implementation of 
Hash#dig_and_collect, a new utility method to navigate even more complex nested hashes without messing up your code. 

See the details of the why in this [Blog post](http://www.alfredo.motta.name/making-ruby-hashdig-even-more-awesome-introducing-hashdig_and_collect).

```
client_with_many_addresses = {
  details: {
    first_name: "Florentino",
    last_name: "Perez"
  },
  addresses: [
    {
      type: "home",
      postcode: "SE1 9SG",
      street: "London Bridge St",
      number: 32,
      city: "London",
      location: {
        latitude: 51.504382,
        longitude: -0.086279
      }
    },
    {
      type: "office",
      postcode: "SW1A 1AA",
      street: "Buckingham Palace Road",
      number: nil,
      city: "London",
      location: {
        latitude: 51.5013673,
        longitude: -0.1440787
      }
    }
  ]
}

client_with_many_addresses.dig_and_collect(:addresses, :location, :latitude)
# [51.504382, 51.5013673]
```

## Contributing

1. Fork it ( https://github.com/mottalrd/hash_dig_and_collect/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
