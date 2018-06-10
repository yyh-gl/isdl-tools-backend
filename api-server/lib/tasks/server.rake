namespace :server do
  desc 'Stop server'
  task :stop do
    sh "ps x | grep puma | grep #{ENV['SERVER_PORT']} | awk '{print $1}' | xargs kill -9" do
      # ブロック渡さないとエラーになる
      # 多分、killコマンドの成功時に返される値がだめ
    end

    puts "\n=+-+-+-+-+-+-+-+-+="
    puts '    Stop server'
    puts "=+-+-+-+-+-+-+-+-+=\n\n"
  end

  desc 'Restart server'
  task :restart do
    sh "ps x | grep puma | grep #{ENV['SERVER_PORT']} | awk '{print $1}' | xargs kill -9" do
      # ブロック渡さないとエラーになる
      # 多分、killコマンドの成功時に返される値がだめ
    end
    sh "rails s -d -b #{ENV['LOCAL_SERVER_IP']} -p #{ENV['SERVER_PORT']}"

    puts "\n=+-+-+-+-+-+-+-+-+="
    puts '  Restart server'
    puts "=+-+-+-+-+-+-+-+-+=\n\n"
  end

  desc 'Deploy to server'
  task :deploy do
    sh 'git pull'
    sh "ps x | grep puma | grep #{ENV['SERVER_PORT']} | awk '{print $1}' | xargs kill -9" do
      # ブロック渡さないとエラーになる
      # 多分、killコマンドの成功時に返される値がだめ
    end
    sh "rails s -d -b #{ENV['LOCAL_SERVER_IP']} -p #{ENV['SERVER_PORT']}"

    puts "\n=+-+-+-+-+-+-+-+-+="
    puts ' Deploy to server'
    puts "=+-+-+-+-+-+-+-+-+=\n\n"
  end
end
