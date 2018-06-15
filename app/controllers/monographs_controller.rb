class MonographsController < ApplicationController
  def future
    @monographs = Monograph.where(published: false).paginate(page: params[:page], per_page: 6)
  end

  def ended
    @monographs = Monograph.where(published: true).paginate(page: params[:page], per_page: 6)
  end

  def registration
    @monograph = Monograph.find(params[:monograph_id])
    @monograph.monograph_editors.create(registration_params)

    redirect_to monograph_future_url
  end

  private

  def registration_params
    params.permit(:first_name, :last_name, :surname, :email, :phone)
  end
end
