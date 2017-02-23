require 'rails_helper'
require 'translator_api'

RSpec.describe TranslatorApi do
	let(:output) do
    output = File.open('./spec/apis/response.html')
    output.read
  end
  it 'returns the translated sentence' do
  	result = TranslatorApi.parse_css Nokogiri::HTML(output)
  	expect(result).to eq 'With  you, may the force be'
  end
end