class Recipe

  attr_reader :name, :ingredients

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

# Helper Methods

  def ing_collector
    RecipeIngredient.all.select {|ri| ri.recipe == self}
  end

  def user_collector
    RecipeCard.all.select {|rc| rc.recipe == self}
  end

# Instance Methods

  def users
    user_collector.collect {|rc| rc.user}
  end

  def ingredients
    ing_collector.collect {|ri| ri.ingredient}
  end

  def allergens
    allergens = []
    ingredients.each do |i|
      Allergen.all.each do |a|
        if i == a.ingredient
          allergens << i
        end
      end
    end
    allergens
  end

  def add_ingredients(ing_arr)
    ing_arr.each do |ing|
      RecipeIngredient.new(ing, self)
    end
  end

# Class Methods

  def self.all
    @@all
  end

  def self.most_popular
    counts = Hash.new 0
    RecipeCard.all.each do |rc|
      counts[rc.recipe] += 1
    end
    counts.max_by {|rec, counts| counts}[0]
  end

end
