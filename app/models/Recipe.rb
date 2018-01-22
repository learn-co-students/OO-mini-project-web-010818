class Recipe

    attr_accessor :name, :user

    @@all = []

    def initialize(name)
      @name = name
      @@all << self
    end

    def self.all
      @@all
    end

    def users
      recipes = RecipeCard.all.select do |recipecard|
        recipecard.recipe == self
      end
      recipes.map do |recipe|
        recipe.user
      end
    end

    def ingredients #ok
      #RI = recipe ingredient
      myRI = RecipeIngredient.all.select do |recipeingredient|
        recipeingredient.recipe == self
      end
      myRI.map do |myrecipeingredient|
        myrecipeingredient.ingredient
      end
    end

    def allergens #ok
      myRI = RecipeIngredient.all.select {|ri| ri.recipe == self}
      myIngredients = myRI.map {|ri|ri.ingredient}
      allergenIngredient = Allergen.all.map {|a|a.ingredient}
      myIngredients.select {|myIn| allergenIngredient.include?(myIn)}
    end

    def add_ingredients(ingredientArr) #ok
      ingredientArr.each do |eachingredient|
        RecipeIngredient.new(self,eachingredient)
      end
    end

    def self.most_popular
      counts = Hash.new 0
      RecipeCard.all.each {|rc|counts[rc.recipe] +=1}
      counts.sort_by {|k,v| v}.last
    end
end
