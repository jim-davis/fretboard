$LOAD_PATH << File.dirname(File.expand_path(__FILE__)) + "/../src"

require 'chord'
Chord[:major] = Chord.new(:major3, :fifth)
Chord[:min7b5] = Chord.new(:minor3, :flat5, :seventh)

puts Chord[:min7b5]



require 'instrument'

GUITAR = Instrument.new([:E2, :A2, :D3, :G3, :B3, :E4])
UKELELE = Instrument.new([:G4, :C4, :E4, :A4])

puts GUITAR.strings

