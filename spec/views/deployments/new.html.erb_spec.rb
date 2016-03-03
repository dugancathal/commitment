require 'rails_helper'

RSpec.describe "deployments/new", type: :view do
  before(:each) do
    assign(:deployment, Deployment.new(
      :repo => nil,
      :from => "MyString",
      :upto => "MyString",
      :name => "MyString"
    ))
  end

  it "renders new deployment form" do
    render

    assert_select "form[action=?][method=?]", deployments_path, "post" do

      assert_select "input#deployment_repo_id[name=?]", "deployment[repo_id]"

      assert_select "input#deployment_from[name=?]", "deployment[from]"

      assert_select "input#deployment_upto[name=?]", "deployment[upto]"

      assert_select "input#deployment_name[name=?]", "deployment[name]"
    end
  end
end
