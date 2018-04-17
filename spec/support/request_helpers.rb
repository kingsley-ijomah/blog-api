module Requests
  module JsonHelpers
    def json_jwt
      json['jwt']
    end

    def json_links
      json['links']
    end

    def json_data
      json['data']
    end

    private

    def json
      JSON.parse(response.body)
    end
  end
end
