$LOAD_PATH << File.dirname(File.expand_path(__FILE__)) + "/../src"

require 'instrument'
require 'common_chords'

note = Note.new(:A)
chord = Chord[:min7b5]
puts "#{note}-7b5 is #{chord.notes(note).map(&:to_s).join(' ')}"


GUITAR = Instrument.new([:E2, :A2, :D3, :G3, :B3, :E4])
#UKELELE = Instrument.new([:G4, :C4, :E4, :A4])

puts "Guitar strings are #{GUITAR.strings.map(&:to_s).join(', ')}"

