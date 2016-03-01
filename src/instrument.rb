require 'note'

class Instrument
  def initialize(strings)
    @strings = strings.map { |note_name| Note.parse(note_name)}
  end

  def chord_choices(chord)
    Hash[*chord.notes.flat_map { |note| [note, 
                                         strings.each_with_index.map do |open, i|
                                           fret = (note - open).semitones
                                           fret <= 4 ? {string: i+1, fret: fret} : nil
                                         end.compact]}
        ]
  end
  
  attr_reader :strings
end
