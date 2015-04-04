require './lib/hobos'

describe Hobos::HoboAPI do
  let(:api) { Hobos::HoboAPI.new }

  it "returns a hobo name for a given ID" do
    expect(api.hobo 1).to eq 'Stewbuilder Dennis'
  end

  it "handles bad ids" do
    expect(api.hobo 999).to eq "{ 'error': { 'message': 'bad UID' } }"
  end
end
