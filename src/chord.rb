require 'note'
require 'interval'

class Chord
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

  def notes(root)
    [root] + intervals.map {|interval| root.add(interval) }
  end

  attr_reader :intervals

end
