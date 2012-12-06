# == Schema Information
#
# Table name: recipes
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  source        :string(255)
#  uploaded_user :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Recipe < ActiveRecord::Base
  attr_accessible :source, :title, :uploaded_user,
  	 :steps_attributes, :ingredient_list_items_attributes
  validates :title, presence: true
  validates :uploaded_user, presence: true

  has_many :steps, dependent: :destroy
  has_many :ingredient_list_items, dependent: :destroy

  accepts_nested_attributes_for :steps, 
  		:reject_if => lambda { |a| a[:instructions].blank? },
  		:allow_destroy => true

  accepts_nested_attributes_for :ingredient_list_items, 
  		:reject_if => lambda { |a| a[:measurement_amount].blank? },
  		:allow_destroy => true
end
