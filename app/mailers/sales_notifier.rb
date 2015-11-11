class SalesNotifier < ApplicationMailer
  include  ActionView::Helpers::SanitizeHelper

  def confirmation(sale_id)
    @sale = Sale.find_by(id: sale_id)
    @buyer = @sale.buyer
    email_template = @sale.product.email_setting
    @content = EmailTemplateRenderer.new(email_template.body, @sale, @buyer).render
    @text = strip_tags(@content)

    mail(to: "#{@buyer.email}", subject: "#{email_template.subject}", from: "#{email_template.from}", body: "#{@text}")  #from: "Sasa <sasa@outsq.com>")
  end

  def inform_admins(sale_id)
    @sale = Sale.find_by(id: sale_id)
    lot = @sale.lot
    @buyer = @sale.buyer
    @product = @sale.product
    email_template = @product.email_setting
    admin_emails = @sale.project.company.users.select {|user| user.is_admin? if (user.status_id == 1) }.map {|user| user.email }.join(", ")
    mail(to: "#{admin_emails}", subject: "New confirmed sale!", from: "#{email_template.from}", body: "#{lot.name} unit had been booked!")
  end

  def inform_agents(sale_id)
    @sale = Sale.find_by(id: sale_id)
    lot = @sale.lot
    email_template = @sale.product.email_setting
    agent_emails = @sale.project.company.users.map {|user| user.email if (user.status_id == 1)}.join(", ")
    mail(to: "#{agent_emails}", subject: "#{email_template.subject}", from: "#{email_template.from}", body: "#{lot.name} unit had been booked!")
  end
end
