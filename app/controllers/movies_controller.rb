class MoviesController < ApplicationController

    get '/movies' do 
        if logged_in?
            @movies = current_user.movies 
            erb :'movies/index'
        else 
            redirect '/login'
        end 
    end 

    get '/movies/new' do 
        erb :'movies/new'
    end     

    post '/movies' do 
        @movie = current_user.movies.build(title: params[:title], director: params[:director], genre: params[:genre])
        if @movie.save
            redirect '/movies'
        else 
            redirect '/movies/new'
        end 
    end 

    get '/movies/:id/edit' do 
        if logged_in?
            @movie = Movie.find_by(id: params[:id])
            if @movie.user_id == current_user.id 
                erb :'movies/edit'
            else 
                redirect '/movies'
            end 
         else 
            redirect '/login'
        end 
    end 

    delete '/movies/:id' do 
        if logged_in?
            @movie = Movie.find_by(id: params[:id])
            if @movie.user_id == current_user.id 
                @movie.delete 
                redirect '/movies'
            end 
         else 
            redirect '/login'
        end 
    end 

    patch '/movies/:id' do 
        if logged_in?
            @movie = Movie.find_by(id: params[:id])
            if @movie.update(title: params[:title], director: params[:director], genre: params[:genre])
                redirect '/movies'
            else 
                redirect "/movies/#{@movie.id}/edit"
            end 
         else 
            redirect '/login'
        end 
    end
    
    get '/movies/:id' do 
        @movie = Movie.find_by(id: params[:id])
        if @movie
            erb :'movies/show'
        else 
            redirect '/movies'
        end 
    end 
    
end 