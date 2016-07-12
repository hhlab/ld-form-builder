module LD
  class Form
    class RDFTranslator
      require "rdf"
      class Option

        self << class
          attr_reader :translator
          
          @@translator = lambda{|translator, target|
            result = RDF::Graph.new
            if target.is_a?(LD::Form::Option)
              subject = RDF::Resource.new(target.url)
              result << [subject, RDF::RDFS.label, target.label]
              result << [subject, RDF.type, LD::Form::RDFTranslator::Vocabulary.
            end
            result
            }
          end
        end

      end
    end
  end
end
