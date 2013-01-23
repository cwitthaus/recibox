class RecipesController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :destroy]

	AMOUNT_REGEX = /[0-9]*(\.|\/)*[0-9]/
	UNITS = ["teaspoon", "tablespoon", "tsp", "tsp", "cup", "quart", "pint", "pound", "lb", "oz"]
  

	def index
		@recipes = Recipe.paginate(page: params[:page])
	end

	def new
		@recipe = Recipe.new
	end
	
	def new_from_copy_paste
		@recipe = Recipe.new
		render 'new_from_copy_paste'
	end

	def create
		@recipe = Recipe.new(params[:recipe])
		step_num = 1
		@recipe.steps.each do |step|
			step.number = step_num
			step_num = step_num + 1
			step.recipe_id = @recipe
		end
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
		logger.debug "#{@ingredients}"
		@steps = @recipe.steps
	end

	def show_users_recipes
		@recipes = Recipe.find_all_by_uploaded_user(current_user)
		render 'my_recipes'
	end

	def get_parsed_ingredient_list
    logger.debug "PIHFPIDHFPIDHFPI #{params}"

		render :json => @awesome    
  #   potential_ingredients = Array.new
  #   certain_ings = Array.new
  #   potential_ings = Array.new
		# File.open(recipe.image.path+".txt","r").readlines.each do |line|
  #     logger.debug "CHECKING #{line}"
		# 	cleaned_line = clean_line line.squish
  #     potential_ingredients.push cleaned_line.join(" ")
		# end
  #   potential_ingredients.each do |potential_ingredient|
  #     is_existing_ingredient = !Ingredient.find_by_name(potential_ingredient).nil?
  #     if is_existing_ingredient
  #       certain_ings.push(potential_ingredient)
  #     else
  #       potential_ings.push(potential_ingredient)
  #     end
  #   end
  #   certain_ings.each do |ing|
  #     logger.debug "ADDING CERTAIN #{ing}"
  #     CertainWord.create([:word => ing, :recipe_list_id => recipe_list.id])
  #   end
  #   potential_ings.each do |ing|
  #     logger.debug "ADDING POTENTIAL #{ing}"
  #     PotentialWord.create([:word => ing, :recipe_list_id => recipe_list.id])
  #   end

	end

	def clean_line(line)
		words = line.split
		cleaned_line = Array.new
		words.each do |word|
			cleaned_word = word.gsub(/(\.|\,)/,'').singularize
			if !((cleaned_word =~ AMOUNT_REGEX)||
           (UNITS.include? cleaned_word)||
           (cleaned_word =~ EXTRAS_REGEX))
				cleaned_line.push(cleaned_word)
			end
		end
		return cleaned_line
	end

end