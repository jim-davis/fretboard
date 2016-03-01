require 'chord'
require 'note'

describe Chord do
  describe "Chord#notes" do
    it "returns one note for every interval in the chord, plus the root" do
      chord = Chord.new(Note.new(:C), AbstractChord.new(:major3, :fifth, :dom7))
      expect(chord.notes.length).to eq(4)
    end
    it "returns the root first" do
      root = Note.new(:C)
      chord = Chord.new(root, AbstractChord.new(:major3, :fifth, :dom7))
      expect(chord.notes[0]).to eq(root)
    end
    it "returns one note for each interval" do
      root = Note.new(:C)
      chord = Chord.new(root, AbstractChord.new(:major3, :fifth, :dom7))
      expect(chord.notes.slice(1,3)).to eq([Note.new(:E), 
                                            Note.new(:G), 
                                            Note.new(:B, :flat)])
    end
  end
end
