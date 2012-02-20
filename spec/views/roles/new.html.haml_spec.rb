require 'spec_helper'

describe "roles/new" do
  before(:each) do
    assign(:role, stub_model(Role,
      :resource_classname => "MyString",
      :can_read => false,
      :can_create => false,
      :can_update => false,
      :can_destroy => false
    ).as_new_record)
  end

  it "renders new role form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => roles_path, :method => "post" do
      assert_select "input#role_resource_classname", :name => "role[resource_classname]"
      assert_select "input#role_can_read", :name => "role[can_read]"
      assert_select "input#role_can_create", :name => "role[can_create]"
      assert_select "input#role_can_update", :name => "role[can_update]"
      assert_select "input#role_can_destroy", :name => "role[can_destroy]"
    end
  end
end
