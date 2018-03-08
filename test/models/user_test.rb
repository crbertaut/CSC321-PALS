require 'test_helper'

class UserTest < ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  setup do
    @user = build(:user)
  end
  
  test 'factory user should be valid' do
    assert @user.save
  end
  
  test 'should validate username presence' do
    @user.username = nil
    assert_not @user.valid?
  end
  
  test 'should validate username uniqueness' do
    @user.save!
    user2 = build(:user, username: 'something else') # only testing the username
    assert_not user2.valid?
  end
  
  test 'should validate name presence' do
    @user.name = nil
    assert_not @user.valid?
  end
  
  test 'should validate name uniqueness' do
    @user.save!
    user2 = build(:user, name: 'something else') # only testing the name
    assert_not user2.valid?
  end
  
  test 'should validate presence of other_gender when gender is other' do
    @user.gender = 2
    assert_not @user.valid?
    @user.other_gender = 'genderqueer'
    assert @user.valid?
    assert @user.other?
  end
end
