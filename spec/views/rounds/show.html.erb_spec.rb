require 'rails_helper'

RSpec.describe "rounds/show", type: :view do
  before(:each) do
    assign(:round, Round.create!(
      player: nil,
      score_1: "Score 1",
      score_2: "Score 2",
      score_3: "Score 3",
      score_4: "Score 4",
      called_clutch: "Called Clutch",
      score_5: "Score 5"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Score 1/)
    expect(rendered).to match(/Score 2/)
    expect(rendered).to match(/Score 3/)
    expect(rendered).to match(/Score 4/)
    expect(rendered).to match(/Called Clutch/)
    expect(rendered).to match(/Score 5/)
  end
end
