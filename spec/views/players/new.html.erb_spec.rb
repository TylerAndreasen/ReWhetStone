require 'rails_helper'

RSpec.describe "players/new", type: :view do
  before(:each) do
    assign(:player, Player.new(
      username: "MyString",
      display_name: "MyString",
      use_display_name: false
    ))
  end

  it "renders new player form" do
    render

    assert_select "form[action=?][method=?]", players_path, "post" do

      assert_select "input[name=?]", "player[username]"

      assert_select "input[name=?]", "player[display_name]"

      assert_select "input[name=?]", "player[use_display_name]"
    end
  end
end
