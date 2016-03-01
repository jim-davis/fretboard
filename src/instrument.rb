require 'note'

class Instrument
  def initialize(strings)
    @strings = strings.map { |note_name| Note.parse(note_name)}
  end

  def chord_choices(chord)
    {}
  end

  attr_reader :strings
end
