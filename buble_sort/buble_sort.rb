def bubble_sort(data)
  data.length.downto(1) do |n|
    (1..(n-1)).each do |i|
      if data[i-1] > data[i]
        data[i-1], data[i] = data[i], data[i-1]
        n = i
      end
    end
  end
  data
end

new_data = bubble_sort([4,3,78,2,0,2])
puts(new_data)