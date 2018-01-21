class User
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def my_recipecards_helper
    RecipeCard.all.select do |rc|
      rc.user == self
    end
  end

  def recipes
    my_recipecards_helper.map do |rc|
      rc.recipe
    end
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    my_allergies = Allergen.all.select do |a|
      a.user == self
    end

    my_allergies.map { |al| al.ingredient }
  end

  def top_three_recipes
    ordered = my_recipecards_helper.sort_by { |rc| rc.rating }
    ordered.reverse!
    ordered_recipes = ordered.map { |r| r.recipe }
    ordered_recipes[0..2]
  end

  def most_recent_recipe
    result = my_recipecards_helper.last
    result.recipe
  end

  def safe_recipes
    result = Recipe.all
    allergens.each do |a|
      RecipeIngredient.all.each do |ri|
        if ri.ingredient == a
          result.delete(ri.recipe)
        end
      end
    end
    result
  end
end
