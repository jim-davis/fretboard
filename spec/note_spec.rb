require 'note'

describe Note do
  describe "Note.parse" do
    it "parses letter A-G at beginning of string" do
      expect(Note.parse("A").letter).to eq(:A)
    end

    describe "when no octave is provided" do
      it "assumes natural if no sign" do
        expect(Note.parse("A").natural?).to be (true)
      end

      it "parses flat sign" do
        expect(Note.parse("Ab").flat?).to be(true)
      end

      it "parses sharp sign" do
        expect(Note.parse("C#").sharp?).to be(true)
      end

      it "assumes natural if no sign" do
        expect(Note.parse("A").natural?).to be (true)
      end
    end

    describe "when octave is provided" do

      it "parses letter A-G at beginning of string" do
        expect(Note.parse("E2").letter).to eq(:E)
      end

      it "assumes natural if no sign" do
        expect(Note.parse("C4").natural?).to be (true)
      end

      it "parses flat sign" do
        expect(Note.parse("Bb4").flat?).to be(true)
      end

      it "parses sharp sign" do
        expect(Note.parse("C#3").sharp?).to be(true)
      end

      describe "when no sign ie present" do
        it "extracts octave from number at end of string" do
          n = Note.parse("A2")
          expect(n.octave).to eq 2
        end
      end

      describe "when sign is present" do
        it "extracts octave from number at end of string" do
          n = Note.parse("F#4")
          expect(n.octave).to eq 4
        end
      end
    end
    
  end                           # Note.parse

  describe "Note#eql?" do
    describe "when neither note has an octave" do
    it "compares latter and sign" do
      n1 = Note.new(:E, :flat)
      n2 = Note.new(:E, :flat)
      expect(n1.eql?(n2)).to be(true)
      expect(n1).to eq(n2)
    end
    end

    describe "when both notes have the same octave" do
      it "compares letter, sign and octave" do
        n1 = Note.new(:E, :flat, 2)
        n2 = Note.new(:E, :flat, 2)
        expect(n1.eql?(n2)).to be(true)
        expect(n1).to eq(n2)
      end
    end
  end
      
end
