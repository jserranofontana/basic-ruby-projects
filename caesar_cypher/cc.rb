class String
  def caesar_cypher(shift)
    self.each_char do |i|
        shifted_char = shift_char(i, shift)
        puts shifted_char
    end
  end  

  private 
  def is_upcase? x 
    ('A'..'Z').cover? x
  end

  def is_lowcase? x 
    ('a'..'z').cover? x
  end

  def shift_char(character, shift)
    lower_range = ('a'.ord..'z'.ord)
    upper_range = ('A'.ord..'Z'.ord)

    if is_lowcase?(character)
      range = lower_range
    elsif is_upcase?(character)
      range = upper_range
    else
      return self
    end
    # (startingValue - minimumValue + (offset % modulus) + modulus) % modulus + minimalValue
    ((character.ord - range.begin + (shift % range.size) + range.size) % range.size + range.begin).chr()
  end  
end

'Hola'.caesar_cypher(1)
