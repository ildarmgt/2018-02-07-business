require 'sinatra'

get '/' do
    erb :index
end

get '/about' do
    erb :about
end

get '/contact' do
    erb :contact
end

get '/login' do
    if params[:mypassword] == '1234'
        redirect '/profile'
    else
        erb :login
    end
    erb :login
end

get '/profile' do
    erb :profile
end
