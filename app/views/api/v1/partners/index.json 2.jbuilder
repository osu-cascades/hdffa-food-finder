json.array! @partners do |partner|
  json.id partner.id
  json.avatar_url 'url.chillbros'
  json.business_type partner.categories.each
  json.distance 'null'
  json.featured true
  json.hdffa_url 'put partner url here'
  json.latitude 'null'
  json.location 'null'
  json.longitude 'null'
  json.name partner.name
  json.slug partner.name
end