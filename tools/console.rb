require_relative '../config/environment.rb'

katy = User.new(name:"Katy")
marty = User.new(name:"Marty")

cookies = Recipe.new(name:"cookies")
brownies = Recipe.new(name:"brownies")
bread = Recipe.new(name:"bread")
potatoes = Recipe.new(name:"potatoes")

egg = Ingredient.new(name:"egg")
flour = Ingredient.new(name:"flour")
chocolate_chips = Ingredient.new(name:"choco chips")
cacao_powder = Ingredient.new(name:"cacao powder")
yeast = Ingredient.new(name:"yeast")
potato = Ingredient.new(name:"potato")


cookies.add_ingredients([egg, flour, chocolate_chips])
brownies.add_ingredients([egg, flour, cacao_powder])
bread.add_ingredients([flour, yeast])
potatoes.add_ingredients([potato])

katy.declare_allergen(egg)
katy.declare_allergen(flour)
marty.declare_allergen(flour)

katy.add_recipe_card(recipe_instance:cookies, date:"yesterday", rating:3)
katy.add_recipe_card(recipe_instance:brownies, date:"today", rating:4)
marty.add_recipe_card(recipe_instance:cookies, date:"today", rating:5)
katy.add_recipe_card(recipe_instance:bread, date:"tomorrow", rating:7)
katy.add_recipe_card(recipe_instance:potatoes, date:"after tomorrow", rating:10)





binding.pry
