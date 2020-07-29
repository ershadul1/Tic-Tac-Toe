class Move
  def initialize(input)
    @input = input
  end
  attr_accessor :input

  def validate(arr, arr_two)
    if arr.count(@input).positive? && !arr_two.count(@input).positive? && @input != 'X' && @input != 'O'
      true
    else
      false
    end
  end

  def apply_input(arr, ite)
    arr[@input.to_i - 1] = ite.odd? ? 'X' : 'O'
  end
end
