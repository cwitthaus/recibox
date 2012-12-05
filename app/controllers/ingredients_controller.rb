class IngredientsController < ApplicationController

	def index
		@ingredients = Ingredient.paginate(page: params[:page])
	end

end