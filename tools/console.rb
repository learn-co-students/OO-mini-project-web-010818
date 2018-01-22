require 'time'
require_relative '../config/environment.rb'
require_relative '../app/models/Allergen.rb'
require_relative '../app/models/Ingredient.rb'
require_relative '../app/models/Recipe.rb'
require_relative '../app/models/RecipeCard.rb'
require_relative '../app/models/RecipeIngredient.rb'
require_relative '../app/models/User.rb'

#ingredients
sweet_potato = Ingredient.new("sweet potatoes")
kale = Ingredient.new("kale")
beans = Ingredient.new("beans")

#recipies
buddha_bowl = Recipe.new("Buddha Bowl")
potato_hash = Recipe.new("Potato Hash")
veggie_burrito = Recipe.new("Veggie Burrito")

#users
kristina = User.new("Kristina")
matt = User.new("Matt")
sarah = User.new("Sarah")

#add many ingredients
ri1 = buddha_bowl.add_ingredients(kale, sweet_potato, beans)
ri2 = veggie_burrito.add_ingredients([sweet_potato, beans])
ri3 = potato_hash.add_ingredients([sweet_potato])

#allergic to
allergy1 = matt.declare_allergen(kale)
allergy2 = sarah.declare_allergen(beans)
allergy3 = matt.declare_allergen(beans)

#add_recipe_card
recipecard1 = kristina.add_recipe_card(buddha_bowl, '9-1-14', 4)
recipecard2 = kristina.add_recipe_card(potato_hash, '3-7-12', 2)
recipecard3 = kristina.add_recipe_card(veggie_burrito, '8-22-13', 1)
recipecard4 = sarah.add_recipe_card(buddha_bowl, '2-14-16', 3)
recipecard5 = sarah.add_recipe_card(buddha_bowl, '3-09-17', 4)
recipecard6 = sarah.add_recipe_card(potato_hash, '5-19-08', 5)
recipecard7 = sarah.add_recipe_card(veggie_burrito, '6-18-16', 4)
recipecard8 = matt.add_recipe_card(potato_hash, '11-30-15', 4)



pry
