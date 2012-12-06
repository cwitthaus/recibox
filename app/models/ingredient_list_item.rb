# == Schema Information
#
# Table name: ingredient_list_items
#
#  id                 :integer          not null, primary key
#  recipe_id          :integer
#  measurement_amount :float
#  measurement_unit   :string(255)
#  ingredient_id      :integer
#

class IngredientListItem < ActiveRecord::Base
  attr_accessible :measurement_amount, :measurement_unit
  belongs_to :recipe
  belongs_to :ingredient
  validates :measurement_amount, presence: true
  # at first, I thought maybe we wanted to force measurement_unit to be present
  #   as well, but what about eggs or apples, or chicken breasts, etc...
end
