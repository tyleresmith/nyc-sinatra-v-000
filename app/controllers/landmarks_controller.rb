class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks' do

    @landmark = Landmark.create(params[:landmark])
    if !params["figure"]["name"].empty?
      @landmark.figures << Figure.create(name: params["figure"]["name"])
    end

    if !params["landmark"]["name"].empty?
      @landmark.landmarks << Landmark.create(name: params["landmark"]["name"])
    end

    @landmark.save

    redirect "/landmarks/#{@landmark.id}" #locals: {message: "Successfully created landmark."}

  end
  post '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"].to_i)
    
    #binding.pry
    if !params["figure"]["name"].empty?
      @landmark.figure == Figure.create(name: params["figure"]["name"])
    end

    @landmark.save

    redirect "/landmarks/#{@landmark.id}" #locals: {message: "Successfully created landmark."}

  end
end
