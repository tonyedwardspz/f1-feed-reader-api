json.items do
  json.array! @news_items do |item|
	  json.title item.title
	  json.description item.description
	  json.pubDate item.pubDate
	  json.link item.link
	  json.source item.source
  end
end
