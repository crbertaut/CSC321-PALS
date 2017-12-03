require 'rails_helper.rb'

describe "Guest", :type => :feature do 
  before (:each) do 
    Post.create!(title: 'test1', user_id: '1', thread_type: 'Ride', description: 'This is a (ride) post.', date: "2017-12-03 00:00:00")
    Post.create!(title: 'test2', user_id: '1', thread_type: 'Shift', description: 'This is a (shift) post', date:"2017-12-03 00:00:00")
    Post.create!(title: 'test3', user_id: '1', thread_type: 'Other', description: 'This is an (other) post', date:"2017-12-03 00:00:00")
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

  before (:each) do 
    Post.create!(title: 'test1', user_id: '1', thread_type: 'Ride', description: 'This is a (ride) post.', date: "2017-12-03 00:00:00")
    Post.create!(title: 'test2', user_id: '1', thread_type: 'Shift', description: 'This is a (shift) post,', date: "2017-12-03 00:00:00")
    Post.create!(title: 'test3', user_id: '1', thread_type: 'Other', description: 'This is an (other) post', date: "2017-12-03 00:00:00")
  end 

  it "should let a user see all posts" do
    visit '/posts'
    expect(page).to have_content 'All Posts'
    expect(page).to have_content Post.all[1].title
    expect(page).to have_content Post.all[2].title
    expect(page).to have_content Post.all[3].title
  end 
  
  it "should let a user to create new posts" do
    ## Ride:
    click_on "Add new post"
    puts "hey1"
    current_path.should == new_post_path
    within('form[action="/posts"]') do
      fill_in 'post_title', with: 'Looking for a ride to pals this Sunday'
      fill_in 'post_description', with: 'I have a dog shift at pals this Sunday morning, I would love to share a ride to pals at 11am from Grinnell College.'
      select "Ride", :from => "post_thread_type"
    end
    click_on "Submit"
    puts "hey2"
    current_path.should == posts_path
    expect(page).to have_content Post.last.title 
    
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
    expect(page).to have_content Post.last.title 
  end
  

  it "should let a user filter posts by type: ride posts" do
    visit posts_path
    within ("form[id='types_form']") do
      check "types_Shift"
      uncheck "types_Ride"
      uncheck "types_Other"
      click_button "Refresh"      ## Note: Having issues with refresh
    end
    current_path.should == posts_path
    expect(page).to have_content Post.all[1].title
    expect(page).not_to have_content Post.all[2].title
    expect(page).not_to have_content Post.all[3].title
  end 
  
  it "should let a user access posts" do 
    for i in 1..3
      link = '/posts/' + i.to_s
      visit link
      click_link(i.to_s)
      new_link = '/posts/' + i.to_s
      current_path.should == new_link
      expect(page).to have_content Post.all[i].description
    end
  end 
  
  it "should let a user edit posts by leading to edit page" do
    for i in 1..3 
      link = '/posts/' + i.to_s
      visit link
      click_on 'Edit'
      new_link = '/posts/' + i.to_s + '/edit'
      current_path.should == new_link
      expect(page).to have_content "Edit Existing Post"
    end
  end
end
