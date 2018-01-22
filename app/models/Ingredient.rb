class Ingredient

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    counts = Hash.new 0
    Allergen.all.each {|a| counts[a.ingredient]+=1}
    counts.sort_by{|k,v| v}.last
  end

end
