class NotificationsController < ApplicationController
  before_action :authenticate_user!


  def index
    @activities = PublicActivity::Activity.all
  end
end
