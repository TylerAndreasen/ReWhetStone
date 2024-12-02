require 'rails_helper'

RSpec.describe "rounds/index", type: :view do
  before(:each) do
    assign(:rounds, [
      Round.create!(
        player: nil,
        score_1: "Score 1",
        score_2: "Score 2",
        score_3: "Score 3",
        score_4: "Score 4",
        called_clutch: "Called Clutch",
        score_5: "Score 5"
      ),
      Round.create!(
        player: nil,
        score_1: "Score 1",
        score_2: "Score 2",
        score_3: "Score 3",
        score_4: "Score 4",
        called_clutch: "Called Clutch",
        score_5: "Score 5"
      )
    ])
  end

  it "renders a list of rounds" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Score 1".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Score 2".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Score 3".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Score 4".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Called Clutch".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Score 5".to_s), count: 2
  end
end
