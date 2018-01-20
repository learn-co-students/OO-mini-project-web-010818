class User

  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
    @recipes = []
  end

  def self.all
    @@all
  end

  def recipes
    @recipes
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
    @recipes << recipe
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select{|a| a.user == self}
  end

  def recipe_cards
    RecipeCard.all.select{|recipe_card| recipe_card.user == self}
  end

  def top_three_recipes
    sorted = self.recipe_cards.sort_by{|recipe_card| recipe_card.rating}.reverse
    top_three = []
    3.times do
      if sorted != []
        top_three << sorted.shift
      end
    end
    top_three.map{|recipe_card| recipe_card.recipe.name}
  end

  def most_recent_recipe
    sorted = self.recipe_cards.sort_by{|recipe_card| recipe_card.date}.reverse
    sorted[0].recipe
  end

  def safe_recipes

    safe_recipes = []

    Recipe.all.each do |r|
      safe = true
      self.allergens.each do |a|
        if r.ingredients.include?(a.ingredient)
          safe = false
          break
        end
      end
      if safe
        safe_recipes << r
      end
    end
    safe_recipes
  end

end
