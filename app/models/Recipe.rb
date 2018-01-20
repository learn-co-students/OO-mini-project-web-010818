

class Recipe
  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    recipecards = Hash.new
     Recipecard.all.each do |recipecard|
       if recipecards[recipecard.recipe]
         recipecards[recipecard.recipe] += 1
       else
         recipecards[recipecard.recipe] = 1
       end
     end

     recipecards.select {|recipe, count| count == recipecards.values.max}
  end

  def users
    recipecard = Recipecard.all.select{|card| card if card.recipe == self}
    recipecard.map do |rc|
      rc.user
    end
  end

  def ingredients
    recipecard = Recipeingredient.all.select{|ri| ri if ri.recipe == self}
    recipecard.map do |rc|
      rc.ingredient.name
    end
  end

  def allergens
    allergic_ingredient = Allergen.all.map{|ag| ag.ingredient.name}
    self.ingredients.select {|ingredient| ingredient if allergic_ingredient.include?(ingredient)}
  end

  def add_ingredients(arr)
    arr.each do |ingredient|
      Recipeingredient.new(self, ingredient)
    end
  end


end
