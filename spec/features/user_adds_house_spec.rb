require 'spec_helper'

feature 'user adds house', %q{
  as a user
  i want to have a house form that I can fill out
  so that the house i like can be saved under my prfile
  } do

    scenario 'user adds house with valid attributes' do
      user = FactoryGirl.create(:user)
      visit root_path
      click_on 'Sign in'
      form_filler(user)
      click_on 'Sign in'
      count = House.count
      house = FactoryGirl.build(:house)
      visit new_house_path
      house_new_helper(house)
      click_on 'Add House'

      expect(House.count).to eq(count + 1)
    end

    scenario 'user attaches a picture of the house' do

    end

end
