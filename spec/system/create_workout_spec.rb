require 'rails_helper'

RSpec.describe 'Creating a workout', type: :system do
  scenario 'valid_inputs' do
    login_as(create(:user))
    visit root_path
    fill_in 'Date', with: '12/31/2023'
    click_on 'Add lift'
    fill_in 'Lift name', with: 'Bench Press'
    click_on 'Add Set'
    fill_in 'workout_lifts_attributes_0_groups_attributes_0_weight', with: '225'
    fill_in 'workout_lifts_attributes_0_groups_attributes_0_reps', with: '12'
    click_on 'Add Set'
    fill_in 'workout_lifts_attributes_0_groups_attributes_1_weight', with: '225'
    fill_in 'workout_lifts_attributes_0_groups_attributes_1_reps', with: '12'
    click_on 'Add Set'
    fill_in 'workout_lifts_attributes_0_groups_attributes_2_weight', with: '225'
    fill_in 'workout_lifts_attributes_0_groups_attributes_2_reps', with: '12'
    click_on 'Save Workout'

    expect(page).to have_content('Bench Press')
    expect(page).to have_content('8100')
  end
end