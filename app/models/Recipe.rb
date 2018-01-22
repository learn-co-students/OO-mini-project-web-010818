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

  def add_ingredients(array_of_ingredients)
    array_of_ingredients.map do |each_ingredient|
      RecipeIngredient.new(self, each_ingredient)
    end
  end

    #call the recipies ingredients
   def recipe_instances_of_ingredients
      RecipeIngredient.all.select do |each_recipe_instance|
        each_recipe_instance.recipe == self
      end
    end

    def ingredients
      recipe_instances_of_ingredients.map do |each_recipe_instance_that_belongs_to_self|
        each_recipe_instance_that_belongs_to_self.ingredient
      end
    end

    def allergens
      result = []
      ingredients.map do |each_ingredient_in_self|
        Allergen.all.find do |each_allergen_instance|
          if each_ingredient_in_self == each_allergen_instance.ingredient
            result << each_allergen_instance.ingredient
          end
        end
      end
      if result == []
        result = "none"
      end
      result
    end

    def recipe_instances_of_users
       RecipeCard.all.select do |each_recipe_instance|
         each_recipe_instance.recipe == self
       end
     end

    def users
      recipe_instances_of_users.map do |each_recipe_instance_that_belongs_to_self|
        each_recipe_instance_that_belongs_to_self.user
      end
    end


    def self.most_popular
      popular_recipe_count = Hash.new(0)
         RecipeCard.all.each do |each_instance|
           popular_recipe_count[each_instance.recipe] += 1
        end
        most_popular = []
        popular_recipe_count.each do |instance_recipe, count|
          if most_popular == []
            most_popular = instance_recipe, count
          elsif count > most_popular[1]
            most_popular = instance_recipe, count
          end
        end
        most_popular[0]
    end


end
