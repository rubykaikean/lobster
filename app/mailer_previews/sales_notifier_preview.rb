class SalesNotifierPreview
  def confirmation
    SalesNotifier.confirmation sale_id
  end


  def inform_admins
    SalesNotifier.inform_admins sale_id
  end
end
