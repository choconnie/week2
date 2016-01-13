require_relative 'spec_helper'

# SiegeEngine does 2x the damage against the Barracks
# Siege Engines can attack other siege engines even though they cannot attack any other units (such as Peasants or Footmen)

describe SiegeEngine do

  before :each do
    @siege_engine = SiegeEngine.new
  end

  it "has and knows its HP (health points)" do
    expect(@siege_engine.health_points).to eq(400)
  end

  it "has and knows its AP (attack power)" do
    expect(@siege_engine.attack_power).to eq(50)
  end

  it "SiegeEngine cannot attack Footman" do
    footman = Footman.new
    expect(@siege_engine.attack!(footman)).to be_falsey
  end

  it "SiegeEngine cannot attack Peasants" do
    peasants = Peasant.new
    expect(@siege_engine.attack!(peasants)).to be_falsey
  end

  it "SiegeEngine can attack SiegeEngine" do
    enemy_siege_engine = SiegeEngine.new
    expect(@siege_engine.attack!(enemy_siege_engine)).to be_truthy
  end

end

describe Barracks do

  describe "#damage" do
    it "should reduce the Barrack's health_points by SiegeEngine's attack_power(x2)." do
      @barracks = Barracks.new
      enemy = SiegeEngine.new
      @barracks.damage(enemy)
      expect(@barracks.health_points).to eq(400)
    end
  end

  describe "#train_siege_engine" do

    before :each do
      @barracks = Barracks.new
    end

    it "costs 200 gold" do
      #@barracks = Barracks.new
      @barracks.train_siege_engine
      expect(@barracks.gold).to eq(800)
    end

    it "costs 60 lumber" do
      #@barracks = Barracks.new
      @barracks.train_siege_engine
      expect(@barracks.lumber).to eq(440)
    end

    it "costs 3 food" do
      #@barracks = Barracks.new
      @barracks.train_siege_engine
      expect(@barracks.food).to eq(77)
    end

    it "produce a SiegeEngine unit" do
      siege_engine = @barracks.train_siege_engine
      expect(siege_engine).to be_an_instance_of(SiegeEngine)
    end
  end

end
