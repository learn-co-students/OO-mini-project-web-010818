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
    allergen = Allergen.all.collect {|allergen| allergen.ingredient}
    allergen.map {|ingredient| [allergen.count(ingredient), ingredient]}.max[1]

  end
end
