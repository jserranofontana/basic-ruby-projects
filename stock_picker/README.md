## Assignment
Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

    stock_picker([17,3,6,9,15,8,6,1,10])
    => [1,4]  # for a profit of $15 - $3 == $12

## Quick Tips:
You need to buy before you can sell
Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

## What I used
Ruby arrays (mainly **each_with_index** and **max** method)

## What I learned
How to use array's **each_with_index** method. Traverse an array elements and run a block of code.