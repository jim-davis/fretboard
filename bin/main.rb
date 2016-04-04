$LOAD_PATH << File.dirname(File.expand_path(__FILE__)) + "/../src"

require 'instrument'
require 'common_chords'
require 'chord'
require 'note'

GUITAR = Instrument.new([:E2, :A2, :D3, :G3, :B3, :E4])
#UKELELE = Instrument.new([:G4, :C4, :E4, :A4])

puts "Guitar strings are #{GUITAR.strings.map(&:to_s).join(', ')}"

chord = Chord.new(Note.new(:A),  AbstractChord[:min7b5])
puts "#{chord} is #{chord.notes.map(&:to_s)}"


#puts GUITAR.chord_choices(Chord.new(Note.new(:E), AbstractChord[:major]))

cdom7 = Chord.new(Note.new(:C),  AbstractChord[:dom7])

require 'voicing'
require 'fingering'

v = Voicing.new(GUITAR, cdom7,
                [VoicingString.new(Fingering.new(1, 0), "3"),
                 VoicingString.new(Fingering.new(2, 3, 2), "R" ),
                 VoicingString.new(Fingering.new(3, 2, 3), "3"),
                 VoicingString.new(Fingering.new(4, 3, 4), "7"),
                 VoicingString.new(Fingering.new(5, 1, 1), "R"),
                 VoicingString.new(Fingering.new(6, 0, nil), "3")])

puts v.asciirows()




