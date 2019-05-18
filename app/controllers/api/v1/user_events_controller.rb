class Api::V1::UserEventsController < ApplicationController
  before_action :set_user_event, only: [:destroy]

  def create
    event = Event.find(params[:event_id])
    user = User.find(params[:user_id])
    @user_event = UserEvent.create(user: user, event: event)
    if @user_event.save
      render json: @user_event, status: :created, location: api_v1_user_event_url(@user_event)
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user_event.destroy
  end

  private
  def set_user_event
    @user_event = UserEvent.find(params[:id])
  end
end
