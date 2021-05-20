require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:friends).dependent(:destroy) }
    it { should have_many(:parties).dependent(:destroy) }
    it { should have_many(:guests).dependent(:destroy) }
    it { should have_many :invites }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_confirmation_of(:password) }
  end
end
