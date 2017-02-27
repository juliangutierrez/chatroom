class Message < ApplicationRecord
	require 'translator_api'

  belongs_to :user

  before_save :translate_content

  def icon
  	case self.user.dialect
  		when User::YODA
  			return 'fighter-jet'
  		when User::VALLEY
  			return 'shopping-bag'
  		when User::PIRATE
  			return 'flag'
		end		
  end

  def translate_content
  	if self.user.dialect == User::PIRATE
  		self.content = TranslatorApi.translate_pirate content
  	else
  		self.content = TranslatorApi.translate_other self.user.dialect, self.content
  	end
  end
end
