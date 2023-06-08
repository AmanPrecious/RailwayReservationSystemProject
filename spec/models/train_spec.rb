require 'rails_helper'

RSpec.describe Train, type: :model do
  
  subject { Train.new(train_number: 1002, train_name: "Intercity Express", source_station: "Bhopal", destination_station: "Indore" ,arrival_time:"10:10 am",departure_time:"15:30 pm")}
  it "is not valid with invalid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a train_number" do
    subject.train_number=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a train_name" do
    subject.train_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a source_station" do
    subject.source_station=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a destination_station" do  
    subject.destination_station=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a arrival_time" do
    subject.arrival_time=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a departure_time" do
    subject.departure_time=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the train_number is not 4 chars" do
    expect(subject.train_number.length).to eq(4)
  end  

end
