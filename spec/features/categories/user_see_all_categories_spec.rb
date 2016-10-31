require 'rails_helper'

describe "User sees all categories" do
  scenario "a user can see all categories" do
    cat1 = Category.create(title: "Education")
    cat2 = Category.create(title: "Government")

    visit categories_path

    expect(page).to have_link("Education")
    expect(page).to have_link("Government")
  end
end
