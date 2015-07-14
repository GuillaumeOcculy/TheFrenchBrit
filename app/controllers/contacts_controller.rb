class ContactsController < ApplicationController

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_me(@contact).deliver
      redirect_to root_path, flash: {success: 'Your message has been sent !'}
    else
      render :edit
      flash[:warning] = 'Your message has not been sent !'
    end
  end

  def index
    @contacts = Contact.all
  end

  private

  def contact_params
    params.require(:contact).permit!
  end
end
