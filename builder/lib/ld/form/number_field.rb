module LD
  class Form
    require "ld/form/item"
    
    class NumberField < Item
      @@available_types = [:integer, :float]

      def initialize(form, title=nil)
        super(form, title)
        @answer_type = :integer
        @min = 0
        @max = 10
      end

      def allows(t=nil)
        allows=(t) if t
        return @answer_type
      end

      def allows=(t)
        t = t.to_sym
        @answer_type = t if available_type?(t)
      end

      def min(number=nil)
        min=(number) if number
        return @min
      end

      def min=(number)
        @min = normalize_value(number) if is_valid_number?(number)
      end

      def max(number=nil)
        min=(number) if number
        return @max
      end

      def max=(number)
        @max = normalize_value(number) if is_valid_number?(number) && is_greater_than_min?(number)
      end      

      protected
      def is_valid_number?(number)
        return number.is_a?(:integer)
      end

      def is_greater_than_min?(number)
        return @min == nil || @min <= number
      end

      def allow_integer_only?
        return @answer_type == :integer
      end

      def allow_float?
        return @answer_type == :float
      end

      def normalize_value(number)
        return number.floor if allow_integer_only?
        return number
      end

      private
      def available_type?(t)
        return @@available_types.index(t) != nil
      end

    end

  end
end

