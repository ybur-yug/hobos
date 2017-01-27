require_relative '../lib/hobos'

describe Hobos do
  it "returns a hobo" do
    hobo = Hobos.hobo
    require 'pry'; binding.pry
    expect(hobo).to be_an_instance_of String
  end
end
