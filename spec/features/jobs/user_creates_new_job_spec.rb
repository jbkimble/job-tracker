require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create(name: "ESPN", city: "NYC")
    cat1 = Category.create(title: "Education")

    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
  end

  scenario "a user can redirect from a new job to a new category" do
    company = Company.create(name: "ESPN", city: "NYC")
    cat1 = Category.create(title: "Education")
    visit new_company_job_path(company)

    click_link "New category"
    expect(current_path).to eq(new_category_path)
  end

  scenario "a user can select a category for a job" do
    company = Company.create(name: "ESPN", city: "NYC")
    cat1 = Category.create(title: "Education")
    cat2 = Category.create(title: "Government")
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80


    select "Government", :from => "job_category_id"

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Government")
  end
end
