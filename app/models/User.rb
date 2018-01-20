require_relative 'Allergen.rb'
require_relative 'Recipecard.rb'
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

  def recipecard
    Recipecard.all.select{|rc| rc if rc.user == self}
  end

  def recipes
    self.recipecard.map do |rc|
      rc.recipe.name
    end
  end

  def add_recipe_card(recipe, date, rating)
    Recipecard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    allergy = Allergen.all.select{|allergy| allergy if allergy.user == self}
    allergy.map do |allergen|
      allergen.ingredient.name
    end

  end

  def top_three_recipes
    ranked_recipecard = self.recipecard.sort_by{|rc| rc.rating}.reverse
    all = ranked_recipecard.map do |rc|
      rc.recipe.name
    end
    all[0..2]
  end

  def most_recent_recipe
    rank_date = self.recipecard.sort_by{|rc| rc.date}.last
    rank_date.recipe.name
  end


end
