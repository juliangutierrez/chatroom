class Message < ApplicationRecord
	require 'translator_api'

  belongs_to :user

  before_save :translate_content

  def translate_content
  	if self.user.dialect == User::PIRATE
  		self.content = TranslatorApi.translate_pirate content
  	else
  		self.content = TranslatorApi.translate_other self.user.dialect, self.content
  	end
  end
end
