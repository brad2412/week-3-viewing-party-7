require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email)}
    it { should have_secure_password }

    it 'validates presence of password' do
      user = User.new(name: 'John Doe', email: 'john@example.com')
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end 
end
