class Integer
  def to_ordinal
    [:unison, :second, :third, :fourth, :fifth, :sixth, :seventh, :octave, :ninth, :tenth, :eleventh, :twelth, :thirteenth][self-1]
  end
end
