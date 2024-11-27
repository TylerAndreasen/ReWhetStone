require 'rails_helper'

RSpec.describe "rounds/new", type: :view do
  before(:each) do
    assign(:round, Round.new(
      player: nil,
      score_1: "MyString",
      score_2: "MyString",
      score_3: "MyString",
      score_4: "MyString",
      called_clutch: "MyString",
      score_5: "MyString"
    ))
  end

  it "renders new round form" do
    render

    assert_select "form[action=?][method=?]", rounds_path, "post" do

      assert_select "input[name=?]", "round[player_id]"

      assert_select "input[name=?]", "round[score_1]"

      assert_select "input[name=?]", "round[score_2]"

      assert_select "input[name=?]", "round[score_3]"

      assert_select "input[name=?]", "round[score_4]"

      assert_select "input[name=?]", "round[called_clutch]"

      assert_select "input[name=?]", "round[score_5]"
    end
  end
end
