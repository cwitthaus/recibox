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
		@recipe.steps.each { |step| step.recipe_id = @recipe}
		if @recipe.save
			flash[:success] = "Recipe Created"
			redirect_to @recipe
		else
			render 'new'
		end
	end

	def show
		@recipe = Recipe.find(params[:id])
		#@ingredients = @recipe.ingredients
		@steps = @recipe.steps
	end
end