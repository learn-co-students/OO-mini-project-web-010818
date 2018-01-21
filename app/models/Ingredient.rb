class Ingredient
  # attr_reader :all

  @@all = []

  def initialize(name:)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    #returns ingredient instance most people are allergic to
    counter_hash = Hash.new
    allergen_ingredients = Allergen.all.map do |allergen|
      allergen.ingredient
    end
    Ingredient.all.each do |ingredient|
      count = allergen_ingredients.count(ingredient)
      counter_hash[ingredient] = count
    end

    max = counter_hash.values.max

    counter_hash.invert[max]
  end
end
