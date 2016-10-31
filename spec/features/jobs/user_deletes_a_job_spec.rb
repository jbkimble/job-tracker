require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", description: "Something", level_of_interest: 16)

    visit company_jobs_path(company, job)
    click_on "Delete Job"
    expect(page).to have_content("Developer was deleted")
  end
end
