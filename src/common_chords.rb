require 'chord'
require 'interval'

Chord[:major] = Chord.new(:major3, :fifth)
Chord[:minor] = Chord.new(:minor3, :fifth)

Chord[:minor7] = Chord.new(:minor3, :fifth, :dom7)
Chord[:dom7] = Chord.new(:major3, :fifth, :dom7)
Chord[:major7] = Chord.new(:major3, :fifth, :major7)

Chord[:min7b5] = Chord.new(:minor3, :flat5, :dom7)
