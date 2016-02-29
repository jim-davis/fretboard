require 'note'
require 'interval'
require 'chord'

describe Chord do
  describe "dictionary" do
    it "returns the chord you stored" do
      c = Chord.new(:unison)
      Chord[:unison] = c
      expect(Chord[:unison]).to eq(c)
    end
  end

  describe "Chord#notes" do
    it "returns one note for every interval in the chord, plus the root" do
      chord = Chord.new(:major3, :fifth, :dom7)
      notes = chord.notes(Note.new(:C))
      expect(notes.length).to eq(4)
    end
    it "returns the root first" do
      chord = Chord.new(:major3, :fifth, :dom7)
      c = Note.new(:C)
      notes = chord.notes(c)
      expect(notes[0]).to eq(c)
    end
    it "returns one note for each interval" do
      chord = Chord.new(:major3, :fifth, :dom7)
      c = Note.new(:C)
      notes = chord.notes(c)
      expect(notes.slice(1,3)).to eq([Note.new(:E), 
                                      Note.new(:G), 
                                      Note.new(:B, :flat)])
    end
  end
end
