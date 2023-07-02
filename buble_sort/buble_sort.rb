def bubble_sort(data)
  n = data.length
  while n >= 1 do
    newn = 0
    for i in 1..(n-1)
      if data[i-1] > data[i]
        data[i-1], data[i] = data[i], data[i-1]
        newn = i
      end
    end
    n = newn
  end
  return data
end

new_data = bubble_sort([4,3,78,2,0,2])
puts(new_data)