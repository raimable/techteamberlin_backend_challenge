require 'test_helper'

class NationalityTest < ActiveSupport::TestCase
  def test_the_truth
    nationality = Nationality.new name: 'United Kingdom'

    # Test create Nationality
    assert nationality.save
    # Test load Nationality
    nationality_copy = Nationality.find(nationality.id)
    # Test if the loaded Nationality is same as exisiting one
    assert_equal nationality.name, nationality.name
    # Test update Nationality
    nationality.name = 'Updated name'

    assert nationality_copy.save
    # Test destroy nationality

    assert nationality.destroy
  end

  def test_can_not_save_nationality_with_no_name
    nationality2 = Nationality.new
    # Test create nationality with no name
    assert_not nationality2.save
  end
end
