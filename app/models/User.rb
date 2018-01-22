class User

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

# Helper Methods

  def rec_collector
    RecipeCard.all.select {|rc| rc.user == self}
  end

  def all_collector
    Allergen.all.select {|a| a.user == self}
  end

# Instance Methods

  def recipes
    rec_collector.collect {|rc| rc.recipe}
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(date, rating, self, recipe)
  end

  def declare_allergen(ing)
    Allergen.new(self, ing)
  end

  def allergens
    all_collector.collect {|a| a.ingredient}
  end

  def top_three_recipes
    rec_collector.max_by(3) {|rc| rc.rating}.collect {|rc| rc.recipe}
  end

  def most_recent_recipe
    rec_collector.last.recipe
  end

  def safe_recipes
    safe_rec = []
    Recipe.all.each do |r|
      count = 0
      r.ingredients.each do |i|
        self.allergens.each do |a|
          if i == a
            count += 1
          end
        end
      end
      if count == 0
        safe_rec << r
      end
    end
    safe_rec
  end

# Class Methods

  def self.all
    @@all
  end

end
