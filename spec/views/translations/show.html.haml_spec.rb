require 'rails_helper'

RSpec.describe "translations/show", type: :view do
  before(:each) do
    @translation = assign(:translation, Translation.create!(
      :input => "Input",
      :output => "Output"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Input/)
    expect(rendered).to match(/Output/)
  end
end
