require 'rails_helper'

RSpec.describe Party do
  describe 'relationships' do
    it { should belong_to :host }
#    it { should belong_to :movie }
    it { should belong_to(:movie).dependent(:destroy) }

  end
end
