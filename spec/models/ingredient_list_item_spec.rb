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

require 'spec_helper'

describe IngredientListItem do
	let(:recipe) { FactoryGirl.create(:recipe) }
	let(:ingredient) { FactoryGirl.create(:ingredient) }
	before do
		@ingredient_list_item = IngredientListItem.new(
						measurement_amount: 1.5,
						measurement_unit: "cups")
	end

	subject { @ingredient_list_item }

	it { should respond_to(:measurement_unit) }
	it { should respond_to(:measurement_amount) }

	it { should be_valid }

	describe "when measurement_amount is not present" do
		before { @ingredient_list_item.measurement_amount = nil }
		it { should_not be_valid }
	end

	describe "when measurement_unit is not present" do
		before { @ingredient_list_item.measurement_unit = nil }
		it { should be_valid }
	end
end
