class ContactsController < ApplicationController
  def index; end

  def create
    Message.create!(message_params)
    redirect_to contacts_url
  end

  private

  def message_params
    params.permit(:first_name, :second_name, :email, :phone, :question)
  end
end
