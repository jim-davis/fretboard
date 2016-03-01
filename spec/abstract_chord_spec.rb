require 'abstract_chord'

describe AbstractChord do
  describe "dictionary" do
    it "returns the chord you stored" do
      c = AbstractChord.new(:unison)
      AbstractChord[:unison] = c
      expect(AbstractChord[:unison]).to eq(c)
    end
  end
end
