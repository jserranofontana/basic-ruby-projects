def get_max_value(stock_data, min_value, min_value_idx)
    stock_data[min_value_idx+1, stock_data.length].each_with_index.max
  end
    
  def stock_picker(stock_data)
    max_profit = 0
    min_value, min_value_idx = stock_data.each_with_index.max
    max_value = nil
    max_value_idx = nil
    
    # Traverse stock values to find best profit
    stock_data.each_with_index do |value, idx|
      if value < min_value
        # There's a candidate. Is there a profit.
        tmp_value, tmp_value_idx = get_max_value(stock_data, value, idx)
        if tmp_value
          # A valid candidate, check profit
          if (tmp_value - value) > max_profit
            # We hava a winner
            max_value = tmp_value
            max_value_idx = tmp_value_idx + idx + 1
            max_profit = (max_value - value)
            min_value = value
            min_value_idx = idx
            #puts "#{min_value}-#{min_value_idx},#{max_value}-#{max_value_idx} (#{max_profit})"
          end        
        end 
      end
    end 
    # Finally, return min_value_idx, max_value_idx and profit
    # puts "#{min_value}-#{min_value_idx},#{max_value}-#{max_value_idx} (#{max_profit})"
    if max_value_idx
      return "[#{min_value_idx},#{max_value_idx}]\t# for a profit of $#{max_value} - $#{min_value} == $#{max_profit}"
    else
      return "There's no ideal solution"
    end
  end
      
  puts stock_picker([17,3,6,9,15,8,6,1,10])
  puts stock_picker([17,3,6,9,10,8,6,1,10])
  puts stock_picker([17,16,15,14,13,12,11,10,9])

