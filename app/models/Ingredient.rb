class Ingredient

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    ingredients = Allergen.all.map {|a| a.ingredient}
    counts = ingredients.each_with_object(Hash.new(0)) { |ingredient,counts| counts[ingredient] += 1 }
    allergen = counts.sort {|a,b| b[1]<=>a[1]}.first.first
  end

end
