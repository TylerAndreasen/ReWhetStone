require 'rails_helper'

RSpec.describe "players/index", type: :view do
  before(:each) do
    assign(:players, [
      Player.create!(
        username: "Username",
        display_name: "Display Name",
        use_display_name: false
      ),
      Player.create!(
        username: "Username",
        display_name: "Display Name",
        use_display_name: false
      )
    ])
  end

  it "renders a list of players" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Username".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Display Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
