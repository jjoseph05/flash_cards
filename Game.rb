require_relative 'card'
require_relative 'deck'
require_relative 'view'

class Game    
  attr_reader :view, :deck

  def initialize
    @view = View.new
    @deck = Deck.new
    @deck.parse_file('flashcard_samples.txt')
  end

  def run
    card = @deck.sample
    while true
      view.show(card.question)
      user_input = view.get
      if deck.validate?(user_input)
        view.correct
        card = deck.sample
      elsif user_input.empty?
        exit
      else
        view.incorrect
      end
    end
  end
end

class View

  def correct
    puts "You are correct! Next card:"
  end

  def incorrect
    puts "You are incorrect! Try again!"
  end

  def get
    gets.chomp
  end

  def show(card_face)

    puts "+" + "-" * 42 + "+"
    puts card_face.scan(/\S.{0,38}\S(?=\s|$)|\S+/).map { |row| "| " + row.ljust(40) + " |" }
    puts "+" + "-" * 42 + "+"
  end
end


Game.new.run
