require 'rails_helper'

RSpec.describe 'Sections Page', type: :system do
  describe 'Section /index' do
    before :each do
      @user = User.create!(name: 'Jawad', email: 'email@domain.com', password: 'password')
      @icon_file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'logo.png'), 'image/png')
      @section = Section.create(name: 'Foods', icon: @icon_file, user_id: @user.id)
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'email@domain.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      sleep(2)
      visit user_sections_path(@user)
    end

    it 'displays the name of section' do
      expect(page).to have_content(@section.name)
    end

    it 'displays the Total Payment' do
      expect(page).to have_content('Total Payment')
    end

    it 'displays a button with text Add New Section' do
      expect(page).to have_content('Add New Section')
    end

    it 'button redirects to a page to Create a New Section' do
      click_link 'Add New Section'
      expect(page).to have_current_path new_user_section_path(@user)
    end
  end
end
