# Add a class method to your MyCar class that calculates the gas mileage (i.e. miles per gallon) of any car.
class MyCar
    attr_accessor :color
    attr_reader :year

    def initialize(year, color, model)
        @year=year
        @color=color
        @model=model 

        @current_speed=0
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
  
my_car = MyCar.new("2010", "Ford Focus", "silver")
puts my_car  # => My car is a silver, 2010, Ford Focus.

## Note the "puts" calls "to_s" automatically.