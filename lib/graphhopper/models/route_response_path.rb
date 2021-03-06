require 'date'

module GraphHopper
  # A found path
  class RouteResponsePath
    # The total distance of the route, in meter
    attr_accessor :distance

    # The total time of the route, in ms
    attr_accessor :time

    attr_accessor :ascend

    # The total descend (downhill) of the route, in meter
    attr_accessor :descend

    attr_accessor :points

    # Is true if the points are encoded, if not paths[0].points contains the geo json of the path (then order is lon,lat,elevation), which is easier to handle but consumes more bandwidth compared to encoded version
    attr_accessor :points_encoded

    # The bounding box of the route, format <br> minLon, minLat, maxLon, maxLat
    attr_accessor :bbox

    attr_accessor :snapped_waypoints

    attr_accessor :instructions

    attr_accessor :details


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'distance' => :'distance',
        :'time' => :'time',
        :'ascend' => :'ascend',
        :'descend' => :'descend',
        :'points' => :'points',
        :'points_encoded' => :'points_encoded',
        :'bbox' => :'bbox',
        :'snapped_waypoints' => :'snapped_waypoints',
        :'instructions' => :'instructions',
        :'details' => :'details'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'distance' => :'Float',
        :'time' => :'Integer',
        :'ascend' => :'Float',
        :'descend' => :'Float',
        :'points' => :'ResponseCoordinates',
        :'points_encoded' => :'BOOLEAN',
        :'bbox' => :'Array<Float>',
        :'snapped_waypoints' => :'ResponseCoordinates',
        :'instructions' => :'ResponseInstructions',
        :'details' => :'Object'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'distance')
        self.distance = attributes[:'distance']
      end

      if attributes.has_key?(:'time')
        self.time = attributes[:'time']
      end

      if attributes.has_key?(:'ascend')
        self.ascend = attributes[:'ascend']
      end

      if attributes.has_key?(:'descend')
        self.descend = attributes[:'descend']
      end

      if attributes.has_key?(:'points')
        self.points = attributes[:'points']
      end

      if attributes.has_key?(:'points_encoded')
        self.points_encoded = attributes[:'points_encoded']
      end

      if attributes.has_key?(:'bbox')
        if (value = attributes[:'bbox']).is_a?(Array)
          self.bbox = value
        end
      end

      if attributes.has_key?(:'snapped_waypoints')
        self.snapped_waypoints = attributes[:'snapped_waypoints']
      end

      if attributes.has_key?(:'instructions')
        self.instructions = attributes[:'instructions']
      end

      if attributes.has_key?(:'details')
        self.details = attributes[:'details']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          distance == o.distance &&
          time == o.time &&
          ascend == o.ascend &&
          descend == o.descend &&
          points == o.points &&
          points_encoded == o.points_encoded &&
          bbox == o.bbox &&
          snapped_waypoints == o.snapped_waypoints &&
          instructions == o.instructions &&
          details == o.details
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [distance, time, ascend, descend, points, points_encoded, bbox, snapped_waypoints, instructions, details].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = GraphHopper.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
