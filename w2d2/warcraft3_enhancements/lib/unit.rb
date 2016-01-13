class Unit

  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def damage(attacker)
    @health_points -= attacker.attack_power
  end

  def attack!(enemy_unit)
    if self.dead? || enemy_unit.dead?
      nil
    else
      enemy_unit.damage(self)
    end
  end

  def dead?
    health_points <= 0
  end

end