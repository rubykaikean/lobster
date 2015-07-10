# Preview all emails at http://localhost:3000/rails/mailers/sales_notifier
class SalesNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sales_notifier/confirmation
  def confirmation
    SalesNotifier.confirmation
  end

end
