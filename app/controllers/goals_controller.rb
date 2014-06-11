class GoalsController < ApplicationController

  before_action :logged_in?

  def index
    @goals = Goal.where(user: current_user).all
  end

  def new
    @goal = Goal.new
  end

  def create
    new_goal = Goal.new(goal_params)
    new_goal.user = current_user
    if new_goal.save
      flash[:notice] = "Successfully created a new goal."
      redirect_to user_goal_path(current_user, new_goal)
    else
      flash[:notice] = "Somethin' ain't right."
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    goal = Goal.find(params[:id])
    goal.update(goal_params)
    if goal.save
      flash[:notice] = "Successfully updated your goal."
      redirect_to user_goal_path(current_user, goal)
    else
      flash[:notice] = "Somethin' ain't right."
      render :edit
    end
  end

  def destroy
    goal = Goal.find(params[:id])
    goal.destroy
    flash[:notice] = "Successfully deleted your goal."
    redirect_to user_goals_path(current_user)
  end

  private
  def goal_params
    params.require(:goal).permit(
      :goal,
      :date_created,
      :estimated_completion_date,
      :actual_completion_date,
      :accomplishments
      )
  end


end