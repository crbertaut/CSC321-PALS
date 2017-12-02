require 'rails_helper.rb'

describe "Guest", :type => :feature do 
  before (:all) do 
    Post.create(title: 'test1', user_id: '1', thread_type: 'Ride', description: 'This is a (ride) post.')
    Post.create(title: 'test2', user_id: '1', thread_type: 'Shift', description: 'This is a (shift) post')
    Post.create(title: 'test3', user_id: '1', thread_type: 'Other', description: 'This is an (other) post')
  end
  
  it "visit home page and see the list of all posts" do
    visit '/posts'
    expect(page).to have_content 'All Posts'
    expect(page).to have_content 'test1'
    expect(page).to have_content 'test2'
    expect(page).to have_content 'test3'
    expect(page).to have_content 'Add new post'
  end
  
  it "require login to access each post" do
    visit '/posts/1'
    current_path.should == new_user_session_path
  end 

  it "require login to create new post" do
    visit '/posts/new'
    #click_link 'Add new post'
    expect(page).to have_content 'Log in'
    current_path.should == new_user_session_path
  end
end
      

describe "User", :type => :feature do
  ## sign in as a user:
  before :each do
    User.create(email: 'user@example.com', password: 'password')
    visit '/'
    click_on 'Log in'
    within('form[class="new_user"]') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    find('input[class = "purple"]').click
    expect(page).to have_content 'Signed in successfully.'
  end

  before :all do 
    Post.create(title: 'test1', user_id: '1', thread_type: 'Ride', description: 'This is a (ride) post.')
    Post.create(title: 'test2', user_id: '1', thread_type: 'Shift', description: 'This is a (shift) post')
    Post.create(title: 'test3', user_id: '1', thread_type: 'Other', description: 'This is an (other) post')
  end 

  it "should let a user see all posts" do
    visit '/posts'
    expect(page).to have_content 'All Posts'
    expect(page).to have_content 'test1'
    expect(page).to have_content 'test2'
    expect(page).to have_content 'test3'
  end 
  
  it "should let a user to create new posts" do
    ## Ride:
    click_on "Add new post"
    current_path.should == new_post_path
    within('form[action="/posts"]') do
      fill_in 'post_title', with: 'Looking for a ride to pals this Sunday'
      fill_in 'post_description', with: 'I have a dog shift at pals this Sunday morning, I would love to share a ride to pals at 11am from Grinnell College.'
      select "Ride", :from => "post_thread_type"
    end
    click_on "Submit"
    current_path.should == posts_path
    expect(page).to have_content 'Looking for a ride to pals this Sunday'
    
    ## Shift:
    click_on "Add new post"
    current_path.should == new_post_path
    within('form[action="/posts"]') do
      fill_in 'post_title', with: 'Exchange a cat shift for the coming Monday'
      fill_in 'post_description', with: 'I have a cat shift this Monday from 8-10am.
                                        I would love to exchange for a shift in the afternoon.'
      select "Shift", :from => "post_thread_type"
    end
    click_on "Submit"
    current_path.should == posts_path
    expect(page).to have_content 'Exchange a cat shift for the coming Monday'
  end
  

  it "should let a user filter posts by type: ride posts" do
    visit '/posts'
    check "types_Shift"
    uncheck "types_Ride"
    uncheck "types_Other"
    click_on "Refresh"      ## Note: Having issues with refresh
    expect(page).to have_content 'test1'
    expect(page).not_to have_content 'test2'
    expect(page).not_to have_content 'test3'
  end 
end
=begin  
  it "should let a user to create a new post" do
        #post1 = FactoryBot.build( :post )
        post_params = FactoryBot.attributes_for(:post)
        
        #expect(assigns(:posts)).to eq([post])
        post :create, post: post_params
        expect ( response ).to change(Post, :count).by(1) 
      end
    end
    
    describe "anonymous user" do
    #3) type some things
    #4) click 'post'
    #5) see all the correct post information on the home page
      it "should let a user see all the posts" do
        login_with create( :user )
        get :index
        expect( response ).to render_template( :index )
      end
    end

    describe "GET index" do
      it "assigns @post" do
        #post = Post.create
        post = FactoryBot.build( :post )
        get :index
        expect(assigns(:posts)).to eq([post])
      end
    end
=end

#end