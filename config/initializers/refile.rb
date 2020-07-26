require "refile/s3"

aws = {
  access_key_id: "<%= Rails.application.credentials.dig(:aws, :access_key_id) %>",
  secret_access_key: "<%= Rails.application.credentials.dig(:aws, :secret_access_key) %>",
  region: "ap-northeast-1",
  bucket: "cadogs-rails-bucket",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)