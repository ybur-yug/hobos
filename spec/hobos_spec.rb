require '../lib/hobos'

describe Hobos do
  let(:api) { Hobos::Api.new }

  it "returns a hobo name for a given ID" do
    expect(api.hobo_by_id 1).to eq 'Stewbuilder Dennis'
  end

  it "handles bad ids" do
    expect(api.hobo_by_id 999).to eq ""
  end

  it "returns a random hobo with no id" do
    expect(api.hobo == "").to eq false
  end
end
