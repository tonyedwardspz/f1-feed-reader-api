require "test_helper"

class V1::NewsItemTest < ActiveSupport::TestCase

  def news_item
    @news_item ||= V1::NewsItem.new
  end

  def test_valid
    assert news_item.valid?
  end

end
