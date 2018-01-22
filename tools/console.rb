require_relative '../config/environment.rb'

fei = User.new('Fei')
jon = User.new('Jonathan')


beef = Ingredient.new('beef')
celery = Ingredient.new('celery')
carrots = Ingredient.new('carrots')
onions = Ingredient.new('onions')
black_beans= Ingredient.new('black beans')
curry_powder = Ingredient.new('curry powder')
chicken = Ingredient.new('chicken')
tofu = Ingredient.new('tofu')
peppers = Ingredient.new('peppers')
cabbage = Ingredient.new('cabbage')
almonds = Ingredient.new('almonds')
salmon = Ingredient.new('salmon')
avocado = Ingredient.new('avocado')
bread = Ingredient.new('bread')
yogurt = Ingredient.new('yogurt')
granola = Ingredient.new('granola')
berries = Ingredient.new('berries')
chia_seeds = Ingredient.new('chia seeds')
hemp_seeds = Ingredient.new('hemp seeds')
acai = Ingredient.new('acai')


soup = Recipe.new('soup')
soup.add_ingredients([beef, celery, carrots, onions, black_beans])
curry = Recipe.new('curry')
curry.add_ingredients([curry_powder, celery, carrots, onions, chicken, peppers])
steak = Recipe.new('steak')
steak.add_ingredients([beef])
salad = Recipe.new('salad')
salad.add_ingredients([carrots, onions, cabbage, almonds, salmon])
avocado_toast = Recipe.new('avocado toast')
avocado_toast.add_ingredients([avocado, bread])
yogurt_parfait = Recipe.new('yogurt parfait')
yogurt_parfait.add_ingredients([yogurt, granola, berries, chia_seeds])
acai_bowl = Recipe.new('acai bowl')
acai_bowl.add_ingredients([yogurt, berries, chia_seeds, hemp_seeds, acai])


fei.add_recipe_card(soup, 'jan 20', 6)
fei.add_recipe_card(curry, 'feb 22', 8)
fei.add_recipe_card(avocado_toast, 'jul 20', 10)
fei.add_recipe_card(yogurt_parfait, 'jan 12', 4)
fei.add_recipe_card(acai_bowl, 'aug 5', 8)
fei.declare_allergen(celery)
fei.declare_allergen(tofu)


jon.add_recipe_card(curry, 'dec 10', 7)
jon.add_recipe_card(steak, 'may 4', 9)
jon.declare_allergen(tofu)


binding.pry
