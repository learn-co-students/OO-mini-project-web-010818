class Recipe
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
      rc.recipe == self
    end
  end

  def self.most_popular
    all_recipe_instances = RecipeCard.all.map { |rc| rc.recipe }
    all_recipe_instances.max_by { |i| all_recipe_instances.count(i) }
  end

  def users
    my_recipecards_helper.map do |rc|
      rc.user
    end
  end

  def allergens
    my_ingredients = RecipeIngredient.all.select { |ri| ri.recipe == self }
    result = my_ingredients.select do |i|
      Allergen.all.map { |a| a.ingredient }.include?(i.ingredient)
    end
    result.map { |e| e.ingredient }
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingre|
      RecipeIngredient.new(self, ingre)
    end
  end
end
