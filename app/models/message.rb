class Message < ApplicationRecord
	require 'translator_api'

  belongs_to :user

  before_save :translate_content

  def translate_content
  	self.content = TranslatorApi.translate self.user.dialect, self.content
  end
end
