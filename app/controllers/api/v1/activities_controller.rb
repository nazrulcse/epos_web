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
end
