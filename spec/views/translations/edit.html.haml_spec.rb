require 'rails_helper'

describe "translations/edit", type: :view do
  before(:each) do
    @translation = assign(:translation, Translation.create!(
      :input => "MyString",
      :output => "MyString"
    ))
  end
end
