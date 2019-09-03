class User

  @@all = []

  attr_accessor :name, :allergen

  def initialize(name)
    @name = name
    @allergen = allergen
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes #ok
    myRecipes = RecipeCard.all.select do |rCard|
      rCard.user == self
    end
    myRecipes.map do |myrecipecard|
      myrecipecard.recipe
    end
  end

  def declare_allergen(ingredient)#ok
    newAllergen = Allergen.new(self,ingredient)
    self.allergen = newAllergen
  end

  def add_recipe_card(recipe, rating, date)#ok
    newRecipeCard = RecipeCard.new(self,recipe,rating,date)
  end

  def allergens #ok
    myAllergens = Allergen.all.select do |allergenIns|
      allergenIns.user == self
    end
    myAllergens.map do |myAllergen|
      myAllergen.ingredient
    end
  end

  def top_three_recipes #ok
    myRC = RecipeCard.all.select{|rc| rc.user == self}
    myTopRC = myRC.sort_by{|rc| rc.rating}.reverse
    myTop3 = myTopRC[0,3]
    myTop3.map {|rc| rc.recipe}
  end

  def most_recent_recipe #ok
    myRC = RecipeCard.all.select{|rc| rc.user == self}
    myRC.sort_by{|rc| rc.date}.last
  end


end
