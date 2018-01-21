class Ingredient
# One Recipe to many Ingredients, while a single Ingredient can be found in many Recipes.
# There are Ingredients that some Users may be allergic to.
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

#   Ingredient.all should return all of the ingredient instances
  def self.all
    @@all
  end

# Ingredient.most_common_allergen should return the ingredient instance that the highest number of users are allergic to
  def self.most_common_allergen
    ingredients = Allergen.all.map { |a| a.ingredient }
    counts = ingredients.each_with_object(Hash.new(0)) { |ingredient, counts| counts[ingredient] += 1 }
    counts.max_by { |k, v| v }[0]
  end
end
