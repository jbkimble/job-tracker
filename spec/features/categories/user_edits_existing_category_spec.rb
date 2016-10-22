require 'rails_helper'

describe 'User edits an existing category' do
  scenario 'a user can edit a category' do
    category = Category.create(title: "Astronaut")

    visit categories_path
    within (".category_#{category.id}") do
      click_link "Edit"
    end

    fill_in "category[title]", with: "Cowboy"
    click_button "Update"
    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Cowboy")
  end
end
