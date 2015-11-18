module LD
  class Form
    require "rdf"
    require "uri"
    
    module RDFSerializable
      def to_rdf
        return RDF::Graph.new
      end
      
      def resource
        return RDF::Resource.new(@url) if @url
        return nil
      end

      protected
      def to_rdf_as_bag(graph, bag)
        about = RDF::Resource.new
        graph << [about, RDF.type, RDF.Bag]
        array = bag.to_a

        array.length.times{|i|
          method_name = "_#{i+1}"
          item = array[i]
          unless is_resource?(item)
            graph << item.to_rdf
            item = item.url
          end
          graph << [about, RDF.send(method_name), RDF::Resource.new(item)]
        }
        return about
      end

      def is_resource?(item)
        return item.is_a?(URI) || item.is_a?(RDF::Resource) || item.is_a?(RDF::URI)
      end
      
    end
  end
end
