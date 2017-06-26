class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end
  def name=(board)
    @board = board
  end
  def board
    @board
  end

  def display_board(board = @board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player = "X")
    board[index] = current_player
  end

  def position_taken?(board = @board, index)
    board[index] != " " && board[index] != ""
  end

  def valid_move?(board = @board, index)
    if !position_taken?(board, index) && index.between?(0, 8)
      return true
    else
      return false
  end
  end

  def turn_count(board = @board)
    # board = ['', '' , '', "X"]
    counter = 0
    board.each do |position|
      #position == ' ' or 'X' or 'O'
      if position == 'X' || position == 'O'
        counter += 1
      end
    end

    return counter #integer, number of turns
  end

  def current_player(board = @board)
    if turn_count(board).even?
      return "X"
    else
      return "O"
    end
  end

  def turn(board = @board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board = @board, index)
      move(index, current_player)
      display_board(board = @board)
    else
      turn(board)
    end
  end

  def won?(board = @board)
    WIN_COMBINATIONS.find{|win_combo| board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] && board[win_combo[0]] != " "}
  end

  def full?(board = @board)
    WIN_COMBINATIONS.all?{|complete| board[complete[0]] == "X" || board[complete[0]] == "O"}
  end

  def draw?(board = @board)
    full?(board) && !won?(board)
  end

  def over?(board = @board)
    full?(board) || won?(board) || draw?(board)
  end

  def winner(board = @board)
    if won?(board)
      indices = won?(board)
       index = indices[0]
       board[index]
     end
   end

   def play(board = @board)
    until over?(board)
      turn(board)
    end
   if won?(board)
     puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
   end
   end

end
