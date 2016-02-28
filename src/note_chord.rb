class NoteChord
  def initialize (note, chord)
    @note = note
    @chord = chord
  end

  attr_reader :note, :chord

  def to_s
    "#{note}#{chord}"
  end
end
