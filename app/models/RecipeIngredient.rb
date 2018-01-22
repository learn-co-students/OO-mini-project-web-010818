class RecipeIngredient

  attr_reader :ingredient, :recipe

  @@all = []

  def initialize(ing, recipe)
    @ingredient = ing
    @recipe = recipe
    @@all << self
  end

  def self.all
    @@all
  end

end
