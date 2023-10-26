# Create a class called MyCar. When you initialize a new instance 
# or object of the class, allow the user to define some instance 
# variables that tell us the year, color, and model of the car. 
# Create an instance variable that is set to 0 during instantiation 
# of the object to track the current speed of the car as well. 
# Create instance methods that allow the car to speed up, brake, and shut the car off.
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
end

lumina = MyCar.new(1997, 'white', 'chevy lumina')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_off
lumina.current_speed
lumina.color = 'black'
puts lumina.color
puts lumina.year
lumina.spray_paint('red')   #=> "Your new red paint job looks great!"