require 'rails_helper'

RSpec.describe Section, type: :model do
  subject do
    @user = User.create!(name: 'Jawad', email: 'user@domain.com', password: 'password', id: 1)
    @icon_file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'logo.png'), 'image/png')
    @section = Section.create(name: 'Food', icon: @icon_file, user_id: @user.id)
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid if any empty attribute' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be empty' do
    subject.name = ' '
    expect(subject).to_not be_valid
  end

  it 'name should have valid value' do
    expect(subject.name).to eql 'Food'
  end

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'user_id should be present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'user_id not be empty' do
    subject.user_id = ' '
    expect(subject).to_not be_valid
  end
end
