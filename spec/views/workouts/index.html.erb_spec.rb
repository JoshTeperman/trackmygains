require 'rails_helper'

RSpec.describe "workouts/index", type: :view do
  before(:each) do
    assign(:workouts, [
      Workout.create!(
        state: "State"
      ),
      Workout.create!(
        state: "State"
      )
    ])
  end

  it "renders a list of workouts" do
    render
    assert_select "tr>td", text: "State".to_s, count: 2
  end
end
