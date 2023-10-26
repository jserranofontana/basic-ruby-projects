module Towable
    def can_tow?(pounds)
      pounds < 2000
    end
  end
  
  class Vehicle
    @@number_of_vehicles = 0
  
    def self.number_of_vehicles
      puts "This program has created #{@@number_of_vehicles} vehicles"
    end
  
    def self.gas_mileage(gallons, miles)
      puts "#{miles / gallons} miles per gallon of gas"
    end
  
    def initialize
      @@number_of_vehicles += 1
    end
  end
  
  class MyCar < Vehicle
    NUMBER_OF_DOORS = 4
    #code omitted for brevity...
  end
  
  class MyTruck < Vehicle
    include Towable
  
    NUMBER_OF_DOORS = 2
  end

  puts "---MyCar ancestors---"
  puts MyCar.ancestors

  puts "---MyTruck ancestors---"
  puts MyTruck.ancestors

  puts "---Vehicle ancestors---"
  puts Vehicle.ancestors