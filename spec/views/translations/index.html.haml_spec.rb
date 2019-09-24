require 'rails_helper'

RSpec.describe "translations/index", type: :view do
  before(:each) do
    assign(:translations, [
      Translation.create!(
        :input => "Input",
        :output => "Output"
      ),
      Translation.create!(
        :input => "Input",
        :output => "Output"
      )
    ])
  end

  it "renders a list of translations" do
    render
    assert_select "tr>td", :text => "Input".to_s, :count => 2
    assert_select "tr>td", :text => "Output".to_s, :count => 2
  end
end
