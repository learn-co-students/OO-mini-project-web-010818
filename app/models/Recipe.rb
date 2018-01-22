class Recipe
#Has many users through recipecards
#Has many ingredients

  attr_reader :ingredients, :name

  @@all = []

  def initialize(name)
    @name = name
    @ingredients = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular

    recipes = RecipeCard.all.map do |recipe_card|
      recipe_card.recipe
    end

    count = Hash.new(0)

    recipes.each do |recipe|
      count[recipe] += 1
    end

    count.key(count.values.max)
  end

  def allergens

    allergen_ingredients = Allergen.all.map {|a| a.ingredient}.uniq
    allergen_ingredients & self.ingredients
  end

  def users
    recipe_card_matches = RecipeCard.all.select do |recipe_card|
      recipe_card.recipe.name == self.name
    end

    recipe_card_matches.map do |recipe_match|
      recipe_match.user
    end
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      @ingredients << ingredient
      RecipeIngredient.new(ingredient, self)
    end
  end



end
