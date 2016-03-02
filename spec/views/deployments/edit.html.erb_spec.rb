require 'rails_helper'

RSpec.describe "deployments/edit", type: :view do
  before(:each) do
    @deployment = assign(:deployment, Deployment.create!(
      :repo => nil,
      :from => "MyString",
      :upto => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit deployment form" do
    render

    assert_select "form[action=?][method=?]", deployment_path(@deployment), "post" do

      assert_select "input#deployment_repo_id[name=?]", "deployment[repo_id]"

      assert_select "input#deployment_from[name=?]", "deployment[from]"

      assert_select "input#deployment_upto[name=?]", "deployment[upto]"

      assert_select "input#deployment_name[name=?]", "deployment[name]"
    end
  end
end
