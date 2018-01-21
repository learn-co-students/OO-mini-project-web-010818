class RecipeCard
  # Each RecipeCard will store information about a Recipe a User would like to save, creating the relationship of a User having many Recipes through RecipeCards.
  # A RecipeCard is the join between a user instance and a recipe instance. This is a has-many-through relationship.
  # RecipeCard#date should return the date of the entry
  # RecipeCard#rating should return the rating (an integer) a user has given their entry
  # RecipeCard#user should return the user to which the entry belongs
  # # RecipeCard#recipe should return the recipe to which the entry belongs
  attr_accessor :user, :recipe, :date, :rating
  @@all = []

  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
  end

  # RecipeCard.all should return all of the RecipeCard instances
  def self.all
    @@all
  end
end
