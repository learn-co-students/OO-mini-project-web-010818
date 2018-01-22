class Ingredient
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.most_common_allergen
    allergen_ingredients = Allergen.all.map do |allergen_instance|
      allergen_instance.ingredient
    end

    count = Hash.new(0)

    allergen_ingredients.each do |ingredient|
      count[ingredient] += 1
    end

    count.key(count.values.max)
  end

  def self.all
    @@all
  end

end
