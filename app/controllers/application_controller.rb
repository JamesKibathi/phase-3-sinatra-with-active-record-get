class ApplicationController < Sinatra::Base

  # Add this line to set Content-Type header for all responses
  set :default_content_type, 'application/json'
  get '/' do
    { message: "Hello world" }.to_json
  end

  get '/games' do
    # get all the games from the database
    games=Game.all
    # return a JSON response with an array of all the game data
    games.to_json
  end

  # Using the :id syntax to send a dynamic route
  get '/games/:id' do
    # look up the game in the db using its id - we use params hash
    game=Game.find(params[:id])
    game.to_json
  end

  # create a post request
  post "/games" do
    new_game=Game.create(title:params[:title],genre:params[:genre],platform:params[:platform],price:params[:price])
    new_game.to_json
  end
end
