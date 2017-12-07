require 'rails_helper.rb'

@javascript
describe "the sign up process", :type => :feature do
  before :each do
    Interest.create(name: "Cat fostering")
    Interest.create(name: "Dog fostering")
    Interest.create(name: "Cooking/baking")
  end
  
  it "lets me create an account" do
    login_as nil
    visit '/'
    click_on 'Sign up'
    within('form[class="new_user"]') do
      fill_in 'user_name', with: "User Example"
      select "1990", from: 'user_dob_1i', :match => :first
      select "4", from: 'user_dob_2i', :match => :first
      select "1", from: 'user_dob_3i', :match => :first
      fill_in 'phone', with: "5555555555"
      fill_in 'user_email', with: "user@ex.com"
      fill_in 'user_username', with: "user"
      fill_in 'user_password', with: "password"
      fill_in 'user_password_confirmation', with: "password"
      #find('dogs').click
      click 'dogs'
      click_on 'cats'
      #puts page.html
      check 'Cooking/baking'
      check('cat_Fostering')
      check('dog_Fostering')
      fill_in 'user_experience', with: "I like dogs."
    end
    click_on 'Volunteer'
    expect(page).to have_content("You have signed up successfully.")
    expect(page).to have_content('Dog fostering')
    expect(page).to have_content("Cooking/baking")
    expect(page).to have_content('Cat fostering')
  end
end

describe "the login process", :type => :feature do
  before :each do
    User.create(email: 'user@example.com', password: 'password')
  end

  it "signs me in" do
    visit '/'
    click_on 'Log in'
    within('form[class="new_user"]') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    #click_button 'Log in'
    find('input[class = "purple"]').click
    expect(page).to have_content 'Signed in successfully.'
  end
end
  
describe "the login process", :type => :feature do
  before :each do
    User.create(email: 'user@example.com', password: 'password')
  end

  it "logs me out" do
    login_as create( :user )
    visit '/'
    click_button 'Log Out'
    expect(page).to have_content 'Signed out successfully.'
  end
end

describe "Can appropriately access other users", :type => :feature do
  it "redirects when trying to access a user" do
    login_as nil
    visit '/volunteers/profiles/1'
    current_path.should == user_session_path
  end
  
  it "lets a logged in user access another user" do
    login_as create( :user )
    visit '/volunteers/profiles/1'
    current_path.should == user_path(1)
  end
end


=begin 
RSpec.describe UsersController, :type => :controller do
  describe "anonymous user" do
    before :each do
      # This simulates an anonymous user
      login_with nil
    end

    #it "should be redirected to signin when trying to access index" do
      #get :index
      #expect( response ).to redirect_to( new_user_session_path )
    #end
    
    it "should be redirected to signin when trying to access individual" do
      # This is conditional on the fact that there is a user 1 to access
      visit '/volunteers/profiles/1'
      #user1 = FactoryBot.create(:user)
      #user1.confirmed_at = Time.now
      #user1.save
      #user_path(user1)
      expect( response ).to redirect_to( new_user_session_path )
    end
    
    it "should let a user see one user" do
      login_with create( :user )
      # This is conditional on the fact that there is a user 1 to access
      visit '/volunteers/profiles/1'
      #user1 = FactoryBot.create(:user)
      #user1.confirmed_at = Time.now
      #user1.save
      #user_path(user1)
      expect( response ).to render_template(user)
    end
  end
end
=end