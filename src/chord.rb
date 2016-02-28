class Chord
  @chords = Hash.new

  def initialize(*intervals)
  end

  def self.[](name)
    @chords[name]
  end

  def self.[]=(name, v)
    @chords[name] = v
  end

end
