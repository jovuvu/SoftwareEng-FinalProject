require 'spec_helper'

describe "relationships/edit" do
  before(:each) do
    @relationship = assign(:relationship, stub_model(Relationship))
  end

  it "renders the edit relationship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", relationship_path(@relationship), "post" do
    end
  end
end
