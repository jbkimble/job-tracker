require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", description: "Something", level_of_interest: 16)

    company_jobs_path(:company_id)
    save_and_open_page
    expect(page).to have_content("All Jobs for #{company.name}")
  end
end
