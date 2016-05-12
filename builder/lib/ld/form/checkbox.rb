module LD
  class Form
    require "ld/form/item"
    require "ld/form/option"
    require "ld/form/option_managable"
    require "set"
    
    class Checkbox < Item
      include OptionManagable

      def initialize(form, title=nil)
        super(form, title)
        @options = Set.new
      end

      def to_h
        hash = super
        hash[:title] = @title
        hash[:options] = {
          type: @options.class.to_s,
          items: @options.map{|i|
            i.url
          }
        }
        return hash
      end

      def to_rdf
        graph = super
        about = self.resource
        graph << [about, RDF.type, vocabulary.type]
        graph << [about, vocabulary.options, to_rdf_as_bag(graph, @options.map{|i|
                                                                                      i.url
                                                                                    })]
        return graph
      end

      alias :choices :options
      alias :choice :option
    end
  end
end
    
