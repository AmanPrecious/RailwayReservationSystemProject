require 'rails_helper'

RSpec.describe User, type: :model do

  subject { User.new(first_name: "Jack", last_name: "Smith", mobile: "8889995678", email: "jsmith@sample.com" ,address:"indore",password:"123456")}
  it "is not valid with invalid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a first_name" do
    subject.first_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a last_name" do
    subject.last_name=nil
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
  it "is not valid without a Password" do
    subject.password=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the mobile number is not 10 chars" do
    expect(subject.mobile.length).to eq(10)
  end  
  it "is not valid if the mobile number is not all digits" do
    expect((subject.mobile).match?(/\A-?\d+\Z/)).to eq(true)
  end
end