class Note
  attr_reader :letter, :octave, :sign

  @@Letters = [:A, :B, :C, :D, :E, :F, :G].freeze
  #TODO Add double-flat and double-sharp
  @@Signs = [:flat, :natural, :sharp].freeze
  @@Octaves = (1..5).to_a.freeze

  def initialize(letter, sign=:natural, octave=nil)
    letter = letter.to_s.upcase.to_sym
    throw "Invalid note #{letter}" unless @@Letters.include?(letter)
    throw "Invalid sign #{sign}" unless @@Signs.include?(sign)
    throw "Invalid octave #{octave}" unless octave.nil? || @@Octaves.include?(octave)
    @letter = letter
    @sign = sign
    @octave = octave
    @name = letter.to_s + (natural? ? "" : (flat? ? "b" : "#")) + octave.to_s
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
    Note.new(
             @@Letters[(@@Letters.find_index(letter) + interval.degree - 1) % @@Letters.count],
             sign,
             octave)
  end
end
