module Board
  def display_board(arr)
    puts " #{arr[0]} | #{arr[1]} | #{arr[2]}"
    puts '---|---|---'
    puts " #{arr[3]} | #{arr[4]} | #{arr[5]}"
    puts '---|---|---'
    puts " #{arr[6]} | #{arr[7]} | #{arr[8]}"
  end

  def win_checker(arr)
    if arr[0] == arr[1] && arr[1] == arr[2]
      arr[0]
    elsif arr[3] == arr[4] && arr[4] == arr[5]
      arr[3]
    elsif arr[6] == arr[7] && arr[7] == arr[8]
      arr[6]
    elsif arr[0] == arr[3] && arr[3] == arr[6]
      arr[0]
    elsif arr[1] == arr[4] && arr[4] == arr[7]
      arr[1]
    elsif arr[2] == arr[5] && arr[5] == arr[8]
      arr[2]
    elsif arr[0] == arr[4] && arr[4] == arr[8]
      arr[0]
    elsif arr[2] == arr[4] && arr[4] == arr[6]
      arr[2]
    else
      -1
    end
  end
end

arr = %w[O 2 X O X 6 O 8 X]

display_board(arr)

if win_checker(arr) == 'X'
  puts 'Winner is Player-1'
elsif win_checker(arr) == 'O'
  puts 'Winner is Player-2'
else
  puts 'Draw'
end
