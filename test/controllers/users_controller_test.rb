require "test_helper"

describe UsersController do

  describe "index" do
    it "is successful when there are many users" do
      User.count.must_be :>, 0
      get users_path
      must_respond_with :success
    end

    it "is successful when there are zero users" do
      User.destroy_all
      get users_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "finds a user that exists" do
      user_id = User.first.id
      get user_path(user_id)
      must_respond_with :success
    end

    it "returns 404 for a user that DNE" do
      user_id = User.last.id + 1
      get user_path(user_id)
      must_respond_with :not_found
    end
  end

end
