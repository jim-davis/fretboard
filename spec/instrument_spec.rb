require 'instrument'
require 'chord'
require 'note'

describe Instrument do
  describe "Instrument#chord_choices" do
    it "returns a Hash" do
      chord = Chord.new(Note.new(:E), AbstractChord.new())
      instrument = Instrument.new([:E2, :A2, :D3, :G3, :B3, :E4])
      expect(instrument.chord_choices(chord)).to be_a(Hash)
    end
  end
end

