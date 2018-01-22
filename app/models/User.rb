class User
  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def declare_allergen(ingredient)
    Allergen.new(self,ingredient)
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(recipe, date, rating, self)
  end

  def user_instances_of_allergens
    Allergen.all.select do |each_user_allergen_instance|
      each_user_allergen_instance.user = self
    end
  end

  def allergens
    user_instances_of_allergens.each do |each_user_allergen_instance_that_belongs_to_self|
      each_user_allergen_instance_that_belongs_to_self.ingredient
    end
  end

  def user_instances_of_recipecard
    RecipeCard.all.select do |each_user_instance|
      each_user_instance.user == self
    end
  end

  def recipes
    user_instances_of_recipecard.each do |each_user_recipe_instance_that_belongs_to_self|
      each_user_recipe_instance_that_belongs_to_self.recipe
    end
  end

  def top_three_recipes
    by_ratings = []
    user_instances_of_recipecard.each do |each_user_recipe_instance_that_belongs_to_self|
      by_ratings << [each_user_recipe_instance_that_belongs_to_self.rating, each_user_recipe_instance_that_belongs_to_self.recipe]
    end
    ordered_ratings = by_ratings.sort_by do |rating|
      rating[0]
    end
    [ordered_ratings[-1][1],ordered_ratings[-2][1],ordered_ratings[-3][1]]
  end

  def most_recent_recipe
    by_dates = []
    user_instances_of_recipecard.each do |each_user_recipe_instance_that_belongs_to_self|
      by_dates << [each_user_recipe_instance_that_belongs_to_self.date, each_user_recipe_instance_that_belongs_to_self.recipe]
    end
    by_dates
  end


end



# User#most_recent_recipe should return the recipe most recently added to the user's cookbook.
# User#safe_recipes should return all recipes that do not contain ingredients the user is allergic to
