require 'note'
require 'interval'

class Chord

  def initialize(root, abstract_chord)
    @root = root
    @abstract_chord = abstract_chord
    @notes = [root] + abstract_chord.intervals.map {|interval| root.add(interval) }
  end

  attr_reader :note, :abstract_chord, :notes

end
