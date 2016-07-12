module LD
  class Form
    require "uri"    
    require "set"
    require "rdf"
    require "ld/form/item"
    require "ld/form/serializable"
    require "ld/form/rdf_serializable"
    require "ld/form/rdf_translator"

    class Option
      include Serializable
      include RDFSerializable
      
      attr_reader :label, :parents
      
      def initialize(label, url=nil)
        @label = label
        @parents = Set.new
        self.url = url
      end

      def url=(url)
        url = URI.parse(url) if url && !url.is_a?(URI)
        @url = url
      end

      def url(url=nil)
        self.url= url if url
        return @url
      end

      def add_parent(item)
        if item.is_a?(LD::Form::Item)
          @parents.add(item)
          item.parent.options(self) if item.parent
        end
      end

      def to_h
        hash = super
        hash[:label] = @label
        hash[:refered_from] = {
          type: @parents.class.to_s,
          items: @parents.map{|p| p.url}
        }
        return hash
      end        

      def to_rdf
        graph = RDF::Graph.new

        about = RDF::Resource.new(@url)

        graph << [about, RDF::RDFS.label, @label]
        graph << [about, RDF.type, RDFTranslator::Vocabulary::Option.type]

        if(@parents.length > 0)
          bag = RDF::Resource.new        
          graph << [about, RDFTranslator::Vocabulary::Option.refered_from, to_rdf_as_bag(graph, @parents)]
        end
        return graph
      end
      
    end
  end
end
      
