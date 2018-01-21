class RecipeCard
  # attr_reader :all
  attr_accessor :recipe, :user, :date, :rating

  @@all = []

  def initialize(recipe:, user:, date:, rating:)
    @recipe = recipe
    @user = user
    @date = date
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

end
