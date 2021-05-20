class Actor
  attr_reader :name, :character

  def initialize(actor)
    @name = actor[:name]
    @character = actor[:character]
  end
end
