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

end
  
MyCar.gas_mileage(13, 351)  # => "27 miles per gallon of gas"
