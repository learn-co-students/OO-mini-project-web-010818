class User
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

  def recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
  end

  def recipes
    #return all recipes for self
    recipe_cards.map do |recipe_card|
      recipe_card.recipe
    end
  end

  def add_recipe_card(recipe_instance:,date:,rating:)
    RecipeCard.new(user:self, recipe:recipe_instance, date:date, rating:rating)
  end

  def declare_allergen(ingredient_instance)
    Allergen.new(ingredient:ingredient_instance, user:self)
  end

  def allergens
    allergen_instances = Allergen.all.select do |allergen|
      allergen.user == self
    end
    allergen_instances.map do |allergen|
      allergen.ingredient
    end
  end

  def top_three_recipes
    #return self's top 3 recipes

    sorted_recipes = self.recipe_cards.sort_by do |recipe_card|
      recipe_card.rating
    end.reverse

    sorted_recipes[0..2].map do |recipe_card|
      recipe_card.recipe
    end

  end

  def most_recent_recipe
    #return recipe instance for self's most recent card
    user_recipes = RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
    user_recipes.last.recipe
  end
end
