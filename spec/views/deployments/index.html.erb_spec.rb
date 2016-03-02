require 'rails_helper'

RSpec.describe "deployments/index", type: :view do
  before(:each) do
    assign(:deployments, [
      Deployment.create!(
        :repo => nil,
        :from => "From",
        :upto => "Upto",
        :name => "Name"
      ),
      Deployment.create!(
        :repo => nil,
        :from => "From",
        :upto => "Upto",
        :name => "Name"
      )
    ])
  end

  it "renders a list of deployments" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "From".to_s, :count => 2
    assert_select "tr>td", :text => "Upto".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
