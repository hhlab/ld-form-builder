module LD::Visualization
  require "erb"
  class Dot
    class << self

      def translate(statements)
        entities = statements.to_a.flatten.uniq
        resources = entities.find_all{|i|
          i.is_a?(RDF::URI)
        }
        literals = entities - resources
        title = "rdf#{Time.now.to_i}"
        return ERB.new(template).run(binding)
      end
      
      private
      def template
        return File.read(File.expand_path("dot.erb", File.dirname(__FILE__)))
      end

    end
  end
end
  
