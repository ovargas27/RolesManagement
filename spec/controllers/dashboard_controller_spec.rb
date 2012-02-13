require 'spec_helper'

describe DashboardController do

  describe "GET 'show'" do
    describe "with user logged" do
      login_user
      it "returns http success" do
        get 'show'
        response.should be_success
      end
    end
    describe "without user logged" do
      it "returns http redirect" do
        get 'show'
        response.should be_redirect
      end
    end
  end

end
