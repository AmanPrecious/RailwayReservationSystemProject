require 'rails_helper'

RSpec.describe Station, type: :model do

  subject { Station.new(stn_name: "Bhopal Junction", stn_location: "Mp", stn_code: "3545")}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a stn_name" do
    subject.stn_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a stn_location" do
    subject.stn_location=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a stn_code" do
    subject.stn_code=nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the stn_code is not 4 chars" do
    expect(subject.stn_code.length).to eq(4)
  end


end
