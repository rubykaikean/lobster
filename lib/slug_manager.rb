class SlugManager

  def self.reset_slug
    [Company, Project, Phase, Product, ProductType, User, Admin, Lot].each do |class_name|
      class_name.find_each do |record|
        record.slug = nil
        record.save
      end
    end
  end

end