# string 1..n where 1 is the one closest to the player's thumb.  On a guitar that's the lowest pitched E
# On a Ukelele that is the G
# fret: 0 is open, 1-n fret, X is muted
class Fingering
  def initialize(string, fret, finger=nil)
    @string = string
    @fret = fret
    @finger = finger
  end

  def nutrow()
    open? ?  "0" : muted? ? "X" : " "
  end

  def open?()
    fret.eql?(0)
  end

  def muted?()
    fret.eql?(:X)
  end

  attr_reader :string, :fret, :finger

end
    
  
