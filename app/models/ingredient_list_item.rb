# == Schema Information
#
# Table name: ingredient_list_items
#
#  id                 :integer          not null, primary key
#  recipe_id          :integer
#  measurement_amount :float
#  measurement_unit   :string(255)
#  ingredient_id      :integer
#  details            :string(255)
#

class IngredientListItem < ActiveRecord::Base
  before_validation :check_ingredient
  attr_accessible :measurement_amount, :measurement_unit, :details, :ingredient_id, :ingredient_name
  attr_accessor :ingredient_name
  belongs_to :recipe, dependent: :destroy
  belongs_to :ingredient, dependent: :destroy
  validates :measurement_amount, presence: true
  validates :ingredient_id, presence: true
  # at first, I thought maybe we wanted to force measurement_unit to be present
  #   as well, but what about eggs or apples, or chicken breasts, etc...

  def check_ingredient
  	logger.debug "CURRENT ingredient_id: #{self.ingredient_name}"
  	ing = Ingredient.find_by_name(self.ingredient_name)
  	logger.debug "Corresponding ingredient: #{ing} :"
  	ing ||= Ingredient.create(:name => ingredient_name)
  	self.ingredient_id = ing.id
  end
end