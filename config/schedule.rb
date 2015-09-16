# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

every 3.hours do # Many shortcuts available: :hour, :day, :month, :year, :reboot
  runner "GetFeed.fetch_all_feeds"
end

# Learn more: http://github.com/javan/whenever
