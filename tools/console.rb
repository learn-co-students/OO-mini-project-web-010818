require_relative '../config/environment.rb'


# seed data

@eggs = Recipe.new("eggs")
@avo_toast = Recipe.new("avocado toast")
@cookies = Recipe.new("cookies")

@morganne = User.new("morganne")
@mike = User.new("mike")

@peanuts = Ingredient.new("peanuts")
@mushrooms = Ingredient.new("mushrooms")
@avocado = Ingredient.new("avocado")
@toast = Ingredient.new("toast")
@egg = Ingredient.new("egg")
@sugar = Ingredient.new("sugar")

@eggs.add_ingredients([@egg, @mushrooms])
@avo_toast.add_ingredients([@avocado, @toast])
@cookies.add_ingredients([@sugar, @egg, @peanuts])

@morganne.add_recipe_card(@avo_toast, "2017-01-23", 10)
@morganne.add_recipe_card(@cookies, "2018-01-23", 9)
@morganne.add_recipe_card(@eggs, "2013-07-21", 3)
@mike.add_recipe_card(@eggs, "2017-10-26", 7.5)

@mike.declare_allergen(@peanuts)
@morganne.declare_allergen(@mushrooms)
@morganne.declare_allergen(@egg)
@morganne.declare_allergen(@peanuts)

Pry.start
