class EmailTemplateRenderer
  attr_reader :renderer, :body, :sale, :lot, :buyer, :product, :company, :user

  OPTIONS = {
    hard_wrap: true,
    filter_html: true
  }

  EXTENSIONS = {
    fenced_code_blocks: true,
    no_intra_emphasis: true,
    autolink: true,
    lax_html_blocks: true
  }

  PREFIXES = {
    "BUYER": [
      "full_name",
      "ic_number",
      "address",
      "mobile_contact_number",
      "email"
    ],
    "SALE": [
      "booking_fee",
      "actual_price"
    ],
    "LOT": [
      "name"
    ],
    "PRODUCT": [
      "name"
    ]
    "COMPANY": [
      "name"
    ]
    "USER": [
      "display_name"
    ]
  }

  def initialize(content, sale, buyer)
    @renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(OPTIONS), EXTENSIONS)
    @sale = sale
    @lot = @sale.lot
    @product = @sale.product
    @buyer = buyer
    @body = content
  end

  def render
    replace_prefixes
    self.renderer.render(self.body).html_safe
  end

  # private

  def replace_prefixes
    PREFIXES[:BUYER].each do |attr|
      self.body.gsub!("[buyer_#{attr}]", self.buyer.public_send("#{attr}").to_s)
    end
    PREFIXES[:SALE].each do |attr|
      self.body.gsub!("[sale_#{attr}]", self.sale.public_send("#{attr}").to_s)
    end
    PREFIXES[:LOT].each do |attr|
      self.body.gsub!("[lot_#{attr}]", self.lot.public_send("#{attr}").to_s)
    end
    PREFIXES[:PRODUCT].each do |attr|
      self.body.gsub!("[product_#{attr}]", self.product.public_send("#{attr}").to_s)
    end
    
  end

end