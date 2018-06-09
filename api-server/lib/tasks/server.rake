namespace :server do
  desc 'Restart server'
  task :restart do
    sh "ps x | grep puma | grep #{ENV['SERVER_PORT']} | awk '{print $1}' | xargs kill -9" do
      # ブロック渡さないとエラーになる
      # 多分、killコマンドの成功時に返される値がだめ
    end
    sh "rails s -d -b #{ENV['SERVER_IP']} -p #{ENV['SERVER_PORT']}"

    puts "\n=+-+-+-+-+-+-+-+-+="
    puts '  Restart server'
    puts "=+-+-+-+-+-+-+-+-+=\n"
  end
end
