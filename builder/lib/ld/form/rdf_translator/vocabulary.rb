module LD
  class Form
    class RDFTranslator
      require "rdf"
      module Vocabulary
        BASE = "http://www.tom.sfc.keio.ac.jp/maff/2015/form/"
      end
    end
  end
end

require "ld/form/rdf_translator/vocabulary/option"
require "ld/form/rdf_translator/vocabulary/item"
require "ld/form/rdf_translator/vocabulary/checkbox"
require "ld/form/rdf_translator/vocabulary/number_field"
require "ld/form/rdf_translator/vocabulary/text_area"
require "ld/form/rdf_translator/vocabulary/form"
