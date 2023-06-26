require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  describe 'Viewing user index page' do
    before(:each) do
      @user1 = User.create(name: 'Sam', photo: 'https://icons.iconarchive.com/icons/iconsmind/outline/256/User-icon.png',
                           bio: 'Teacher from Poland.', posts_counter: 1)
      @user2 = User.create(name: 'Tom', photo: 'https://icons.iconarchive.com/icons/iconsmind/outline/256/User-icon.png',
                           bio: 'Teacher from India.', posts_counter: 1)
    end

    it 'should show list of all users' do
      visit users_path

      # Verify the display of names
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end
    it 'should show photo of all users' do
      visit users_path
      # # Verify the display of profile pictures
      expect(page.html).to include(@user1.photo)
      expect(page.html).to include(@user2.photo)
    end

    it 'should show posts_counter of all users' do
      visit users_path
      # Verify the display of the number of postss
      expect(page.html).to have_content(@user1.posts_counter)
      expect(page.html).to have_content(@user2.posts_counter)
    end

    it 'should show next_path of all users' do
      visit users_path
      # Verify redirection to the user's show page
      click_on @user1.name
      expect(current_path).to eq("/users/#{@user1.id}")
    end
  end
end
