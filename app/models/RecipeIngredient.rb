require_relative 'Ingredient.rb'
require_relative 'Recipe.rb'

class Recipeingredient
  @@all = []
  attr_accessor :ingredient, :recipe

  def initialize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end
end
