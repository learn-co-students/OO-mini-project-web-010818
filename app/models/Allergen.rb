require_relative 'User.rb'
require_relative 'Ingredient.rb'

class Allergen
  @@all = []
  attr_accessor :user, :ingredient

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

end
