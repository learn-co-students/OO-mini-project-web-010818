class RecipeCard

  attr_accessor :user, :recipe, :rating, :date

  @@all = []

  def initialize(user, recipe, rating, date)
    @date = date
    @rating = rating
    @user = user
    @recipe = recipe
    @@all << self
  end

  def self.all
    @@all
  end

  def users
    self.user
  end

  def recipes
    self.recipe
  end

  def dates
    self.date
  end

  def ratings
    self.rating
  end

end
