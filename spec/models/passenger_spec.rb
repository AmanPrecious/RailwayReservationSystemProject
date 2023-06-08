require 'rails_helper'

RSpec.describe Passenger, type: :model do
 
   # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:p_name) }
  it { should validate_presence_of(:p_age) }
  it { should validate_presence_of(:p_gender) }
  
end
