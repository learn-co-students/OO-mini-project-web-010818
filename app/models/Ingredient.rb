class Ingredient
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

#.most_common_allergen should return the ingredient instance that the highest number of users are allergic to
  def self.most_common_allergen
    all_allergens = Allergen.all.map do |allergen|
      allergen.ingredient
    end

    frequency = {}
    all_allergens.each do |ingredient|
      if frequency.include?(ingredient)
        frequency[ingredient] += 1
      else
        frequency[ingredient] = 1
      end
    end

    frequency.max_by { |allergen, count| count}[0]
  end

end
