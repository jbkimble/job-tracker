require 'rails_helper'

describe 'User can see one category' do
  scenario "a user can see one category" do
    cat1 = Category.create(title: "Education")

    visit categories_path
    click_on "Education"

    expect(current_path).to eq("/categories/#{cat1.id}")
    expect(page).to have_content("Education")
  end

  scenario "user can see all jobs from one category" do
    cat1 = Category.create(title: "Education")
    cat2 = Category.create(title: "Sales")
    company1 = Company.create(name: "Microsoft", city:"Seattle")
    company2 = Company.create(name: "Gusto", city: "Denver")
    job = Job.create( title: "Dev", description: "something", level_of_interest:10, category_id: cat1.id, company_id: company1.id )
    job2 = Job.create( title: "Teacher", description: "else", level_of_interest:20, category_id: cat1.id, company_id: company1.id )

    visit category_path(cat1)

    expect(page).to have_content("Dev")
    expect(page).to have_content("Teacher")
  end
end
