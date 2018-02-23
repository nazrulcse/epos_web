class Ability
  include CanCan::Ability

  RESTFUL_ACTION = [ 'index', 'show', 'new', 'edit', 'create', 'update', 'destroy', 'delete' ]

  SETUP_MODULES = ['AccessRight', 'Company', 'Department' , 'Designation', 'Setting', 'Employees', 'Home' ]

  MODULELESS_NAMESPACE = {
      'Employee' => 'Employees',
      'Attendance' => 'Attendance',
      'AccessRight' => 'AccessRight',
      'Company' => 'Company',
      'Department' => 'Department',
      'Designation' => 'Designation',
      'Setting' => 'Setting',
      'Home' => 'Home',
      'Member' => 'Member'
  }

  DEFAULT_ACCESS = {
      'employees' => ['settings', 'show', 'profile', 'update_password', 'attendances'],
      'attendance/attendances' => ['in', 'out'],
      'home' => ['contact_us']
  }

  def initialize(user, namespace, controller, action)
    p 'namespace'
    p namespace
    user ||= Employee.new
    alias_action :read, :create, :update, :to => :moderate

    if user.super_admin? || user.new_record?
      can :manage, :all
    else
      if namespace.empty?
        p 'classify'
        p controller
        p MODULELESS_NAMESPACE[controller.classify]
        namespace = MODULELESS_NAMESPACE[controller.classify]
        operational_controller = controller
      else
        operational_controller = controller.split('/').last
      end

      p namespace

      if module_availability_checker(user, namespace)
        if DEFAULT_ACCESS.collect{ |key, value| key.classify }.include?(controller.classify) && DEFAULT_ACCESS[controller.downcase].include?(action)
          can action.to_sym, controller.classify
        else

          p namespace
          # p operational_controller
          # p user.access_right.permissions
          # p "user access"
          # p user.access_right.present?
          # p user.access_right.permissions[namespace.to_sym].present?
          # p user.access_right.permissions[namespace.to_sym][operational_controller.to_sym].present?

          if user.access_right.present? && user.access_right.permissions[namespace.to_sym].present? && user.access_right.permissions[namespace.to_sym][operational_controller.to_sym].present?
            permission_value = user.access_right.permissions[namespace.to_sym][operational_controller.to_sym]
            if RESTFUL_ACTION.include?(action)
              if permission_value.to_i > 2
                can :manage, controller.classify
              elsif permission_value.to_i > 1
                can :moderate, controller.classify
              elsif permission_value.to_i > 0
                can :read, controller.classify
              end
            else
              can action.to_sym, controller.classify if  permission_value.to_i > 1
            end
          end
        end
      else
        cannot action.to_sym, controller.classify
      end
    end
  end

  private

  def module_availability_checker(user, module_name)
    # available_modules_name = user.department.company.features.collect{ |f|  f.app_module }
    # total_modules = available_modules_name + SETUP_MODULES
    # total_modules.include?(module_name)
    true
  end

end
