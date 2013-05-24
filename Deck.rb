require_relative 'Card'

class Deck
	attr_reader :deck
	def initialize
		@deck = []
		parse_file
	end

	def parse_file(filename = "flashcard_samples.txt")
		File.open(filename, "r") do |file|
			card_array = []
			file.each_line do |line|
				card_array << line.chomp
				if card_array.count == 3
					@deck << Card.new(card_array[0], card_array[1])
					card_array = []
				end
			end
		end
	end

	def sample
		@current_card = @deck.sample
	end

	def validate?(input)
		@current_card.answer.to_s == input.to_s
	end

end