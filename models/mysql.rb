Model.new(:mysql, 'MySQL backup') do
  compress_with Gzip

  database MySQL do |db|
    db.name               = ENV['MYSQL_DATABASE']
    db.username           = ENV['MYSQL_USER']
    db.password           = ENV['MYSQL_PASSWORD']
    db.host               = ENV['MYSQL_HOST']
    db.port               = ENV['MYSQL_PORT']
    db.additional_options = ['--quick', '--single-transaction']
  end

  store_with S3 do |s3|
    s3.access_key_id = ENV['AWS_ACCESS_KEY_ID']
    s3.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    s3.region = ENV['AWS_REGION']
    s3.bucket = ENV['AWS_BUCKET']
    s3.path = ENV['AWS_MYSQL_PATH']
  end
end
