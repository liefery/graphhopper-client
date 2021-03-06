require "uri"

module GraphHopper
  class MatrixApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Matrix API
    # The Matrix API is part of the GraphHopper Directions API and with this API you can calculate many-to-many distances, times or routes a lot more efficient than calling the Routing API multiple times. In the Routing API we support multiple points, so called 'via points', which results in one route being calculated. The Matrix API results in NxM routes or more precise NxM weights, distances or times being calculated but is a lot faster compared to NxM single requests. The most simple example is a tourist trying to decide which pizza is close to him instead of using beeline distance she can calculate a 1x4 matrix. Or a delivery service in the need of often big NxN matrices to solve vehicle routing problems. E.g. the GraphHopper Route Optimization API uses the Matrix API under the hood to achieve this.
    # @param key Get your key at graphhopper.com
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :point Specifiy multiple points for which the weight-, route-, time- or distance-matrix should be calculated. In this case the starts are identical to the destinations. If there are N points, then NxN entries will be calculated. The order of the point parameter is important. Specify at least three points. Cannot be used together with from_point or to_point. Is a string with the format latitude,longitude.
    # @option opts [Array<String>] :from_point The starting points for the routes. E.g. if you want to calculate the three routes A-&amp;gt;1, A-&amp;gt;2, A-&amp;gt;3 then you have one from_point parameter and three to_point parameters. Is a string with the format latitude,longitude.
    # @option opts [Array<String>] :to_point The destination points for the routes. Is a string with the format latitude,longitude.
    # @option opts [Array<String>] :point_hint Optional parameter. Specifies a hint for each &#x60;point&#x60; parameter to prefer a certain street for the closest location lookup. E.g. if there is an address or house with two or more neighboring streets you can control for which street the closest location is looked up.
    # @option opts [Array<String>] :from_point_hint For the from_point parameter. See point_hint
    # @option opts [Array<String>] :to_point_hint For the to_point parameter. See point_hint
    # @option opts [Array<String>] :out_array Specifies which arrays should be included in the response. Specify one or more of the following options &#39;weights&#39;, &#39;times&#39;, &#39;distances&#39;. To specify more than one array use e.g. out_array&#x3D;times&amp;out_array&#x3D;distances. The units of the entries of distances are meters, of times are seconds and of weights is arbitrary and it can differ for different vehicles or versions of this API.
    # @option opts [String] :vehicle The vehicle for which the route should be calculated. Other vehicles are foot, small_truck etc (default to car)
    # @return [MatrixResponse]
    def matrix_get(key, opts = {})
      data, _status_code, _headers = matrix_get_with_http_info(key, opts)
      return data
    end

    # Matrix API
    # The Matrix API is part of the GraphHopper Directions API and with this API you can calculate many-to-many distances, times or routes a lot more efficient than calling the Routing API multiple times. In the Routing API we support multiple points, so called &#39;via points&#39;, which results in one route being calculated. The Matrix API results in NxM routes or more precise NxM weights, distances or times being calculated but is a lot faster compared to NxM single requests. The most simple example is a tourist trying to decide which pizza is close to him instead of using beeline distance she can calculate a 1x4 matrix. Or a delivery service in the need of often big NxN matrices to solve vehicle routing problems. E.g. the GraphHopper Route Optimization API uses the Matrix API under the hood to achieve this.
    # @param key Get your key at graphhopper.com
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :point Specifiy multiple points for which the weight-, route-, time- or distance-matrix should be calculated. In this case the starts are identical to the destinations. If there are N points, then NxN entries will be calculated. The order of the point parameter is important. Specify at least three points. Cannot be used together with from_point or to_point. Is a string with the format latitude,longitude.
    # @option opts [Array<String>] :from_point The starting points for the routes. E.g. if you want to calculate the three routes A-&amp;gt;1, A-&amp;gt;2, A-&amp;gt;3 then you have one from_point parameter and three to_point parameters. Is a string with the format latitude,longitude.
    # @option opts [Array<String>] :to_point The destination points for the routes. Is a string with the format latitude,longitude.
    # @option opts [Array<String>] :point_hint Optional parameter. Specifies a hint for each &#x60;point&#x60; parameter to prefer a certain street for the closest location lookup. E.g. if there is an address or house with two or more neighboring streets you can control for which street the closest location is looked up.
    # @option opts [Array<String>] :from_point_hint For the from_point parameter. See point_hint
    # @option opts [Array<String>] :to_point_hint For the to_point parameter. See point_hint
    # @option opts [Array<String>] :out_array Specifies which arrays should be included in the response. Specify one or more of the following options &#39;weights&#39;, &#39;times&#39;, &#39;distances&#39;. To specify more than one array use e.g. out_array&#x3D;times&amp;out_array&#x3D;distances. The units of the entries of distances are meters, of times are seconds and of weights is arbitrary and it can differ for different vehicles or versions of this API.
    # @option opts [String] :vehicle The vehicle for which the route should be calculated. Other vehicles are foot, small_truck etc
    # @return [Array<(MatrixResponse, Fixnum, Hash)>] MatrixResponse data, response status code and response headers
    def matrix_get_with_http_info(key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: MatrixApi.matrix_get ..."
      end
      # verify the required parameter 'key' is set
      if @api_client.config.client_side_validation && key.nil?
        fail ArgumentError, "Missing the required parameter 'key' when calling MatrixApi.matrix_get"
      end
      # resource path
      local_var_path = "/matrix"

      # query parameters
      query_params = {}
      query_params[:'key'] = key
      query_params[:'point'] = @api_client.build_collection_param(opts[:'point'], :multi) if !opts[:'point'].nil?
      query_params[:'from_point'] = @api_client.build_collection_param(opts[:'from_point'], :multi) if !opts[:'from_point'].nil?
      query_params[:'to_point'] = @api_client.build_collection_param(opts[:'to_point'], :multi) if !opts[:'to_point'].nil?
      query_params[:'point_hint'] = @api_client.build_collection_param(opts[:'point_hint'], :multi) if !opts[:'point_hint'].nil?
      query_params[:'from_point_hint'] = @api_client.build_collection_param(opts[:'from_point_hint'], :multi) if !opts[:'from_point_hint'].nil?
      query_params[:'to_point_hint'] = @api_client.build_collection_param(opts[:'to_point_hint'], :multi) if !opts[:'to_point_hint'].nil?
      query_params[:'out_array'] = @api_client.build_collection_param(opts[:'out_array'], :multi) if !opts[:'out_array'].nil?
      query_params[:'vehicle'] = opts[:'vehicle'] if !opts[:'vehicle'].nil?

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
        :return_type => 'MatrixResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MatrixApi#matrix_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Matrix API Post
    # The GET request has an URL length limitation, which hurts for many locations per request. In those cases use a HTTP POST request with JSON data as input. The only parameter in the URL will be the key which stays in the URL. Both request scenarios are identically except that all singular parameter names are named as their plural for a POST request.
    # @param key Get your key at graphhopper.com
    # @param [Hash] opts the optional parameters
    # @option opts [MatrixRequest] :body
    # @return [MatrixResponse]
    def matrix_post(key, opts = {})
      data, _status_code, _headers = matrix_post_with_http_info(key, opts)
      return data
    end

    # Matrix API Post
    # The GET request has an URL length limitation, which hurts for many locations per request. In those cases use a HTTP POST request with JSON data as input. The only parameter in the URL will be the key which stays in the URL. Both request scenarios are identically except that all singular parameter names are named as their plural for a POST request.
    # @param key Get your key at graphhopper.com
    # @param [Hash] opts the optional parameters
    # @option opts [MatrixRequest] :body
    # @return [Array<(MatrixResponse, Fixnum, Hash)>] MatrixResponse data, response status code and response headers
    def matrix_post_with_http_info(key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: MatrixApi.matrix_post ..."
      end
      # verify the required parameter 'key' is set
      if @api_client.config.client_side_validation && key.nil?
        fail ArgumentError, "Missing the required parameter 'key' when calling MatrixApi.matrix_post"
      end
      # resource path
      local_var_path = "/matrix"

      # query parameters
      query_params = {}
      query_params[:'key'] = key

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(opts[:'body'])
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'MatrixResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MatrixApi#matrix_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
