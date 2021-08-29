module Spoonacular
    class Client

        BASE_URL = 'https://api.spoonacular.com'

        def initialize (api_token = Rails.application.credentials.dig(:token))
            @api_token = api_token
        end

        def search_menu_items(menu)
            request(
                http_method: :get,
                endpoint:"food/menuItems/search?query=#{menu}&apiKey=#{@api_token}"
                  )
        end

        def search_by_nutrients(mintype,value1,maxtype,value2)
            request(
                http_method: :get,
                endpoint: "recipes/findByNutrients?#{mintype}=#{value1.to_i}&apiKey=#{@api_token}"
            )
        end

       
        private

        def request(http_method: , endpoint: , params: {})
        @response = connection.public_send(http_method, endpoint, params)
        parsed_data = JSON.parse(@response.body)

        return parsed_data if successful?
        raise  RuntimeError ,"Code: #{@response.status} , #{@response.body}"
        end

        def connection
            @connection ||= Faraday.new(BASE_URL) do | info |
            info.request :url_encoded
            info.adapter Faraday.default_adapter
            info.headers['Authorization'] = "token #{@api_token}" if @api_token.present?
            end
        end

        def successful?
            @response.status == 200
        end
        end
    end

