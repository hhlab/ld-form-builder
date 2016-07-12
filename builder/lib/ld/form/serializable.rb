module LD
  class Form
    require "json"
    module Serializable

      def to_h
        return {
          type: self.class.to_s,
          url: @url
        }
      end

      def to_json
        return self.to_h.to_json
      end

      def create_url_from(base, appendix)
        return URI.join(base, File.join(base.path, appendix))
      end

    end
  end
end
