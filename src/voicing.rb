require 'fingering'

class Voicing
  @@MAXFRET = 4
  def initialize(instrument, chord, strings)
    @instrument = instrument
    @chord = chord
    @strings = strings

    raise "missing strings" unless strings.count.eql?(instrument.strings.count)
  end

  def asciirows()
    [nutrow(), fret()] +
      (1..@@MAXFRET).to_a.flat_map { |i| [asciistringrow(i), fret()]}
    end

  def nutrow() 
    strings.map(&:nutrow).join("")
  end

  def fret()
    (instrument.strings.count()-1).times.map{ |i| "+-" }.join("") + "+ "
  end

  def asciistringrow(i)
    strings.map{ |s| s.asciistringrow(i)}.join("") 
  end

  private
  attr_reader :instrument, :chord, :strings

end

class VoicingString
  def initialize(fingering, degree)
    @fingering = fingering
    @degree = degree
  end

  def nutrow()
    fingering.nutrow() + " "
  end

  def asciistringrow(i)
    (fingering.fret.eql?(i) ? fingering.finger.to_s : "|") + " "
  end

  attr_reader :fingering, :degree
end

