require 'sinatra'

# set :bind, '0.0.0.0'

weapons = ['rock', 'paper', 'scissors']

def computer_guess
	weapons = ['rock', 'paper', 'scissors']
	weapons.sample
end

def user_guess
	weapons = ['rock', 'paper', 'scissors']
	weapons.sample
end

get '/' do
	@weapons = weapons
	@title = "RPS the Game"
	erb :home
end

get '/rock' do
	current_guess = computer_guess
	@title = "The Rock"
	@computer_guess = current_guess
	@user_guess = "rock"
	@weapons = weapons
	if current_guess == 'paper'
		@message = "you played rock, you LOSE"
	elsif current_guess == 'scissors'
		@message = "you played rock, you WIN"
	else
		@message = "you played rock, you both LOST"
	end
	erb :play
end

get '/paper' do
	current_guess = computer_guess
	@title = "Paper Cut, Watch Out!"
	@computer_guess = current_guess
	@user_guess = "paper"
	@weapons = weapons
	if current_guess == 'rock'
		@message = "you played paper, you WON"
	elsif current_guess == 'scissors'
		@message = "you played paper, you LOST"
	else
		@message = "you played paper, you both LOST"
	end

	erb :play
end

get '/scissors' do
	current_guess = computer_guess
	@title = "Running with Scissors"
	@computer_guess = current_guess
	@user_guess = "scissors"
	@weapons = weapons
	if current_guess == 'paper'
		@message = "you played scissors, you WON"
	elsif current_guess == 'scissors'
		@message = "you played scissors, you both LOST"
	else
		@message = "you played scissors, you LOST"
	end
	erb :play
end

get '/dice' do
	current_guess = computer_guess
	user_guess = computer_guess
	@title = "Roll the Dice"
	@computer_guess = current_guess
	@user_guess = user_guess
	@weapons = weapons

	if current_guess == user_guess
		@message = "Tie"
	elsif current_guess == 'rock' and user_guess == 'scissors' or current_guess == 'paper' and user_guess == 'rock'
		@message = "You were given #{user_guess} : You Lose"
	else
		@message = "You were given #{user_guess} : You WIN (i think?)"
	end
	erb :play
end

get '/about' do
	@title = "RPS About"
	@weapons = weapons
	@about = "Rock Paper Scissors</a> is a simple game. If you don't know how to play then
			google it or take a look at the link i just gave you."
	erb :about
end