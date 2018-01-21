require 'pry'

require_relative '../config/environment.rb'
require_relative '../app/models/Allergen'
require_relative '../app/models/Ingredient'
require_relative '../app/models/Recipe'
require_relative '../app/models/RecipeCard'
require_relative '../app/models/RecipeIngredient'
require_relative '../app/models/User'

# Seed data

#User
u = User.new("Anthea")
u2 = User.new("David")

#Recipe
r = Recipe.new("Scrambled Eggs")
r2 = Recipe.new("Sandwich")
r3 = Recipe.new("Pancake")
r4 = Recipe.new("Liver")

#RecipeCard
rc = RecipeCard.new(u, r, (DateTime.now - 4), 5)
rc2 = RecipeCard.new(u, r2, (DateTime.now - 1), 3)
rc3 = RecipeCard.new(u, r3, (DateTime.now - 3), 8)
rc4 = RecipeCard.new(u, r4, (DateTime.now - 2), 1)
rc4 = RecipeCard.new(u2, r4, (DateTime.now - 2), 10)

#Ingredient
i = Ingredient.new("Flour")
i2 = Ingredient.new("Eggs")
i3 = Ingredient.new("Liver")

#RecipeIngredient
ri = RecipeIngredient.new(r2, i)
ri2 = RecipeIngredient.new(r, i2)
ri3 = RecipeIngredient.new(r3, i)
ri4 = RecipeIngredient.new(r3, i2)
ri5 = RecipeIngredient.new(r4, i3)

#Allergen
a = Allergen.new(u, i)
a2 = Allergen.new(u, i2)
a2 = Allergen.new(u2, i2)

binding.pry
