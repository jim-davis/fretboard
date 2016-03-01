require 'note'
require 'interval'

class AbstractChord
  @chords = Hash.new

  def initialize(*intervals)
    @intervals = intervals.map {|name| Interval[name]}
  end

  def self.[](name)
    @chords[name]
  end

  def self.[]=(name, v)
    @chords[name] = v
  end

  attr_reader :intervals

end
