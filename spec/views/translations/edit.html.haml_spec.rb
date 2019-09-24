require 'rails_helper'

RSpec.describe "translations/edit", type: :view do
  before(:each) do
    @translation = assign(:translation, Translation.create!(
      :input => "MyString",
      :output => "MyString"
    ))
  end

  it "renders the edit translation form" do
    render

    assert_select "form[action=?][method=?]", translation_path(@translation), "post" do

      assert_select "input[name=?]", "translation[input]"

      assert_select "input[name=?]", "translation[output]"
    end
  end
end
