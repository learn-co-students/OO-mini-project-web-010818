class RecipeCard
  @@all = []
  attr_accessor :user, :recipe, :date, :rating

  def initialize(recipe, date, rating, user)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end
  
end
