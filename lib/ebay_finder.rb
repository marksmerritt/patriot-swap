require "httparty"

class EbayFinder
  BASE_URI = "https://svcs.ebay.com/services/search"
  SERVICE = "FindingService"
  VERSION = "v1"
  SERVICE_VERSION = "1.0.0"
  SECURITY_APP_NAME = ENV["EBAY_APP_ID"]
  RESPONSE_DATA_FORMAT = "JSON"

  def self.by_isbn(isbn:, limit:)
    operation_name = "findItemsByProduct"
    product_id_type = "ISBN"
    product_id = isbn

    response = send_request(operation_name, product_id_type, product_id)
    handle_response(response, limit)
  end

  class << self
    private 

    def send_request(operation_name, product_id_type, product_id)
      request_uri = "#{EbayFinder::BASE_URI}/#{EbayFinder::SERVICE}/#{EbayFinder::VERSION}?OPERATION-NAME=#{operation_name}&SERVICE-VERSION=#{EbayFinder::SERVICE_VERSION}&SECURITY-APPNAME=#{EbayFinder::SECURITY_APP_NAME}&RESPONSE-DATA-FORMAT=#{EbayFinder::RESPONSE_DATA_FORMAT}&REST-PAYLOAD&productId.@type=#{product_id_type}&productId=#{product_id}"
      HTTParty.get(request_uri)
    end

    def handle_response(response, limit)
      if response.success?
        json_response = JSON.parse(response, symbolize_names: true)
        get_results(json_response, limit)
      else
        []
      end
    end

    def get_results(json_response, limit)
      products = json_response[:findItemsByProductResponse].first
      search_result = products[:searchResult] ? products[:searchResult].first : []
      (search_result.present? && search_result[:@count] != "0") ? search_result[:item].first(limit) : []
    end
  end
end


