require 'rails_helper'

RSpec.describe "workouts/edit", type: :view do
  before(:each) do
    @workout = assign(:workout, Workout.create!(
      state: "MyString"
    ))
  end

  it "renders the edit workout form" do
    render

    assert_select "form[action=?][method=?]", workout_path(@workout), "post" do

      assert_select "input[name=?]", "workout[state]"
    end
  end
end
