class ContactsController < ApplicationController

  def new
    @contact = Contact.new
    @company = Company.find(params[:company_id])

  end

  def create
    @contact = Contact.new(contact_params)
    @company = Company.find(params[:company_id])
    if @contact.save
      flash[:success] = "#{@contact.name} Created!"
      redirect_to company_jobs_path(@company)
    else
      render :new
    end
  end

  private

  def contact_params
      params.require(:contact).permit(:name, :position, :email)
  end
end
