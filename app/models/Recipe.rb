

class Recipe

  attr_reader :name

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
		counts = Hash.new 0
    RecipeCard.all.each do |recipe_card|
      counts[recipe_card.recipe] += 1
    end
    counts.max_by {|rec, counts| counts}[0]
  end

  def users
    recipe_cards = RecipeCard.all.select {|recipe_card| recipe_card.recipe == self}
    recipe_cards.collect {|recipe_card| recipe_card.user.name}
  end

  def allergens
    allergens = Allergen.all.select{|a| self.ingredients.include?(a.ingredient)}
    allergens.collect{|a| a.ingredient.name}
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  def recipe_ingredients
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end
  end

  def ingredients
    recipe_ingredients.collect {|recipe_ingredient| recipe_ingredient.ingredient}
  end
end
