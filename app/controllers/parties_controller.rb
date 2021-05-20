class PartiesController < ApplicationController
  def new
    @party = Party.new
    @title = params[:title]
    @duration = params[:duration]
    @movie_id = params[:movie_id]
  end

  def create
    correct_params = party_params
    correct_params[:host_id] = current_user.id
    party = Party.create(correct_params)
    guests.each do |guest_id|
      Guest.create(user_id: guest_id, party: party)
    end
    redirect_to dashboards_path
  end

  private

  def party_params
    params.require(:party).permit(:title, :movie_id, :duration, :date, :start_time)
  end

  def guests
    params[:party][:guests].drop(1) if params[:party][:guests]
  end
end
