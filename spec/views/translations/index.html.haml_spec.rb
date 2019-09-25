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

end
