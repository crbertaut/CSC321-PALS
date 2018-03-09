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
    user2 = build(:user)
    assert_not user2.valid?
    assert_includes user2.errors.details[:username],
                    { error: :taken, value: user2.username }
  end
  
  test 'should validate name presence' do
    @user.name = nil
    assert_not @user.valid?
  end
  
  test 'should validate name uniqueness' do
    @user.save!
    user2 = build(:user)
    assert_not user2.valid?
    assert_includes user2.errors.details[:name],
                    { error: :taken, value: user2.name }
  end
  
  test 'should validate presence of other_gender when gender is other' do
    @user.gender = 2
    assert_not @user.valid?
    @user.other_gender = 'genderqueer'
    assert @user.valid?
    assert @user.other?
  end
  
  test 'should be able to have multiple organizations' do
    @user.organizations << create(:organization)
    assert @user.valid?
  end
  
  test 'should be able to have an interest' do
    @user.interests << create(:interest)
    assert @user.valid?
  end
  
  test 'should be able to have multiple (5) interests' do
    5.times do |n|
      interest = create(:interest, name: n)
      @user.interests << interest
    end
    assert @user.valid?
  end
end
