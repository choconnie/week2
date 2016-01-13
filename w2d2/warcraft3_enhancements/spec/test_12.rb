require_relative 'spec_helper'

# Define a method dead? on the Unit class.

describe Unit do

  describe "#dead?" do

    it "has 0 HP" do
      unit = Unit.new(1000, 80)
      expect(unit).to receive(:health_points).and_return(0)
      expect(unit.dead?).to be_truthy
    end

    it "has 0 HP" do
      footman = Footman.new
      expect(footman).to receive(:health_points).and_return(0)
      expect(footman.dead?).to be_truthy
    end

    it "has 0 HP" do
      peasant = Peasant.new
      expect(peasant).to receive(:health_points).and_return(0)
      expect(peasant.dead?).to be_truthy
    end

  end

end