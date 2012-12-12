class RecipesController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :destroy]

	def index
		@recipes = Recipe.paginate(page: params[:page])
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(params[:recipe])
		@recipe.steps.each { |step| step.recipe_id = @recipe }
		@recipe.uploaded_user = current_user
		if @recipe.save
			flash[:success] = "Recipe Created"
			redirect_to @recipe
		else
			render 'new'
		end
	end

	def show
		@recipe = Recipe.find(params[:id])
		@ingredients = @recipe.ingredient_list_items
		@steps = @recipe.steps
	end
end