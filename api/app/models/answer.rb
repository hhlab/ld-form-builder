class Answer < ApplicationRecord
  belongs_to :form_structure

  validate :valid_json

  def valid_json
    begin
      JSON.parse(answer_json)
    rescue JSON::ParserError
      errors.add(:answer_json, 'jsonとしてパースできません')
    end
  end

end
