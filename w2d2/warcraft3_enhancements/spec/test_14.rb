require_relative 'spec_helper'

# Add lumber as a resource that the barracks can handle.

describe Barracks do

  it "starts off with 500 lumber resources" do
    @barracks = Barracks.new
    expect(@barracks.lumber).to eq(500)
  end

end
