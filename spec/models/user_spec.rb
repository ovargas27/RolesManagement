require 'spec_helper'

describe User do
  let(:user){ User.make! }
  describe "#new_post" do
    it "should create a post" do
      post = user.new_post
      post.should be_an_instance_of Post
      post.user.should be(user)
    end
  end

  describe "#create_post" do
    let(:post){ user.create_post}
    it "should create a post" do
      post.should be_an_instance_of Post
    end
    it "created post should belongs to user" do
      post.user.should be(user)
    end
    it "created post should be valid" do
      post.should be_persisted
    end
  end
end
