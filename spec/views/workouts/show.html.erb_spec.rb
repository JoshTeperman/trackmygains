require 'rails_helper'

RSpec.describe "workouts/show", type: :view do
  before(:each) do
    @workout = assign(:workout, Workout.create!(
      state: "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/State/)
  end
end
