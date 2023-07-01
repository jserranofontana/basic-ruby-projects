def substrings(text, dictionary)
    result = dictionary.reduce(Hash.new('')) do |result, word| 
      result[word] = text.scan(/#{word}/i).length
      result
    end
    result.select{|word, occurences| occurences > 0}
  end
  
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)