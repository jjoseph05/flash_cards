# require_relative 'Deck'
# require_relative 'View'

class Card
  attr_reader :question, :answer
	def initialize(question , answer)
		@question = question
		@answer = answer
	end
  
end

# p my_card = Card.new(1, 2)