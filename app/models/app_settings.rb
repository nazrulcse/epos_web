class AppSettings
  EXPORT_TO = %w(pdf xls word).freeze

  MONTHS_SHORT_NAME = %w(Jan Feb Mar Apr May June July Aug Sept Oct Nov Dec).freeze

  TRACKABLE_TYPES = {
      employees: 'Employee',
      departments: 'Department',
      designations: 'Designation',
      memberships: 'Member',
      products: 'Pos::Product',
      suppliers: 'Pos::Supplier',
      customers: 'Pos::Customer'
  }.freeze

  OFFLINE_TRACKABLE_TYPES = {
      membership: 'Member',
      invoice: 'Pos::Customers::Invoice',
      invoice_item: 'Pos::Customers::InvoiceItem',
      payment: 'Pos::Customers::Payment'
  }.freeze

  REGISTRATION_PROGRESS = {
      create_account: 'Create Account',
      company_profile: 'Company Profile',
      select_module: 'Finalize'
  }.freeze

  REGISTRATION_STEPS = {
      registration: '/companies/new',
      feature_selection: '/settings/features'
  }.freeze

  DAYOFF_TYPES = {
      weekend: 'Weekend',
      holiday: 'Holiday',
      custom_holiday: 'Custom Holiday'
  }.freeze

  ACTIONS = {
      delete: 'delete',
      approve: 'approve',
      reject: 'reject',
      active: 'active',
      deactivate: 'deactivate'
  }.freeze

  STATUS = {
      approved: 'approved',
      rejected: 'rejected',
      pending: 'pending'
  }.freeze

  MODULES_NAME = %w(employees attendance bank pos).freeze

end