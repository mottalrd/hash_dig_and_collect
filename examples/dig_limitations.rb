# This example demonstrates the limitations of dig when
# you have Arrays in your nested Hash

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

puts client_with_many_addresses.dig(:addresses, :location, :latitude)
