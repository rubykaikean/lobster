class SalesNotifier < ApplicationMailer
  include  ActionView::Helpers::SanitizeHelper

  def confirmation(sale_id)
    @sale = Sale.find_by(id: sale_id)
    @user = User.find_by(id: @sale.user_id)
    @company = Company.find_by(id: @user.company_id)
    @buyer = @sale.buyer
    email_template = @sale.product.email_setting
    @content = EmailTemplateRenderer.new(email_template.body, @sale, @buyer, @user, @company).render
    @text = strip_tags(@content)

    mail(to: "#{@buyer.email}", subject: "#{email_template.subject}", from: "#{email_template.from}", body: "#{@text}")  #from: "Sasa <sasa@outsq.com>")
  end

  # two way coming in
  def inform_admins(sale_id)
    @sale = Sale.find_by(id: sale_id)
    lot = @sale.lot
    @buyer = @sale.buyer
    @product = @sale.product
    email_template = @product.email_setting
    admin_emails = @sale.project.company.users.select {|user| user.is_admin? if (user.status_id == User::ACTIVE) }.map {|user| user.email }.join(", ")
    # unless payment.present?
      mail(to: "#{admin_emails}", subject: "Inform Admin, New confirmed sale!", from: "#{email_template.from}", body: "#{lot.name} unit had been booked!")
    # else
    #   mail(to: "#{admin_emails}", subject: "Inform Admin, Sale had been upload a payment!", from: "#{email_template.from}", body: "#{lot.name} unit had been upload a new payment, buyer name: #{@buyer.full_name}, Phone Number: #{@buyer.mobile_contact_number}")
    # end
  end

  def inform_admins_payment(sale_id)
    
  end


  def inform_agents(sale_id)
    @sale = Sale.find_by(id: sale_id)
    lot = @sale.lot
    email_template = @sale.product.email_setting
    agent_emails = @sale.project.company.users.map {|user| user.email if (user.status_id == 1)}.join(", ")
    mail(to: "#{agent_emails}", subject: "#{email_template.subject}", from: "#{email_template.from}", body: "#{lot.name} unit had been booked!")
  end

  def inform_api_transfer_fail(sale_id)
    sale = Sale.find_by(id: sale_id)
    lot = sale.lot
    mail(to: "khongkk89@gmail.com", subject: "Contact Admin, Lot fail", from: "admin@llkproperties.com.my", body: "#{lot.name} unit cannot transfer to eversolf.")
  end

  def api_unit_not_found(sale_id)
    sale = Sale.find_by(id: sale_id)
    lot = sale.lot
    mail(to: "leon@outsq.com", subject: "Lot No Not Found", from: "admin@llkproperties.com.my", body: "#{lot.name} unit not found!, Contact Admin. ")
  end
end
