class AppSettings
  EXPORT_TO = ['pdf', 'xls', 'word']

  MONTHS_SHORT_NAME = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'July', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec']

  TRACKABLE_TYPES = {
      employees: 'Employee',
      departments: 'Department',
      designations: 'Designation'
  }

  REGISTRATION_PROGRESS = {
      create_account: 'Create Account',
      company_profile: 'Company Profile',
      select_module: 'Finalize',
      # finalize: 'Finalize'
  }

  REGISTRATION_STEPS = {
      registration: '/companies/new',
      feature_selection: '/settings/features',
      #payment: '/settings/billing'
  }

  DAYOFF_TYPES = {
      weekend: 'Weekend',
      holiday: 'Holiday',
      custom_holiday: 'Custom Holiday'
  }

  ACTIONS = {
      delete: 'delete',
      approve: 'approve',
      reject: 'reject',
      active: 'active',
      deactivate: 'deactivate'
  }

  STATUS = {
      approved: 'approved',
      rejected: 'rejected',
      pending: 'pending'
  }

  MODULES_NAME = ['employees', 'attendance', 'bank', 'pos']

end