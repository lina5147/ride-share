########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?

# layers: - driver_id, rides, Date, cost, rider_id, rating
# The first layer would be the drivers ID and their rides
# Within each ride would have 4 layers next to each other
# including the date, cost, rider id and rating

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# layers: - driver_id, rides, date, cost, rider_id, rating
# The first layer would be a hash
# driver_id as the keys and rides as their values
# the rides for each driver would be in an array format
# within each ride would be a hash of data for that ride
# the hash will include the rider_id, date, cost, and rating



########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

ride_share_drivers = {
  DR0001: [
    {
      rider_id: "RD0003",
      date: "3rd Feb 2016",
      cost: 10,
      rating: 3
    },
    {
      rider_id: "RD0015",
      date: "3rd Feb 2016",
      cost: 30,
      rating: 4
    },
    {
      rider_id: "RD0003",
      date: "5th Feb 2016",
      cost: 45,
      rating: 2
    }
  ],
  DR0002: [
    {
      rider_id: "RD0073",
      date: "3rd Feb 2016",
      cost: 25,
      rating: 5
    },
    {
      rider_id: "RD0013",
      date: "4th Feb 2016",
      cost: 15,
      rating: 1
    },
    {
      rider_id: "RD0066",
      date: "5th Feb 2016",
      cost: 35,
      rating: 3
    }
  ],
  DR0003: [
    {
      rider_id: "RD0066",
      date: "4th Feb 2016",
      cost: 5,
      rating: 5
    },
    {
      rider_id: "RD0003",
      date: "5th Feb 2016",
      cost: 50,
      rating: 2
    },
  ],
  DR0004: [
    {
      rider_id: "RD0022",
      date: "3rd Feb 2016",
      cost: 5,
      rating: 5
    },
    {
      rider_id: "RD0022",
      date: "4th Feb 2016",
      cost: 10,
      rating: 4
    },
    {
      rider_id: "	RD0073",
      date: "5th Feb 2016",
      cost: 20,
      rating: 5
    }
  ]
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?

def num_of_rides(driver_rides)
  return driver_rides.length
end

def total_earned(driver_rides)
  total_earned = driver_rides.map.sum { |ride| ride[:cost]}

  return total_earned
end

def average_rating(driver_rides)
  total_rating = driver_rides.map.sum { |ride| ride[:rating]}

  average = (total_rating.to_f / num_of_rides(driver_rides)).round(1)

  return average
end

puts "\n*DRIVER SUMMARIES*\n"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~"

# stores each driver's data regarding total rides, total earned, and average rating
driver_summaries = []

# invoke methods, finding the total rides, total earned, and average rating per driver
# stores and prints out each driver's data
ride_share_drivers.each do |driver, rides|
  hash_driver = {}

  hash_driver[:driver_id] = driver
  puts "\nDriver ID: #{driver}"

  hash_driver[:total_rides] = num_of_rides(rides)
  puts "Total Rides: #{hash_driver[:total_rides]}"

  hash_driver[:total_earned] = total_earned(rides)
  puts "Total Earned: $#{'%.2f' %hash_driver[:total_earned]}"

  hash_driver[:average_rating] = average_rating(rides)
  puts "Average Rating: #{hash_driver[:average_rating]}\n\n"
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~"

  # each driver's data will be stored into the array, driver_summaries
  driver_summaries << hash_driver
end

# method returns the driver ID of the highest earner
def highest_earner(drivers)
  # hash data for the highest earning driver
  highest_earner_data = drivers.max { |a, b| a[:total_earned] <=> b[:total_earned]}
  # extracts the driver ID
  highest_earner = highest_earner_data[:driver_id]
  return highest_earner
end

# method returns the driver ID of the highest rated
def highest_rated(drivers)
  # hash data for the highest rated driver
  highest_earner_data = drivers.max { |a, b| a[:average_rating] <=> b[:average_rating] }
  # extract the driver ID
  highest_rated = highest_earner_data[:driver_id]
  return highest_rated
end

# invokes the highest earner method and print results
highest_earned_driver = highest_earner(driver_summaries)
puts "\nHighest Earner: #{highest_earned_driver}"

# invokes the highest rated method and print results
highest_rated_driver = highest_rated(driver_summaries)
puts "Highest Rated: #{highest_rated_driver}\n\n"
