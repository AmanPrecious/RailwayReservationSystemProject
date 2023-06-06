require 'rails_helper'

RSpec.describe Seat, type: :model do
  subject { Seat.new(class_type: "AC", seat_type: "LB", seat_quantity: "35",train_id:"1")}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a class_type" do
    subject.class_type=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a seat_type" do
    subject.seat_type=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a seat_quantity" do
    subject.seat_quantity=nil
    expect(subject).to_not be_valid
  end

end
