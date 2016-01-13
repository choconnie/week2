class SiegeEngine < Unit

  attr_accessor :health_points, :attack_power

  def initialize
    @health_points = 400
    @attack_power = 50
  end

  def attack!(enemy_unit)
    if self.dead? || enemy_unit.dead?
      nil
    elsif enemy_unit.class == SiegeEngine
      self.damage(enemy_unit)
    end
  end

end