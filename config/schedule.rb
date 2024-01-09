# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:

require File.expand_path(File.dirname(__FILE__) + "/environment") # Rails.root(Railsメソッド)を使用するために必要
rails_env = ENV['RAILS_ENV'] || :development # cronを実行する環境変数(:development, :product, :test)
set :environment, rails_env # cronを実行する環境変数をセット
set :output, "#{Rails.root}/log/crontab.log" # cronのログ出力用ファイル

every 1.day, at: '0:00 am' do # タスクの実行間隔
  rake "create_achievements_data:create_achievement_daily_data" # ← rake "タスクのファイル名 : タスク名"
end

# Learn more: http://github.com/javan/whenever
