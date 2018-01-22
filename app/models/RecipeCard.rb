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


end
