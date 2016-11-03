# Ruby Hash#dig_and_collect

The introduction of the Hash#dig  method in Ruby 2.3 completely changed the way I navigate deeply nested hashes. 

Inspired by Hash#dig this repo contains an implementation of Hash#dig_and_collect, a new utility method to navigate even more complex nested hashes without messing up your code. 

See the details of the why in this [Blog post](http://www.alfredo.motta.name/making-ruby-hashdig-even-more-awesome-introducing-hashdig_and_collect).

It is really handy when you want to handle Hashes like:

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
```

by writing 

```
client_with_many_addresses.dig_and_collect(:addresses, :location, :latitude)
```