require 'rails_helper'

RSpec.describe "deployments/show", type: :view do
  before(:each) do
    @deployment = assign(:deployment, Deployment.create!(
      :repo => nil,
      :from => "From",
      :upto => "Upto",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/From/)
    expect(rendered).to match(/Upto/)
    expect(rendered).to match(/Name/)
  end
end
