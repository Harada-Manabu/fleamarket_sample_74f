json.array! @categoryChildren do |child|
  json.id child.id
  json.categoryName child.categoryName
end