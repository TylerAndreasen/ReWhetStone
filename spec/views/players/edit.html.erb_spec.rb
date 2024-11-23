require 'rails_helper'

RSpec.describe "players/edit", type: :view do
  let(:player) {
    Player.create!(
      username: "MyString",
      display_name: "MyString",
      use_display_name: false
    )
  }

  before(:each) do
    assign(:player, player)
  end

  it "renders the edit player form" do
    render

    assert_select "form[action=?][method=?]", player_path(player), "post" do

      assert_select "input[name=?]", "player[username]"

      assert_select "input[name=?]", "player[display_name]"

      assert_select "input[name=?]", "player[use_display_name]"
    end
  end
end
