

class User

  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
    @recipes = []
  end

# User.all should return all of the user instances
  def self.all
    @@all
  end

# User#recipes should return all of the recipes this user has recipe cards for
  def recipes
    @recipes
  end

# User#add_recipe_card should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
    @recipes << recipe
  end


#	User#declare_allergen should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end


# User#allergens should return all of the ingredients this user is allergic to
  def allergens
    Allergen.all.select{|a| a.user == self}
  end


  def recipe_cards
    RecipeCard.all.select{|recipe_card| recipe_card.user == self}
  end

# User#top_three_recipes should return the top three highest rated recipes for this user.
  def top_three_recipes
		top3 = recipe_cards.max_by(3) {|recipe_card| recipe_card.rating}.collect {|reciepe_card| reciepe_card.recipe}

		top3
  end


# User#most_recent_recipe should return the recipe most recently added to the user's cookbook.
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
