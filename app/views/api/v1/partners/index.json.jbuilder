json.array! @partners do |partner|
  json.id partner.id
  json.name partner.name
  json.created_at partner.created_at
end