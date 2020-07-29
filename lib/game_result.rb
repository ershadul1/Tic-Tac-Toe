class GameResult
  def equality_checker(arg1, arg2, arg3)
    return true if arg1 == arg2 && arg2 == arg3
  end

  def win_checker(arr)
    [0, 3, 6].each { |i| return arr[i] if equality_checker(arr[i], arr[i + 1], arr[i + 2]) }
    [0, 1, 2].each { |i| return arr[i] if equality_checker(arr[i], arr[i + 3], arr[i + 6]) }
    return arr[0] if equality_checker(arr[0], arr[4], arr[8])
    return arr[2] if equality_checker(arr[2], arr[4], arr[6])
  end
end
