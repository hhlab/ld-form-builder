class FormStructure < ApplicationRecord
  has_many :answers

  validate :valid_json

  def valid_json
    begin
      JSON.parse(structure_json)
    rescue JSON::ParserError
      errors.add(:structure_json, 'jsonとしてパースできません')
    end
  end
end
