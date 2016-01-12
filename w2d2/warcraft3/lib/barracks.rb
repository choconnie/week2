class Barracks

  attr_accessor :gold, :food

  def initialize
    @gold = 1000
    @food = 80
  end

  def can_train_footman?
    food >= 2 && gold >= 135 ? true : false
  end

  def train_footman
    if can_train_footman? == true
      @gold -= 135
      @food -= 2
      my_footman = Footman.new
    end
  end

  def can_train_peasant?
    food >= 5 && gold >= 90 ? true : false
  end

  def train_peasant
    if can_train_peasant? == true
      @gold -= 90
      @food -= 5
      my_peasant = Peasant.new
    end
  end

end
