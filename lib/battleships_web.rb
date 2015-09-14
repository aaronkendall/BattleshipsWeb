require 'sinatra/base'

class battleshipsWeb < Sinatra::Base
  get '/' do
    'Hello battleshipsWeb!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
