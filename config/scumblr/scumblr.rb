#     Copyright 2014 Netflix, Inc.
#
#     Licensed under the Apache License, Version 2.0 (the "License");
#     you may not use this file except in compliance with the License.
#     You may obtain a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#     Unless required by applicable law or agreed to in writing, software
#     distributed under the License is distributed on an "AS IS" BASIS,
#     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#     See the License for the specific language governing permissions and
#     limitations under the License.


Rails.application.routes.default_url_options[:host] ||= ENV["SCUMBLR_HOST"]
Rails.application.routes.default_url_options[:protocol] ||= ENV["SCUMBLR_PROTOCOL"]

Scumblr::Application.configure do 
  # Should Scumblr automatically generate screenshots for new results
  config.sketchy_url = "https://#{ENV["SKETCHY_PORT_443_TCP_ADDR"]}:#{ENV["SKETCHY_PORT_443_TCP_PORT"]}/api/v1.0/capture"
  config.sketchy_use_ssl = ENV["SKETCHY_USE_SSL"]
  config.sketchy_verify_ssl = ENV["SKETCHY_VERIFY_SSL"]
  config.sketchy_access_token = ENV["SKETCHY_ACCESS_TOKEN"]
  config.sketchy_tag_status_code = ENV["SKETCHY_TAG_STATUS_CODE"]

  # Provider configurations

  config.ebay_access_key = ENV["EBAY_ACCESS_KEY"]

  config.facebook_app_id = ENV["FACEBOOK_APP_ID"]
  config.facebook_app_secret = ENV["FACEBOOK_APP_SECRET"]

  config.google_developer_key = ENV["GOOGLE_DEVELOPER_KEY"]
  config.google_cx  = ENV["GOOGLE_CX"]
  config.google_application_name = ENV["GOOGLE_APPLICATION_NAME"]
  config.google_application_version = ENV["GOOGLE_APPLICATION_VERSION"]

  config.youtube_developer_key = ENV["YOUTUBE_DEVELOPER_KEY"]
  config.youtube_application_name = ENV["YOUTUBE_APPLICATION_NAME"]
  config.youtube_application_version = ENV["YOUTUBE_APPLICATION_VERSION"]

  config.twitter_consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.twitter_consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.twitter_access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.twitter_access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end
