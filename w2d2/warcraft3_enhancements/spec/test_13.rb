require_relative 'spec_helper'

# A dead unit cannot attack another unit.
# Conversely, an alive unit will also not attack another unit that is already dead.

describe Unit do

  before :each do
    @unit1 = Unit.new(0, 10)
    @unit2 = Unit.new(60, 10)
  end

  describe "#attack!" do

    it "Dead cannot attack alive unit" do
      expect(@unit1.dead?).to be_truthy
      expect(@unit1.attack!(@unit2)).to be_falsey
    end

    it "Alive cannot attack dead unit" do
      expect(@unit1.dead?).to be_truthy
      expect(@unit2.attack!(@unit1)).to be_falsey
    end

    it "Alive should attack alive unit" do
      @unit3 = Unit.new(60, 10)
      expect(@unit3.dead?).to be_falsey
      expect(@unit2.attack!(@unit3)).to be_truthy
    end
  end

end
