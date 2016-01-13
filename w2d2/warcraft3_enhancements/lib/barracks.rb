class Barracks

  attr_accessor :gold, :food, :lumber, :health_points

  def initialize
    @gold = 1000
    @food = 80
    @lumber = 500
    @health_points = 500
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

  def can_train_siege_engine?
    food >= 3 && gold >= 200 && lumber >= 60 ? true : false
  end

  def train_siege_engine
    if can_train_siege_engine? == true
      @gold -= 200
      @food -= 3
      @lumber -= 60
      my_siege_engine = SiegeEngine.new
    end
  end

  def damage(enemy)
    if enemy.class == Footman
      @health_points -= (enemy.attack_power/2.0).ceil
    elsif enemy.class == SiegeEngine
      @health_points -= (enemy.attack_power*2.0).ceil
    end
  end

end
