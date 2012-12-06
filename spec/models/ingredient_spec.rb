# == Schema Information
#
# Table name: ingredients
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  substitution :string(255)
#

require 'spec_helper'

describe Ingredient do
  before { @ingredient = Ingredient.new(name: "milk") }

  subject { @ingredient }

  it { should respond_to(:name) }
  it { should respond_to(:substitution) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @ingredient.name = nil }
  	it { should_not be_valid }
  end

  describe "when substitution is not present" do
  	before { @ingredient.substitution = nil }
  	it { should be_valid }
  end

#  describe "belongs to a recipe"

#	end
end
