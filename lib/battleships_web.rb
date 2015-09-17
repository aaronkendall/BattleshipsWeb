require 'sinatra/base'
require_relative '../game_setup.rb'
require_relative 'board.rb'
require_relative 'cell.rb'
require_relative 'ship.rb'

class BattleshipsWeb < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/name' do
    @player = params[:name]
    erb :name
  end

  get '/new_game' do
    $board = Board.new(Cell)
    erb :new_game
  end

  get '/full_board' do
    @ship1 = Ship.aircraft_carrier
    @ship2 = Ship.battleship
    @ship3 = Ship.destroyer
    @ship4 = Ship.submarine
    @ship5 = Ship.patrol_boat
    @coord = params[:coord]
    @orientation = params[:orientation]
    $board.place(@ship1, @coord.to_sym, @orientation.to_sym)
    erb :new_game
  end

  get '/test' do
    @array = ["Nat", "Aaron", "Jesus"]
    erb :test
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
