require 'rails_helper'

RSpec.describe Guest do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :party }
  end

  describe 'instance methods' do
    before :each do
      @user = create(:user)
      @guest = create(:guest, user: @user)
    end
    
    it '#name' do
      expect(@guest.name).to eq(@user.name)
    end
  end
end
