require 'rails_helper'

RSpec.describe "translations/new", type: :view do
  before(:each) do
    assign(:translation, Translation.new(
      :input => "MyString",
      :output => "MyString"
    ))
  end
end
