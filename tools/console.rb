require_relative '../config/environment.rb'


anna = User.new("Anna")
leo = User.new("Leo")
vincent = User.new("Vincent")
tony = User.new("Tony")

apple_pie = Recipe.new("apple pie")
cheesecake = Recipe.new("cheesecake")
chocolate_cake = Recipe.new("chocolate cake")
sushi = Recipe.new("sushi")
grilled_salmon = Recipe.new("grilled salmon")

cheese = Ingredient.new("cheese")
flour = Ingredient.new("flour")
butter = Ingredient.new("butter")
apple = Ingredient.new ("apple")
egg = Ingredient.new("egg")
water = Ingredient.new("water")
chocolate = Ingredient.new("chocolate")
salmon = Ingredient.new("salmon")
milk = Ingredient.new("milk")
sugar = Ingredient.new("sugar")
oil = Ingredient.new("oil")
rice = Ingredient.new("rice")

apple_pie.add_ingredients([apple, flour, egg, water, butter, sugar])
chocolate_cake.add_ingredients([chocolate, flour, egg, water, butter, sugar, milk])
cheesecake.add_ingredients([cheese, flour, egg, water, sugar, milk])
sushi.add_ingredients([salmon, rice, water])
grilled_salmon.add_ingredients([salmon, oil, water])

anna.add_recipe_card(cheesecake, "2017-01-20", 4)
anna.add_recipe_card(sushi, "2017-08-20", 5)
anna.add_recipe_card(chocolate_cake, "2017-09-10", 3)

leo.add_recipe_card(sushi, "2017-10-20", 4)
leo.add_recipe_card(grilled_salmon, "2017-05-12", 2)
leo.add_recipe_card(chocolate_cake, "2017-10-25", 4)

tony.add_recipe_card(cheesecake, "2017-04-11", 5)
tony.add_recipe_card(apple_pie, "2017-02-10", 4)
tony.add_recipe_card(sushi, "2017-09-20", 4)
tony.add_recipe_card(chocolate_cake, "2017-09-27", 5)

vincent.add_recipe_card(cheesecake, "2017-04-30", 5)
vincent.add_recipe_card(chocolate_cake, "2017-01-20", 4)

anna.declare_allergen(apple)
leo.declare_allergen(apple)
leo.declare_allergen(cheese)
vincent.declare_allergen(salmon)

binding.pry
