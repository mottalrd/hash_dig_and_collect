# This example demonstrates how complicated it could
# get without dig_and_collect and why it is a good idea
# to have it

require_relative 'lib/hash'

client_with_no_addresses = {
  details: {
    first_name: "Florentino",
    last_name: "Perez"
  },
  addresses: nil
}

client_with_one_address = {
  details: {
    first_name: "Florentino",
    last_name: "Perez"
  },
  addresses:  {
    type: "home",
    postcode: "SE1 9SG",
    street: "London Bridge St",
    number: 32,
    city: "London",
    location: {
      latitude: 51.504382,
      longitude: -0.086279
    }
  }
}

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

def get_offices_latitudes_for(client)
  addresses = client[:addresses]
  return [] if addresses.nil?

  if addresses.is_a? Hash
    [ addresses.dig(:location, :latitude) ]
  else
    addresses.map { |address| address.dig(:location, :latitude) }
  end
end

puts get_offices_latitudes_for(client_with_no_addresses).join(", ")
puts get_offices_latitudes_for(client_with_one_address).join(", ")
puts get_offices_latitudes_for(client_with_many_addresses).join(", ")

puts client_with_no_addresses.dig_and_collect(:addresses, :location, :latitude)
puts client_with_one_address.dig_and_collect(:addresses, :location, :latitude)
puts client_with_many_addresses.dig_and_collect(:addresses, :location, :latitude)
