json.array!(@news_items) do |item|
  json.extract! v1_news_item, :id
  json.title = item.title
  json.description - item.description
  json.pubDate = item.pubDate
  json.link = item.link
end
