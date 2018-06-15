class ConferencesController < ApplicationController
	def future
		@conferences = Conference.where(ended: false)
	end

	def ended
		@conferences = Conference.where(ended: true).paginate(page: params[:page], per_page: 5)
	end

	def show
		@conference = Conference.find(params[:id])
	end

	def registration
    conference = Conference.find(params[:conference_id])
    conference.conference_members.create!(member_params)

    redirect_to conferences_future_path
  end

  private

  def member_params
    params.permit(
      :first_name,
      :last_name,
      :surname,
      :position,
      :organization,
      :contry,
      :city,
      :address,
      :phone,
      :email,
			:academic_status,
			:scientific_degree,
			:conference_id
    )
  end
end
