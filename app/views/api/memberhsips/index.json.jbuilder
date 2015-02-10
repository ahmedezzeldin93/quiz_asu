json.array!(@memberhsips) do |memberhsip|
  json.extract! memberhsip, :id, :status
  json.url memberhsip_url(memberhsip, format: :json)
end
