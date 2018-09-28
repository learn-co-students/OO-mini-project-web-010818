class User
  attr_accessor :allergens
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

#recipes should return all of the recipes this user has recipe cards for
  def recipecards
    RecipeCard.all.select do |recipecard|
      recipecard.user == self
    end
  end

  def recipes
    recipecards.map do |rc|
      rc.recipe
    end
  end
#add_recipe_card should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
  def add_recipe_card(recipe, date, rating)
    new_recipe = RecipeCard.new(self, recipe, date, rating)
  end

#declare_allergen should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
  def declare_allergen(ingredient)
    new_allergen = Allergen.new(self, ingredient)
  end



#top_three_recipes should return the top three highest rated recipes for this user.
  def top_three_recipes
    top_rc = recipecards.max_by(3) do |recipecard|
      recipecard.rating
    end
    top_rc.map do |recipecard|
      recipecard.recipe
    end
  end

#most_recent_recipe should return the recipe most recently added to the user's cookbook.
  def most_recent_recipe
    recipecard = self.recipecards.last
    recipecard.recipe
  end

  def safe_recipes
    safe = []
    allergies = Allergen.all.select do |allergen|
      allergen.user == self
    end
    allergies.each do |allergen|
      Recipe.all.each do |recipe|
        if !(recipe.ingredients.include?(allergen))
          safe << recipe
        end
      end
    end
    safe
  end

end
