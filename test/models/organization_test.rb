require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  setup do
    @org = build(:organization)
  end
  
  test 'factory org should be valid' do
    assert @org.save
  end
  
  test 'should validate name presence' do
    @org.name = nil
    assert_not @org.valid?
  end
  
  test 'should validate name uniqueness' do
    @org.save!
    org2 = build(:organization, name: 'something else') # only testing the name
    assert_not org2.valid?
  end
end
