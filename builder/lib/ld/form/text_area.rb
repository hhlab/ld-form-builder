module LD
  class Form
    require "ld/form/item"
    
    class TextArea < Item

      def initialize(form, title=nil)
        super(form, title)
        @min_length = nil
        @max_length = nil
      end

      def min_length(length=nil)
        min_length=(length) if length
        return @min_length
      end

      def min_length=(length)
        @min_length = length if is_valid_length?(length)
      end

      def max_length(lenth=nil)
        min_length=(length) if length
        return @max_length
      end

      def max_length=(length)
        @max_length = length if is_valid_length?(length) && is_greater_than_min_length?(length)
      end      

      def to_rdf
        graph = super
        about = self.resource
        graph << [about, vocabulary.max_length, @max_length] if @max_length
        graph << [about, vocabulary.min_length, @min_length] if @min_length
        return graph
      end

      protected
      def is_valid_length?(length)
        return length.is_a?(Fixnum) && length > 0
      end

      def is_greater_that_min_length?(length)
        return @min_length == nil || @min_length <= length
      end

    end

  end
end

