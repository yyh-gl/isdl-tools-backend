namespace :server do
  desc 'Restart server'
  task :restart do
    sh "ps x | grep puma | grep 62455 | awk '{print $1}' | xargs kill -9"
    sh "rails s -d -b #{ENV['SERVER_IP']} -p #{ENV['SERVER_PORT']}"

    puts "\n=+-+-+-+-+-+-+-+-+="
    puts '  Restart server'
    puts "=+-+-+-+-+-+-+-+-+=\n"
  end
end
