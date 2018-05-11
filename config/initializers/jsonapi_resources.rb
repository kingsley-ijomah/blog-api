JSONAPI.configure do |config|
  # built in paginators are :none, :offset, :paged
  config.default_paginator = :paged

  config.default_page_size = 10
  config.maximum_page_size = 20

  #fixes issue with saving foreign keys e.g user_id
  config.json_key_format = :underscored_key
  # /api/v1/mailing_lists and not /api/v1/mailing-lists
  config.route_format = :underscored_route
end
