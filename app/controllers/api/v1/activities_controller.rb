class Api::V1::ActivitiesController < Api::V1::V1Base
  before_action :find_class, only: :changes

  def changes
    object = @klass.find(params[@attr.to_sym])
    @activities = PublicActivity::Activity.where(trackable_type: AppSettings::TRACKABLE_TYPES[params[:type].to_sym], recipient_id: object.id, recipient_type: object.class.to_s)
  end

  def remove
    activity_ids = params[:activity_ids].split(',')
    @activities = PublicActivity::Activity.where(id: activity_ids)
    @activities.delete_all
  end

  def offline_changes
    p params[:activities]
    p eval(params[:activities])
    # params[:activities].each do |act|
    #   p act
    #   p eval(act)
    # end

    # p JSON.parse params[:activities].first
    # @applied_ids = []
    # if params[:activities].present?
    #   department = Department.find(params[:department_id])
    #
    #   params[:activities].each do |activity|
    #     @activity = activity
    #   end
    # end

  end

  private

  def find_class
    if params[:type] == 'departments'
      @klass = Company
      @attr = 'company_id'
    else
      @klass = Department
      @attr = 'department_id'
    end
  end

  def action_delete
    object = @activity[:trackable_type].constantize.find_by_global_id(@activity[:trackable_id])

    if object.present?
      object.delete!
      @applied_ids << @activity[:id]
    end
  end

  def action_update

  end

  def action_create

  end
end
