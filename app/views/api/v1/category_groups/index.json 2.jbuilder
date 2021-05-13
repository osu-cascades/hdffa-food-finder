json.array! @categories do |category|
  json.id category.id
  json.avatar_url 'url.chillbros'
  json.name category.name
  json.slug category.name
end