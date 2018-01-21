class Ingredient
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    all_allergy_instances = Allergen.all.map { |a| a.ingredient }
    all_allergy_instances.max_by { |i| all_allergy_instances.count(i) }
  end
end
