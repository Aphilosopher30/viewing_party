require 'rails_helper'

RSpec.describe Party do
  describe 'relationships' do
    it { should belong_to :host }
    it { should have_many :guests }
  end

  describe 'validations' do
    it { should validate_presence_of :host_id }
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :title }

    it { should validate_numericality_of :host_id }
    it { should validate_numericality_of :movie_id }
    it { should validate_numericality_of :duration }
  end
end
