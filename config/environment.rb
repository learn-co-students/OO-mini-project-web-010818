require 'bundler/setup'
require 'date'
Bundler.require
require_all 'app'

#Create Users
10.times do |i|
  User.new("User#{i}")
end

#Create Ingredients
20.times do |i|
  Ingredient.new("Ingredient #{i}")
end

#Create Recipes
5.times do |i|
  Recipe.new(name: "Recipe #{i}")
end

#Add allergens to user, crates
User.all.each do |user|
  user.declare_allergen(Ingredient.all.sample)
end

#Add Recipes to user, via RecipeCards
User.all.each do |user|
  user.add_recipe_card(Recipe.all.sample, Date.today, Random.new.rand(1..5))
end


#Add ingredients to recipe, creates RecipeIngredient
Recipe.all.each do |recipe|
  # recipe.ingredient << Ingredient.all.sample
  recipe.add_ingredients(Ingredient.all.sample(3))
end
