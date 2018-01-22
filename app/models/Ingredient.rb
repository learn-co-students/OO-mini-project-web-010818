class Ingredient

  attr_reader :name

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
    Allergen.all.each do |a|
      counts[a.ingredient] += 1
    end
    counts.max_by {|allergen, counts| counts}[0]
  end

end
