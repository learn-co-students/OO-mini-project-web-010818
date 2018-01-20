class Recipe

  attr_reader :name

  @@all = []


  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    recipes = RecipeCard.all.map {|rc| rc.recipe}
    counts = recipes.each_with_object(Hash.new(0)) { |recipe,counts| counts[recipe] += 1 }
    most_popular = counts.sort {|a,b| b[1]<=>a[1]}.first.first
  end

  def users
    recipe_cards = RecipeCard.all.select {|recipe_card| recipe_card.recipe == self}
    recipe_cards.map {|recipe_card| recipe_card.user.name}
  end

  def allergens
    allergens = Allergen.all.select{|a| self.ingredients.include?(a.ingredient)}
    allergens.map{|a| a.ingredient.name}
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
    recipe_ingredients.map {|recipe_ingredient| recipe_ingredient.ingredient}
  end
end
