class Admin::ContactsController < ApplicationController

  def index
    @contacts = Contact.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :name, :subject, :message)
  end

end
