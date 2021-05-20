class DashboardsController < ApplicationController
  def index
    @users_friends = current_user.friends
    @parties = current_user.parties
    @invites = current_user.invites
  end
end
