# == Schema Information
#
# Table name: ingredients
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  substitution :string(255)
#

class Ingredient < ActiveRecord::Base
  attr_accessible :substitution, :name
  validates :name, presence: true
  validates_uniqueness_of :name

  has_many :recipes, :through => :ingredient_list_items
  has_many :ingredient_list_items
end
