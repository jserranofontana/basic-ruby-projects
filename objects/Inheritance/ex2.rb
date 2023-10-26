# Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.
# Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.
class Vehicle
    attr_accessor :color
    attr_reader :year

    @@number_of_vehicles = 0

    def self.number_of_vehicles
      puts "This program has created #{@@number_of_vehicles} vehicles"
    end

    def initialize(year, color, model)
        @year=year
        @color=color
        @model=model 

        @current_speed=0

        @@number_of_vehicles += 1;
    end

    def speed_up(value)
        @current_speed += value
        puts "You push the gas and accelerate #{value} mph."
    end

    def brake(value)
        @current_speed -= value
        puts "You push the brake and decelerate #{value} mph."
    end

    def current_speed
        puts "You are now going #{@current_speed} mph."
    end

    def shut_off()
        @current_speed = 0
        puts "Let's park this bad boy!"
    end

    def spray_paint(new_color)
        self.color = new_color
        puts "Your new #{color} paint job looks great!"
    end

    def self.gas_mileage(gallons, miles)
        puts "#{miles / gallons} miles per gallon of gas"
    end

    def to_s()
        puts("My car is a #{color}, #{year}, #{@model}!")
    end
end

class MyCar < Vehicle
    NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
    NUMBER_OF_DOORS = 2
end

my_car = MyCar.new("2010", "Ford Focus", "silver")
puts MyCar.number_of_vehicles