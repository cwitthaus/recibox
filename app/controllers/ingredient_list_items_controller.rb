class IngredientListItemsContoller < ApplicationController
	def new
		@ingredient_list_item = IngredientListItem.new
	end
end

