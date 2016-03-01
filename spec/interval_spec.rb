require 'interval'

describe Interval do
  describe "#<=>" do
    it "is based on the semitones" do
      expect(Interval.new( 3, 3, :minor) <=> Interval.new( 4, 3, :major)).to eq -1
    end

  end

  describe "dictionary" do
    it "returns commonly used intervals" do
      expect(Interval[:flat5].degree).to eq(5)
    end
  end

  describe "Interval#of" do
    it "returns the interval" do
      expect(Interval.of(0)).to eq(Interval[:unison])
      expect(Interval.of(1)).to eq(Interval[:minor2])
    end
  end
end
