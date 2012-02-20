require 'spec_helper'

describe "roles/index" do
  before(:each) do
    assign(:roles, [
      stub_model(Role,
        :resource_classname => "Resource Classname",
        :can_read => false,
        :can_create => false,
        :can_update => false,
        :can_destroy => false
      ),
      stub_model(Role,
        :resource_classname => "Resource Classname",
        :can_read => false,
        :can_create => false,
        :can_update => false,
        :can_destroy => false
      )
    ])
  end

  it "renders a list of roles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Resource Classname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
