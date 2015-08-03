json.array!(@enquiries) do |enquiry|
  json.extract! enquiry, :id, :product_id
  json.url enquiry_url(enquiry, format: :json)
end
