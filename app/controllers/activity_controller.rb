class ActivityController < ApplicationController
  def index
    # @user_monitors = UserMonitor.all
    @search = UserMonitor.ransack(params[:q])
    @user_monitors = @search.result.page(params[:page]).per_page(20)
    #  @activities = PublicActivity::Activity.all
    # @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.friend_ids, owner_type: "User")
  end
end
