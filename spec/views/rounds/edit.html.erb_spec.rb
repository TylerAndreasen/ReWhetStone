require 'rails_helper'

RSpec.describe "rounds/edit", type: :view do
  let(:round) {
    Round.create!(
      player_id: 1,
      score_1: "MyString",
      score_2: "MyString",
      score_3: "MyString",
      score_4: "MyString",
      called_clutch: false,
      score_5: "MyString"
    )
  }

  before(:each) do
    assign(:round, round)
  end

  it "renders the edit round form" do
    render

    assert_select "form[action=?][method=?]", round_path(round), "post" do

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
