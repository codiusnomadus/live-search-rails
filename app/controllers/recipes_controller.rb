class RecipesController < ApplicationController
  
  # GET: /recipes/
  def index
    @recipes = Recipe.search(params[:search]).order(:title).order(:title).page(params[:page])
  end
end