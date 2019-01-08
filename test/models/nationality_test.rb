require 'test_helper'

class NationalityTest < ActiveSupport::TestCase
  # Test Create, Read/load,
  # Update, Delete Nationality.
  def test_crud_nationality
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

  # Test validatation to not be able
  # to save nationlity with no name
  def test_can_not_save_nationality_with_no_name
    nationality2 = Nationality.new
    # Test create nationality with no name
    assert_not nationality2.save
    assert nationality2.destroy
  end

  # Test if you can not save nationality with the same names
  def test_can_not_save_nationality_with_same_name
    nationality3 = Nationality.new
    nationality4 = Nationality.new
    nationality3.name = 'Rwanda'

    assert nationality3.save
    # Set nationality4 same name as nationlity3
    nationality4.name = 'Rwanda'
    assert nationality4.save
    assert nationality3.destroy
    assert_not nationality4.destroy
  end
end
