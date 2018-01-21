class User
  # A single Recipe can also belong to many Users.
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  #   User.all should return all of the user instances
  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select { |r| r.user == self }
  end

  # User#recipes should return all of the recipes this user has recipe cards for
  def recipes
    recipe_cards.map { |c| c.recipe }
  end

  # User#add_recipe_card should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, DateTime.now, rating)
  end

  # User#declare_allergen should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  # User#allergens should return all of the ingredients this user is allergic to
  def allergens
    Allergen.all.select { |a| a.user == self }.map { |a| a.ingredient }
  end

  # User#top_three_recipes should return the top three highest rated recipes for this user.
  def top_three_recipes
    top_three_cards = recipe_cards.sort_by { |card| card.rating}.reverse.slice(0, 3)
    top_three_cards.map { |c| c.recipe }
  end
  # User#most_recent_recipe should return the recipe most recently added to the user's cookbook.
  def most_recent_recipe
    recipe_cards.sort_by { |card| card.date}.reverse.first.recipe
  end

  # User#safe_recipes should return all recipes that do not contain ingredients the user is allergic to
  def safe_recipes
    all_recipes = RecipeCard.all.map { |c| c.recipe }
    all_recipes.uniq.select { |r| (allergens & r.ingredients).empty? }
  end
end
