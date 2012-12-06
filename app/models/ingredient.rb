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
end
