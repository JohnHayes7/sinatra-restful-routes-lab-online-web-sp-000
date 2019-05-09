# require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  
  get '/recipes' do
    @recipes = Recipe.all
  
    erb :index
  end
  
  get '/recipes/new' do
    
    erb :new
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    
    erb :edit
  end
  
  
  get '/recipes/:id' do
     @recipe = Recipe.find(params[:id])
    
    erb :show
  end
  
  
  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
   
    redirect "/recipes/#{@recipe.id}"
    
  end
  
  
  patch '/recipes/:id' do
    @recipe = Recipe.find_by(params[:id])
    # binding.pry
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    
    
     redirect "/recipes/#{@recipe.id}"
  end
  
  
  delete '/recipes/:id' do
    recipe = Recipe.find_by(params[:id])
    recipe.delete
    binding.pry
    redirect '/recipes'
  end
  
  

end
