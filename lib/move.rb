class Move
  def initialize(input)
    @input = input
  end
  attr_accessor :input

  def validate(arr)
    if [*1..9].count(@input.to_i).positive? && arr.count(@input).positive?
      true
    else
      false
    end
  end

  def apply_input(arr, ite)
    arr[@input.to_i - 1] = ite.odd? ? 'X' : 'O'
  end
end
