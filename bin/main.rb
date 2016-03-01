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


puts GUITAR.chord_choices(Chord.new(Note.new(:E), AbstractChord[:major]))


