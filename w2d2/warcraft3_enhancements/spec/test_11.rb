require_relative 'spec_helper'

# The damage amount should be an integer (Fixnum).
# Take the ceil division result.

describe Barracks do
  
  before :each do
    @barrack = Barracks.new
  end

  it "has and knows its HP" do
    expect(@barrack.health_points).to eq(500)
  end

  describe "#damage" do
    it "should reduce the Barrack's health_points by Footman's attack_power." do
      enemy = Footman.new
      @barrack.damage(enemy)
      expect(@barrack.health_points).to eq(495)
    end
  end

end
