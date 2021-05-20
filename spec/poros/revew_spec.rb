require 'rails_helper'

RSpec.describe Review do

  context 'the review object ' do
    it 'exits' do
      info = {author: 'name', content: "me no likey"}
      review = Review.new(info)

      expect(review.class).to eq(Review)
    end

    it 'has attributes' do
      info = {author: 'name', content: "me no likey"}
      review = Review.new(info)

      expect(review.author).to eq('name')
      expect(review.content).to eq('me no likey')
    end
  end
end
