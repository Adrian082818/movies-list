class UsersController < ApplicationController

    get '/signup' do 
        erb :'/users/signup'
    end 

    post '/signup' do 
        @user = User.new
        @user.username = params[:username]
        @user.password = params[:password]

        if @user.save
            redirect '/login'
        else 
            redirect '/signup'
        end 
    end     

    get '/login' do 
        erb :'/users/login'
    end 

    post '/login' do 
        login(params[:username], params[:password])
        redirect '/'
    end 

    get '/logout' do 
        logout
        redirect '/login' 
    end
end 