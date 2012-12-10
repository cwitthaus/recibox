# == Schema Information
#
# Table name: steps
#
#  id           :integer          not null, primary key
#  instructions :string(255)
#  number       :integer
#  recipe_id    :integer
#

class Step < ActiveRecord::Base
  attr_accessible :instructions, :number, :recipe_id
  validates :instructions, presence: true
  validates :number, presence: true
  validates :recipe_id, presence: true

  belongs_to :recipe
  default_scope order: 'steps.number ASC'
end
