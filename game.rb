class Game
  def initialize
    @player_1 = Player.new('Player 1')
    @player_2 = Player.new('Player 2')
    @turn = 1
  end

  def start
    puts "Are you ready #{@player_1.name} and #{@player_2.name}?\nLet's start the game!"
    new_turn
  end

  def new_turn
    ask = Question.new
    @new_question = ask.question
    @correct_answer = ask.answer
    
    puts "Player #{@turn} asks: #{@new_question}"
    print "> "
    choice = $stdin.gets.chomp

    num = [1, 2].select { |n| n != @turn}
    check_answer(choice, @correct_answer, num)
    show_score

    puts '------ NEW TURN ------'

    update_turn
  end

  def check_answer(p_answer, c_answer, player)
    if p_answer.to_i == c_answer
      puts 'Good job!'
    else
      puts 'Well, that was an attempt.'
      if player[0] != 1
        @player_2.lives -= 1
      else
        @player_1.lives -= 1
      end
    end
  end

  def show_score
    if @player_1.lives > 0 && @player_2.lives > 0
      puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"
    else
      if @player_1.lives == 0
        puts "Player 2 wins with a score of #{@player_2.lives}/3"
      else
        puts "Player 1 wins with a score of #{@player_1.lives}/3"
      end
      puts '------ GAME OVER ------'
      puts 'Bye bye now!'
      exit(0)
    end
  end

  def update_turn
    if @turn == 1
      @turn = 2
    else 
      @turn = 1
    end
    
    new_turn
  end

end