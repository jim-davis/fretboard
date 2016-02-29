class Note
  attr_reader :letter, :octave, :sign
  
  @@Letters = [:A, :B, :C, :D, :E, :F, :G].freeze
  #TODO Add double-flat and double-sharp
  @@Signs = [:flat, :natural, :sharp].freeze
  @@Octaves = (1..5).to_a.freeze
  @@Chromatic = [
                 {C: :natural},
                 {C: :sharp, D: :flat},
                 {D: :natural},
                 {D: :sharp, E: :flat},
                 {E: :natural, F: :flat},
                 {F: :natural},
                 {F: :sharp, G: :flat},
                 {G: :natural},
                 {G: :sharp, A: :flat},
                 {A: :natural},
                 {A: :sharp, B: :flat},
                 {B: :natural, C: :flat}
                ].freeze

  def initialize(letter, sign=:natural, octave=nil)
    letter = letter.to_s.upcase.to_sym
    throw "Invalid note #{letter}" unless @@Letters.include?(letter)
    throw "Invalid sign #{sign}" unless @@Signs.include?(sign)
    throw "Invalid octave #{octave}" unless octave.nil? || @@Octaves.include?(octave)
    @letter = letter
    @sign = sign
    @octave = octave
    @name = letter.to_s + (natural? ? "" : (flat? ? "b" : "#")) + octave.to_s
    @chromatic_index = @@Chromatic.find_index{|item| item[letter] == sign}
    throw "Internal inconsistency.  Can't find #{letter} #{sign} in chromatic scale" if @chromatic_index.nil?
  end
  
  def to_s
    @name
  end
  
  def natural?
    sign.eql?(:natural)
  end
  
  def flat?
    sign.eql?(:flat)
  end
  
  def sharp?
    sign.eql?(:sharp)
  end
  
  def self.parse(str)
    m = /([ABCDEFG])([#b]?)([12345]?)/.match(str)
    Note.new(m[1].to_sym, @@sign_map[m[2]], m[3].empty? ? nil : m[3].to_i)
  end
  
  @@sign_map = {"flat" => :flat,"b" => :flat,
    "" => :natural,
    "natural" => :natural,
    "#" => :sharp,
    "sharp" => :sharp}.freeze
  
  def add(interval)
    l =  @@Letters[(@@Letters.find_index(letter) + interval.degree - 1) % @@Letters.count]
    Note.new(l, @@Chromatic[(@chromatic_index + interval.semitones) % @@Chromatic.count][l],
             octave)
  end

  
  def hash
    letter.hash ^ sign.hash ^ octave.hash
  end
  
  def ==(other)
    letter == other.letter && sign == other.sign && octave == other.octave
  end
  alias_method :eql?, :==
    
end
