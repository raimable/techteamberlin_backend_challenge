json.array! @nationalities do |nationality|
  json.extract! nationality, :id, :name
end
