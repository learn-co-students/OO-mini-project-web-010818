class Allergen

  attr_reader :ingredient, :user

  @@all = []

  def initialize(ingredient_instance, user)
    @ingredient = ingredient_instance
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

end
