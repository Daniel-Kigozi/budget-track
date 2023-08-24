require 'rails_helper'

RSpec.describe 'payment', type: :feature do
  describe 'Create new section' do
    before(:each) do
      User.destroy_all
      Section.destroy_all
      @user = User.create(name: 'Jawad', email: 'email@domain.com', password: 'password')
      @icon_file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'logo.png'), 'image/png')
      @section = Section.create(name: 'Foods', icon: @icon_file, user_id: @user.id)
      visit new_user_session_path
      fill_in 'Email', with: 'email@domain.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Add New Section'
      fill_in 'Name', with: 'school'
      attach_file('Icon', "#{Rails.root}/spec/fixtures/files/logo.png")
      click_button 'Submit'
      visit user_section_path(user_id: @user.id, id: @section.id)
      click_link 'Add New'
      fill_in 'Name', with: 'New_Item'
      fill_in 'Amount', with: 200
      click_button 'Submit'
      visit new_user_section_payment_path(user_id: @user.id, section_id: @section.id)
      fill_in 'Name', with: 'New_Payment'
      fill_in 'Amount', with: 100
      select 'school', from: 'section'
      click_button 'Submit'
    end

    it 'Create a new payment' do
      expect(page).to have_content('100')
      expect(page).to have_content('school')
    end
  end
end
