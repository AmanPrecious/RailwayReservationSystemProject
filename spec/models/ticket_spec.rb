require 'rails_helper'

RSpec.describe Ticket, type: :model do
 #let(:user){User.new}
  #let(:train){Train.new}
  subject { Ticket.new(user_id: 1, train_id:1, booking_status: "Pending", booking_date: "20-06-2023" ,from_station:"Indore",to_station:"Bhopal",class_type:"AC",seat_type:"LB",seat_no:22,mobile:7867452345,email:"a@gmail.com")}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a booking_status" do
    subject.booking_status=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a booking_date" do  
    subject.booking_date=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a from_station" do
    subject.from_station=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a to_station" do
    subject.to_station=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a classtype" do
    subject.class_type=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a seat_type" do  
    subject.seat_type=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a seat_no" do
    subject.seat_no=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a mobile" do
    subject.mobile=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the mobile is not 10 chars" do
    expect(subject.mobile.digits.count).to eq(10)
  end


end
