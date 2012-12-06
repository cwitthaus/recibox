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

require 'spec_helper'

describe Recipe do
	let (:user) { FactoryGirl.create(:user) }
  before { @recipe = Recipe.new(title: "Corn Bread", uploaded_user: user.id) }

  subject { @recipe }

  it { should respond_to(:title) }
  it { should respond_to(:source) }
  it { should	respond_to(:uploaded_user) }

  it { should be_valid }

  describe "when title is not present" do
  	before { @recipe.title = nil }
  	it { should_not be_valid }
  end

  describe "when source is not present" do
  	before { @recipe.source = nil }
  	it { should be_valid }
  end

  describe "when uploaded_user is not present" do
  	before { @recipe.uploaded_user = nil }
  	it { should_not be_valid }
  end

  describe "when adding ingredients" do

  end

  describe "when adding steps" do

  end
end
