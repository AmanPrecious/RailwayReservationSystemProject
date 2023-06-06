require 'rails_helper'

RSpec.describe Passenger, type: :model do
  subject { Passenger.new(p_name: "Aman", p_age: 22, p_gender: "Male")}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a p_name" do
    subject.p_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a p_age" do
    subject.p_age=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a seat_p_gender" do
    subject.p_gender=nil
    expect(subject).to_not be_valid
  end
end
