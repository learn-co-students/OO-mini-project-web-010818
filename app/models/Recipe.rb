class Recipe
  attr_accessor :ingredients, :recipecards
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @ingredients = []

    @@all << self
  end

  def self.all
    @@all
  end

  def recipecards
    RecipeCard.all.find_all do |recipecard|
      recipecard.recipe == self
    end
  end

#most_popular should return the recipe instance with the highest number of users (the recipe that has the most recipecards)
  def self.most_popular
    all_recipes = RecipeCard.all.map { |recipecard| recipecard.recipe }
    frequency = {}
    all_recipes.each do |recipe|
      if frequency.include?(recipe)
        frequency[recipe] += 1
      else
        frequency[recipe] = 1
      end
    end
    frequency.max_by(1) { |recipe, count| count}
  end

#users should return the user instances who have recipe cards with this recipe
  def users
    recipecards.map do |recipecard|
      recipecard.user
    end
  end

#add_ingredients should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
  def add_ingredients(ingr_arr)
    ingr_arr.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
      self.ingredients << ingredient
    end
    self.ingredients  #return all ingredients after adding
  end

end
