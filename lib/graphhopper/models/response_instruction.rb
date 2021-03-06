require 'date'

module GraphHopper

  class ResponseInstruction
    # A description what the user has to do in order to follow the route. The language depends on the locale parameter.
    attr_accessor :text

    # The name of the street to turn onto in order to follow the route.
    attr_accessor :street_name

    # The distance for this instruction, in meter
    attr_accessor :distance

    # The duration for this instruction, in ms
    attr_accessor :time

    # An array containing the first and the last index (relative to paths[0].points) of the points for this instruction. This is useful to know for which part of the route the instructions are valid.
    attr_accessor :interval

    # A number which specifies the sign to show e.g. for right turn etc <br>TURN_SHARP_LEFT = -3<br>TURN_LEFT = -2<br>TURN_SLIGHT_LEFT = -1<br>CONTINUE_ON_STREET = 0<br>TURN_SLIGHT_RIGHT = 1<br>TURN_RIGHT = 2<br>TURN_SHARP_RIGHT = 3<br>FINISH = 4<br>VIA_REACHED = 5<br>USE_ROUNDABOUT = 6
    attr_accessor :sign

    # optional - A text describing the instruction in more detail, e.g. like surface of the way, warnings or involved costs.
    attr_accessor :annotation_text

    # optional - 0 stands for INFO, 1 for warning, 2 for costs, 3 for costs and warning
    attr_accessor :annotation_importance

    # optional - Only available for USE_ROUNDABOUT instructions. The count of exits at which the route leaves the roundabout.
    attr_accessor :exit_number

    # optional - Only available for USE_ROUNDABOUT instructions. The radian of the route within the roundabout - 0&lt;r&lt;2*PI for clockwise and -2PI&lt;r&lt;0 for counterclockwise transit. Null if the direction of rotation is undefined.
    attr_accessor :turn_angle


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'text' => :'text',
        :'street_name' => :'street_name',
        :'distance' => :'distance',
        :'time' => :'time',
        :'interval' => :'interval',
        :'sign' => :'sign',
        :'annotation_text' => :'annotation_text',
        :'annotation_importance' => :'annotation_importance',
        :'exit_number' => :'exit_number',
        :'turn_angle' => :'turn_angle'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'text' => :'String',
        :'street_name' => :'String',
        :'distance' => :'Float',
        :'time' => :'Integer',
        :'interval' => :'Array<Integer>',
        :'sign' => :'Integer',
        :'annotation_text' => :'String',
        :'annotation_importance' => :'Integer',
        :'exit_number' => :'Integer',
        :'turn_angle' => :'Float'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'text')
        self.text = attributes[:'text']
      end

      if attributes.has_key?(:'street_name')
        self.street_name = attributes[:'street_name']
      end

      if attributes.has_key?(:'distance')
        self.distance = attributes[:'distance']
      end

      if attributes.has_key?(:'time')
        self.time = attributes[:'time']
      end

      if attributes.has_key?(:'interval')
        if (value = attributes[:'interval']).is_a?(Array)
          self.interval = value
        end
      end

      if attributes.has_key?(:'sign')
        self.sign = attributes[:'sign']
      end

      if attributes.has_key?(:'annotation_text')
        self.annotation_text = attributes[:'annotation_text']
      end

      if attributes.has_key?(:'annotation_importance')
        self.annotation_importance = attributes[:'annotation_importance']
      end

      if attributes.has_key?(:'exit_number')
        self.exit_number = attributes[:'exit_number']
      end

      if attributes.has_key?(:'turn_angle')
        self.turn_angle = attributes[:'turn_angle']
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
          text == o.text &&
          street_name == o.street_name &&
          distance == o.distance &&
          time == o.time &&
          interval == o.interval &&
          sign == o.sign &&
          annotation_text == o.annotation_text &&
          annotation_importance == o.annotation_importance &&
          exit_number == o.exit_number &&
          turn_angle == o.turn_angle
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [text, street_name, distance, time, interval, sign, annotation_text, annotation_importance, exit_number, turn_angle].hash
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
