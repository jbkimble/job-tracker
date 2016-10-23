require 'rails_helper'

describe "User creates a new company" do
  scenario "user creates a new contact" do
    company = Company.create(name: "ESPN", city: "Denver")
    cat1 = Category.create(title: "Education")
    job1 = company.jobs.create(title: "Developer", description: "Something", level_of_interest: 70, category: cat1 )
    company.contacts.create(name: "Frank", position:"Sales Manager", email: "Frank@company.com")
    company.contacts.create(name: "Jimbo", position:"Developer", email: "Jimbo@company.com")


    visit company_jobs_path(company)
    click_link "Add Contact"

    expect(current_path).to eq(new_company_contact_path(company))

    fill_in "contact_name", with: "Jane Doe"
    fill_in "contact_position", with: "CEO"
    fill_in "contact_email", with: "jane@company.com"

    click_button "Create Contact"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("Jane Doe")
    expect(page).to have_content("CEO")
    expect(page).to have_content("jane@company.com")
    save_and_open_page
  end
end
