class Recipe
  # A single Recipe can also belong to many Users.
  # A Recipe also has many Ingredients, while a single Ingredient can be found in many Recipes.
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end
  # Recipe.all should return all of the recipe instances
  def self.all
    @@all
  end

  # Recipe.most_popular should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
  def self.most_popular
    recipe_instances = RecipeCard.all.map { |a| a.recipe }
    counts = recipe_instances.each_with_object(Hash.new(0)) { |recipe, counts| counts[recipe] += 1 }
    counts.max_by { |k, v| v }[0]
  end

  # Recipe#users should return the user instances who have recipe cards with this recipe
  def users
    RecipeCard.all.select { |c| c.recipe == self }.map { |c| c.user }
  end

  # Recipe#ingredients should return all of the ingredients in this recipe
  def ingredients
    RecipeIngredient.all.select { |ri| ri.recipe == self }.map { |ri| ri.ingredient }
  end

  # Recipe#allergens should return all of the ingredients in this recipe that are allergens
  def allergens
      ingredients.select { |i| Allergen.ingredients.include?(i)  }
  end
  # Recipe#add_ingredients should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
  def add_ingredients(ingredients)
    ingredients.each { |i| RecipeIngredient.new(self, i) }
  end
end
