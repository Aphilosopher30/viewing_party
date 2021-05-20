require 'rails_helper'

RSpec.describe Actor do

  context 'the actor object ' do
    it 'exits' do
      info = {name: 'name', character: "persona"}
      actor = Actor.new(info)

      expect(actor.class).to eq(Actor)
    end

    it 'has attributes' do
      info = {name: 'name', character: "persona"}
      actor = Actor.new(info)

      expect(actor.name).to eq('name')
      expect(actor.character).to eq('persona')
    end
  end
end
