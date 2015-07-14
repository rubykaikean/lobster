class SalesNotifier < ApplicationMailer
  include  ActionView::Helpers::SanitizeHelper

  def confirmation(sale_id)
    @sale = Sale.find_by(id: sale_id)
    @buyer = @sale.buyer
    email_template = @sale.product.email_setting
    @content = EmailTemplateRenderer.new(email_template.body, @sale, @buyer).render
    @text = strip_tags(@content)

    mail(to: "#{@buyer.email}", subject: "#{email_template.subject}", from: "#{email_template.from}")
  end

  def inform_admins(sale_id)
    @sale = Sale.find_by(id: sale_id)
    @lot = @sale.lot
    @buyer = @sale.buyer
    @product = @sale.product
    admin_emails = @sale.project.company.users.select {|user| user.is_admin? }.map {|user| user.email }.join(", ")
    mail to: "#{admin_emails}", subject: "New confirmed sale!"
  end
end