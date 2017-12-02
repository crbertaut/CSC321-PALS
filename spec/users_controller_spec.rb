require 'rails_helper.rb'

describe "the login process", :type => :feature do
  before :each do
    User.create(email: 'user@example.com', password: 'password')
  end

  it "signs me in" do
    visit '/volunteers/login'
    within("form") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
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
    click_button 'LOG OUT'
    expect(page).to have_content 'Signed out successfully.'
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