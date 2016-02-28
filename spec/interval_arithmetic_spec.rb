require 'note'
require 'interval'

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
