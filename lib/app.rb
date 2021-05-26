require 'sinatra'
require 'sinatra/base'
require_relative 'Game'
require_relative 'computer_selection'

class Selection < Sinatra::Base
  enable :sessions
  attr_reader :game

  get '/vscomp/new' do
    erb(:vs_comp_index)
  end

  post '/vscomp/' do
    session[:Playerselection] = params[:Playerselection]
    session[:Player_name] = params[:Player_name]
    redirect '/vscomp/result'
  end

  get '/vscomp/result' do
    @Player_name, @Playerselection  = session[:Player_name], session[:Playerselection]
    @computer, @game1 = ComputerSelection.new, Game.new(@Playerselection, @comp_selection, @Player_name)
    @comp_selection = @computer.random_selection
    @game1.result
    @computer = @game1.player2_name
    erb(:vs_comp_player_selection)
  end

  get '/pvp/new' do
    erb(:pvp_index)
  end

  post '/pvp' do
    session[:Player1_name] = params[:Player1_name]
    session[:Player2_name] = params[:Player2_name]
    redirect '/pvp/names'
  end

  get '/pvp/names' do
    @Player1_name = session[:Player1_name]
    @Player2_name = session[:Player2_name]
    erb(:pvp_player1_select)
  end

  post '/pvp/turn-one' do
    @Player1_name = session[:Player1_name]
    @Player2_name = session[:Player2_name]
    session[:Player1_selection] = params[:Player1selection]
    redirect '/pvp/turn-two'
  end

  get '/pvp/turn-two' do
    @Player1_name = session[:Player1_name]
    @Player2_name = session[:Player2_name]
    erb(:pvp_player2_select)
  end

  post '/pvp/result' do
    session[:Player2_selection] = params[:Player2selection]
    @Player1_name, @Player2_name = session[:Player1_name], session[:Player2_name]
    @Player1_selection, @Player2_selection = session[:Player1_selection], session[:Player2_selection]
    @game2 = Game.new(@Player1_selection, @Player2_selection, @Player1_name, @Player2_name)
    @game2.result
    erb(:pvp_result)
  end

end
