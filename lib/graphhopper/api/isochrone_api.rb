require "uri"

module GraphHopper
  class IsochroneApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Isochrone Request
    # The GraphHopper Isochrone API allows calculating an isochrone of a locations means to calculate 'a line connecting points at which a vehicle arrives at the same time,' see [Wikipedia](http://en.wikipedia.org/wiki/Isochrone_map). It is also called **reachability** or **walkability**.
    # @param point Specify the start coordinate
    # @param key Get your key at graphhopper.com
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :time_limit Specify which time the vehicle should travel. In seconds. (default to 600)
    # @option opts [Integer] :distance_limit Specify which distance the vehicle should travel. In meter. (default to -1)
    # @option opts [String] :vehicle Possible vehicles are bike, car, foot and [more](https://graphhopper.com/api/1/docs/supported-vehicle-profiles/) (default to car)
    # @option opts [Integer] :buckets For how many sub intervals an additional polygon should be calculated. (default to 1)
    # @option opts [BOOLEAN] :reverse_flow If &#x60;false&#x60; the flow goes from point to the polygon, if &#x60;true&#x60; the flow goes from the polygon \&quot;inside\&quot; to the point. Example usage for &#x60;false&#x60;&amp;#58; *How many potential customer can be reached within 30min travel time from your store* vs. &#x60;true&#x60;&amp;#58; *How many customers can reach your store within 30min travel time.* (default to false)
    # @option opts [String] :weighting Can be fastest or shortest (default to fastest)
    # @return [IsochroneResponse]
    def isochrone_get(point, key, opts = {})
      data, _status_code, _headers = isochrone_get_with_http_info(point, key, opts)
      return data
    end

    # Isochrone Request
    # The GraphHopper Isochrone API allows calculating an isochrone of a locations means to calculate &#39;a line connecting points at which a vehicle arrives at the same time,&#39; see [Wikipedia](http://en.wikipedia.org/wiki/Isochrone_map). It is also called **reachability** or **walkability**.
    # @param point Specify the start coordinate
    # @param key Get your key at graphhopper.com
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :time_limit Specify which time the vehicle should travel. In seconds.
    # @option opts [Integer] :distance_limit Specify which distance the vehicle should travel. In meter.
    # @option opts [String] :vehicle Possible vehicles are bike, car, foot and [more](https://graphhopper.com/api/1/docs/supported-vehicle-profiles/)
    # @option opts [Integer] :buckets For how many sub intervals an additional polygon should be calculated.
    # @option opts [BOOLEAN] :reverse_flow If &#x60;false&#x60; the flow goes from point to the polygon, if &#x60;true&#x60; the flow goes from the polygon \&quot;inside\&quot; to the point. Example usage for &#x60;false&#x60;&amp;#58; *How many potential customer can be reached within 30min travel time from your store* vs. &#x60;true&#x60;&amp;#58; *How many customers can reach your store within 30min travel time.*
    # @option opts [String] :weighting Can be fastest or shortest
    # @return [Array<(IsochroneResponse, Fixnum, Hash)>] IsochroneResponse data, response status code and response headers
    def isochrone_get_with_http_info(point, key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: IsochroneApi.isochrone_get ..."
      end
      # verify the required parameter 'point' is set
      if @api_client.config.client_side_validation && point.nil?
        fail ArgumentError, "Missing the required parameter 'point' when calling IsochroneApi.isochrone_get"
      end
      # verify the required parameter 'key' is set
      if @api_client.config.client_side_validation && key.nil?
        fail ArgumentError, "Missing the required parameter 'key' when calling IsochroneApi.isochrone_get"
      end
      # resource path
      local_var_path = "/isochrone"

      # query parameters
      query_params = {}
      query_params[:'point'] = point
      query_params[:'key'] = key
      query_params[:'time_limit'] = opts[:'time_limit'] if !opts[:'time_limit'].nil?
      query_params[:'distance_limit'] = opts[:'distance_limit'] if !opts[:'distance_limit'].nil?
      query_params[:'vehicle'] = opts[:'vehicle'] if !opts[:'vehicle'].nil?
      query_params[:'buckets'] = opts[:'buckets'] if !opts[:'buckets'].nil?
      query_params[:'reverse_flow'] = opts[:'reverse_flow'] if !opts[:'reverse_flow'].nil?
      query_params[:'weighting'] = opts[:'weighting'] if !opts[:'weighting'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'IsochroneResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: IsochroneApi#isochrone_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
