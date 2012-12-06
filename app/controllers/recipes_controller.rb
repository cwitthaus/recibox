class RecipesController < ApplicationController

	def index
		@recipes = Recipe.paginate(page: params[:page])
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(params[:recipe])
		@recipe.uploaded_user = current_user
		@recipe.steps.each { |step| step.recipe_id = @recipe }
		@recipe.ingredient_list_items.each { |ingredient_list_item|
			ingredient_list_item.ingredient_id = 1 }
		if @recipe.save
			flash[:success] = "Recipe Created"
			redirect_to @recipe
		else
			render 'new'
		end
	end

	def show
		@recipe = Recipe.find(params[:id])
		@ingredients = @recipe.ingredients
		@steps = @recipe.steps
	end
end