require 'rails_helper'

describe 'User edits and existing job' do
  scenario 'a user can edit a job' do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", description: "Something", level_of_interest: 16)

    visit company_job_path(company, job)
    click_on "Edit"

    fill_in "Title", with: "Senior Astronaut"
    click_button "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("Senior Astronaut")
    expect(page).to_not have_content("Developer")
  end
end
