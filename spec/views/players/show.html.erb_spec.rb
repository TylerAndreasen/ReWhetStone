require 'rails_helper'

RSpec.describe "players/show", type: :view do
  before(:each) do
    assign(:player, Player.create!(
      username: "Username",
      display_name: "Display Name",
      use_display_name: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Display Name/)
    expect(rendered).to match(/false/)
  end
end
