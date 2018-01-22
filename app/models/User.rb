class User

  #Has many recipes through RecipeCards
  #Has many ingredients(allergens) Allergens

  attr_reader :recipe_cards, :allergens

  @@all = []

  def initialize(name)
    @name = name
    @recipe_cards = []
    @allergens = []
    @@all << self
  end

  def self.all
    @@all
  end

  def add_recipe_card(recipe_instance, date, rating)
    recipe_card = RecipeCard.new(self, recipe_instance, date, rating)
    @recipe_cards << recipe_card
  end

  def declare_allergen(ingredient_instance)
    allergen = Allergen.new(ingredient_instance, self)
    @allergens << allergen
  end

  def top_three_recipes
    sorted_cards = recipe_cards.sort_by do |recipe_card|
      recipe_card.rating
    end.reverse

    sorted_cards[0..2]
  end

end
