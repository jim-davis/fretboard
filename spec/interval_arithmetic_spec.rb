require 'note'
require 'interval'

describe Note do
  describe "Note#add" do
    it "uses a letter from the right scale" do
      expect(Note.new(:F).add(Interval[:minor3]).letter).to eq(:A) # Ab
      expect(Note.new(:E).add(Interval[:major3]).letter).to eq(:G) # G#
    end

    it "uses correct sign" do
      expect(Note.new(:F).add(Interval[:minor3]).sign).to eq(:flat)
      expect(Note.new(:E).add(Interval[:major3]).sign).to eq(:sharp)
    end
  end

  describe "Note#-" do
    it "returns an Interval which, added to the other note, makes this one" do
      expect(Note.new(:F) - Note.new(:E)).to eq(Interval[:minor2])
      expect(Note.new(:E) - Note.new(:F)).to eq(Interval[:major7])

      expect(Note.new(:C) - Note.new(:B, :flat)).to eq(Interval[:major2])
      expect(Note.new(:B, :flat) - Note.new(:C, :sharp)).to eq(Interval[:major6])
    end
  end
end


