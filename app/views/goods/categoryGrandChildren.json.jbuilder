json.array! @categoryGrandChildren do |grandChild|
  json.id grandChild.id
  json.categoryName grandChild.categoryName
end