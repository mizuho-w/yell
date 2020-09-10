require 'test_helper'

class ReservationInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reservation_informations_index_url
    assert_response :success
  end

end
