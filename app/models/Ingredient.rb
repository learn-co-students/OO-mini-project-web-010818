class Ingredient
  @@all = []
  attr_accessor :item

  def initialize(item)
    @item = item
    @@all << self
  end

  def self.all
    @@all
  end


  def self.most_common_allergen
    common_allergen = Hash.new(0)
       Allergen.all.each do |each_allergen_instance|
         common_allergen[each_allergen_instance.ingredient] += 1
      end
      most_common = []
      common_allergen.each do |instance_item, count|
        if most_common == []
          most_common = instance_item, count
        elsif count > most_common[1]
          most_common = instance_item, count
        end
      end
      most_common[0]
  end
end
