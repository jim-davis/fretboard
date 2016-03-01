require 'instrument'
require 'chord'
require 'note'

describe Instrument do
  describe "Instrument#chord_choices" do
    it "returns a key-value Hash with one key for each note" do
      chord = Chord.new(Note.new(:E), AbstractChord.new())
      instrument = Instrument.new([:E2, :A2, :D3, :G3, :B3, :E4])
      expect(instrument.chord_choices(chord).keys).to eq(chord.notes)
    end
    it "each value is an set of tuples of string and fret" do
      root = Note.new(:E)
      chord = Chord.new(root, AbstractChord.new())
      instrument = Instrument.new([:E2, :A2, :D3, :G3, :B3, :E4])
      expect(instrument.chord_choices(chord)[root]).to eq([{string: 1, fret: 0},
                                                           {string: 3, fret: 2},
                                                           {string: 6, fret: 0}])
    end
  end
end

