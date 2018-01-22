class RecipeIngredient
  @@all = []
  attr_accessor :recipe, :ingredient

  def initialize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

  def self.instances_of_recipeingredient
    @@all.map do |each_instance_of_class|
      each_instance_of_class
    end
  end

end


# RecipeIngredient#ingredient should return the ingredient instance
# RecipeIngredient#recipe should return the recipe instance
