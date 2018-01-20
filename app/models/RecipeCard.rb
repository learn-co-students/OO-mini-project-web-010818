require_relative 'Recipe.rb'
require_relative 'User.rb'
class Recipecard
  @@all = []

  attr_accessor :user, :recipe, :date, :rating

  def initialize(user, recipe, date, rating)
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
