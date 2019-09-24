require 'rails_helper'

RSpec.describe "translations/new", type: :view do
  before(:each) do
    assign(:translation, Translation.new(
      :input => "MyString",
      :output => "MyString"
    ))
  end

  it "renders new translation form" do
    render

    assert_select "form[action=?][method=?]", translations_path, "post" do

      assert_select "input[name=?]", "translation[input]"

      assert_select "input[name=?]", "translation[output]"
    end
  end
end
