require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get '/users'
    assert_response :success
  end
  
  test "invalid signup information" do
    assert_no_difference 'User.count' do
      post users_path, params: { user: 
        { name: "",
          email: "user@invalid",
          password: "foo",
          password_confirmation: "bar" 
        } 
      }
    end
  end

  test "valid signup information" do
    puts users_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: 
        { name: "Example User",
          email: "user@example.com",
          password: "password",
          password_confirmation: "password" 
        } 
      }
    end
  end
end
