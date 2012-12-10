class IngredientsController < ApplicationController

	def index
		@ingredients = Ingredient.paginate(page: params[:page])
	end

	def new
		@ingredient = Ingredient.new
	end

	def create
		@ingredient = Ingredient.new(params[:ingredient])
		if @ingredient.save
			flash[:success] = "Ingredient Created"
			redirect_to @ingredient
		else
			render 'new'
		end
	end	

	def show
		@ingredient = Ingredient.find(params[:id])
		@recipes = @ingredient.recipes
	end
end