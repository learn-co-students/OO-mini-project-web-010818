class Allergen

  attr_reader :user, :ingredient

  @@all = []

  def initialize(user, ing)
    @user = user
    @ingredient = ing
    @@all << self
  end

  def self.all
    @@all
  end

end
