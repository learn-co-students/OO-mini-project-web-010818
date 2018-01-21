class Recipe
  # attr_reader :all
  attr_accessor :name

  @@all = []

  def initialize(name:)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    #return recipe with most recipe cards
    counter_hash = Hash.new
    card_recipes = RecipeCard.all.map do |card|
      card.recipe
    end
    Recipe.all.each do |recipe|
      count = card_recipes.count(recipe)
      counter_hash[recipe] = count
    end

    max = counter_hash.values.max

    counter_hash.invert[max]
  end

  def users
    recipe_cards = RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end
    recipe_cards.map do |recipe_card|
      recipe_card.user
    end
  end

  def ingredients
    #return all ingredients
    recipe_ingredients = RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end
    recipe_ingredients.map do |recipe_ingredient|
      recipe_ingredient.ingredient
    end
  end

  def allergens
    #return all allergens in self
    allergen_ingredients = Allergen.all.map do |allergen_instance|
      allergen_instance.ingredient
    end
    self.ingredients.select do |ingredient|
      allergen_ingredients.include?(ingredient)
    end
  end

  def add_ingredients(array_of_ingredients)
    #associate ingredients with recipe
    array_of_ingredients.each do |ingredient|
      RecipeIngredient.new(ingredient:ingredient, recipe:self)
    end
  end
end
