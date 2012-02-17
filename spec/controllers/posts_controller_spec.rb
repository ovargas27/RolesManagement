require 'spec_helper'

describe PostsController do

  # This should return the minimal set of attributes required to create a valid
  # Post. As you add validations to Post, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PostsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    login_user

    it "assigns all user posts as @posts" do
      post = Post.make!( user: @user )
      get :index
      assigns(:posts).should eq([post])
    end

    it "assigns also non-user posts as @posts" do
      post = Post.make!
      get :index
      assigns(:posts).should eq([post])
    end
  end

  describe "GET show" do
    login_user
    it "assigns the requested post as @post" do
      post = Post.make!
      get :show, {:id => post.to_param}
      assigns(:post).should eq(post)
    end
  end

  describe "GET new" do
    login_user

    it "assigns a new post as @post" do
      get :new, {}
      assigns(:post).should be_a_new(Post)
    end

    it "new post should belongs to user" do
      get :new, {}
      assigns(:post).user.should == @user
    end
  end


  describe "GET edit" do
    login_user

    it "assigns the requested post as @post" do
      post = Post.make!( user: @user )
      get :edit, {:id => post.to_param}
      assigns(:post).should eq(post)
    end
  end

  describe "POST create" do
    login_user

    it "create a new post" do
      expect {
        post :create, {:post => valid_attributes}
      }.to change(Post, :count).by(1)
    end

    it "assigns a newly created post as @post" do
      post :create, {:post => valid_attributes}
      assigns(:post).should be_a(Post)
      assigns(:post).should be_persisted
    end

    it "redirects to the created post" do
      post :create, {:post => valid_attributes}
      response.should redirect_to(Post.last)
    end
  end

  describe "PUT update" do
    login_user

    describe "with valid params" do
      it "updates the requested post" do
        post = Post.make!( user:@user )
        # Assuming there are no other posts in the database, this
        # specifies that the Post created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Post.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => post.to_param, :post => {'these' => 'params'}}
      end

      it "assigns the requested post as @post" do
        post = Post.make!( user:@user )
        put :update, {:id => post.to_param, :post => valid_attributes}
        assigns(:post).should eq(post)
      end

      it "redirects to the post" do
        post = Post.make!( user:@user )
        put :update, {:id => post.to_param, :post => valid_attributes}
        response.should redirect_to(post)
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        post = Post.make!( user:@user )
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :update, {:id => post.to_param, :post => {}}
        assigns(:post).should eq(post)
      end

      it "re-renders the 'edit' template" do
        post = Post.make!( user:@user )
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :update, {:id => post.to_param, :post => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    login_user

    it "destroys the requested post" do
      post = Post.make!( user:@user )
      expect {
        delete :destroy, {:id => post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.make!( user:@user )
      delete :destroy, {:id => post.to_param}
      response.should redirect_to(posts_url)
    end
  end

end
