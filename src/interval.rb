require 'ordinal'

class Interval

  def initialize(semitones, degree, modifier=nil)
    @semitones = semitones
    @degree = degree
    @modifier = modifier
    @ordinal = degree.to_ordinal
    @name = (modifier.nil? ? "" : (modifier.to_s + " ") ) + ordinal.to_s
  end

  attr_reader :semitones, :degree, :modifier, :ordinal
  
  def to_s
    @name
  end

  def <=>(otherInterval)
    semitones <=> otherInterval.semitones
  end

  def self.[](sym)
    @@intervals[sym]
  end

  def self.of(semitones)
    @@by_semitones[semitones]
  end

  @@intervals = {
    unison: Interval.new( 0, 1),
    minor2: Interval.new( 1, 2, :minor),
    major2: Interval.new( 2, 2, :major),
    minor3: Interval.new( 3, 3, :minor),
    major3: Interval.new( 4, 3, :major),
    fourth: Interval.new( 5, 4),
    sus4:   Interval.new( 5, 4),
    flat5:  Interval.new( 6, 5, :flat),
    fifth:  Interval.new( 7, 5),
    minor6: Interval.new( 8, 6, :minor),
    major6: Interval.new( 9, 6, :major),
    dom7:   Interval.new(10, 7),
    minor7: Interval.new(10, 7),
    major7: Interval.new(11, 7, :major),
    octave: Interval.new(12, 8)}

  @@by_semitones = (0..12).map {|n| nil}
  @@intervals.values.each { |interval| @@by_semitones[interval.semitones] ||= interval}
    


end

