require 'abstract_chord'
require 'interval'

AbstractChord[:major] = AbstractChord.new(:major3, :fifth)
AbstractChord[:minor] = AbstractChord.new(:minor3, :fifth)

AbstractChord[:minor7] = AbstractChord.new(:minor3, :fifth, :dom7)
AbstractChord[:dom7] = AbstractChord.new(:major3, :fifth, :dom7)
AbstractChord[:major7] = AbstractChord.new(:major3, :fifth, :major7)

AbstractChord[:min7b5] = AbstractChord.new(:minor3, :flat5, :dom7)
