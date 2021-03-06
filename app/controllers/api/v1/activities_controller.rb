class Api::V1::ActivitiesController < Api::V1::V1Base
  # before_action :find_class, only: :changes

  def changes
    object = Department.find(params[:department_id])
    object = object.company if %w(departments memberships).include?(params[:type])
    @activities = PublicActivity::Activity.where(trackable_type: AppSettings::TRACKABLE_TYPES[params[:type].to_sym], recipient_id: object.id, recipient_type: object.class.to_s)
  end

  def remove
    activity_ids = params[:activity_ids].split(',')
    @activities = PublicActivity::Activity.where(id: activity_ids)
    @activities.delete_all
  end

  def offline_changes
    #@department = Department.find(params[:department_id])
    activities = params['activities'] || []
    @applied_ids = []
    activities.each do |act|
      activity = JSON.parse(act)
      break unless send "action_#{activity['key']}".to_sym, activity
    end
    render_json
  end

  private

  # def find_class
  #   if params[:type] == 'departments' || params[:type] == 'members'
  #     @klass = Company
  #     @attr = 'company_id'
  #   else
  #     @klass = Department
  #     @attr = 'department_id'
  #   end
  # end

  def render_json
    json_response(applied_activies: @applied_ids.join(','))
  end

  def action_delete(activity)
    object = find_object(activity)
    return false unless object.present?
    return false unless object.destroy
    applied(activity)
    true
  end

  def action_update(activity)
    object = find_object(activity)
    return false unless object.present?
    return false unless object.update_attributes(activity['data'])
    applied(activity)
    true
  end

  def action_create(activity)
    klass_name(activity).create(activity['data']) if activity['data'].present? # .merge(department_id: @department.id)
    applied(activity)
    true
  rescue Exception => e
    p e.message.to_s
    false
  end

  def applied(activity)
    @applied_ids << activity['id']
  end

  def klass_name(activity)
    AppSettings::OFFLINE_TRACKABLE_TYPES[activity['trackable_type'].to_sym].constantize
  end

  def find_object(activity)
    activity['trackable_type'] == 'membership' ? find_member(activity) : klass_name(activity).find_by_global_id(activity['trackable_id'])
  end

  def find_member(activity)
    Member.find_by_id(activity['trackable_id'])
  end
end
