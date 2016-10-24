class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts

  def self.sort_by_location
    order(:city)
  end

  def self.top_three_companies_by_interest
    sorted = []

    all.each do | company |
      sorted << [company.jobs.average(:level_of_interest), company]
    end

    sorted.sort_by{|a,b| a }[0..2].reverse
  end

  def self.list_number_of_jobs_by_location
    final = []
    all.group_by(&:city).each do |city, array|
      total = 0
      array.each do |company|
        total += company.jobs.count
      end
      final << [city, total]
    end
    final
    #get all companies
    #for each company count the number of jobs and its list_number_of_jobs_by_location
  end
end
