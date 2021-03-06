# Common files
require 'graphhopper/api_client'
require 'graphhopper/api_error'
require 'graphhopper/version'
require 'graphhopper/gem_configuration'

# Models
require 'graphhopper/models/activity'
require 'graphhopper/models/address'
require 'graphhopper/models/configuration'
require 'graphhopper/models/cost_matrix'
require 'graphhopper/models/cost_matrix_data'
require 'graphhopper/models/cost_matrix_data_info'
require 'graphhopper/models/detail'
require 'graphhopper/models/gh_error'
require 'graphhopper/models/gh_error_hints'
require 'graphhopper/models/geocoding_location'
require 'graphhopper/models/geocoding_point'
require 'graphhopper/models/geocoding_response'
require 'graphhopper/models/isochrone_response'
require 'graphhopper/models/isochrone_response_polygon'
require 'graphhopper/models/isochrone_response_polygon_geometry'
require 'graphhopper/models/isochrone_response_polygon_properties'
require 'graphhopper/models/job_id'
require 'graphhopper/models/location'
require 'graphhopper/models/matrix_request'
require 'graphhopper/models/matrix_response'
require 'graphhopper/models/model_break'
require 'graphhopper/models/objective'
require 'graphhopper/models/relation'
require 'graphhopper/models/request'
require 'graphhopper/models/response'
require 'graphhopper/models/response_coordinates'
require 'graphhopper/models/response_coordinates_array'
require 'graphhopper/models/response_info'
require 'graphhopper/models/response_instruction'
require 'graphhopper/models/response_instructions'
require 'graphhopper/models/route'
require 'graphhopper/models/route_point'
require 'graphhopper/models/route_response'
require 'graphhopper/models/route_response_path'
require 'graphhopper/models/routing'
require 'graphhopper/models/service'
require 'graphhopper/models/shipment'
require 'graphhopper/models/solution'
require 'graphhopper/models/solution_unassigned'
require 'graphhopper/models/stop'
require 'graphhopper/models/time_window'
require 'graphhopper/models/vehicle'
require 'graphhopper/models/vehicle_type'

# APIs
require 'graphhopper/api/geocoding_api'
require 'graphhopper/api/isochrone_api'
require 'graphhopper/api/matrix_api'
require 'graphhopper/api/routing_api'
require 'graphhopper/api/solution_api'
require 'graphhopper/api/vrp_api'

module GraphHopper
  class << self
    # Customize default settings for the SDK using block.
    #   GraphHopper.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default GemConfiguration object.
    def configure
      if block_given?
        yield(GemConfiguration.default)
      else
        GemConfiguration.default
      end
    end
  end
end
