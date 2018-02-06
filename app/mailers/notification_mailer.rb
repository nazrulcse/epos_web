class NotificationMailer < ApplicationMailer
  layout false, only: 'company_welcome'

  def company_welcome(employee)
    @company_owner_new = employee
    mail(to: employee.email, subject: 'Welcome to Bequent')
    render layout: false
  end

  def company_created_notice(employee, company)
    @company_owner_new = employee
    @new_company = company
    mail(to: 'asad.ku.math@gmail.com', subject: 'Company Creation Notice!!')
  end

end
