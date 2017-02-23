require 'rails_helper'

RSpec.describe Message, type: :model do
	let(:pirate) do
		User.create(name: 'Blackbeard', dialect: User::PIRATE)
	end

	let(:pirate_message) do
		Message.new(user: pirate, content: 'Hello')
	end

	let(:valley_girl) do
		User.create(name: 'Annoying girl', dialect: User::VALLEY)
	end

	let(:valley_message) do
		Message.new(user: valley_girl, content: 'I am going to the mall')
	end

	let(:yoda) do
		User.create(name: 'Yoda', dialect: User::YODA)
	end

	let(:yoda_message) do
		Message.new(user: yoda, content: 'May the force be with you')
	end

  it 'translates to pirate dialect' do
  	pirate_message.save
  	expect(pirate_message.content).to eq 'Ahoy'
  end

  it 'translates to valley girl dialect' do
  	valley_message.save
  	expect(valley_message.content).to eq 'I am going to like, the mall'
  end

  it 'translates to yoda dialect' do
  	yoda_message.save
  	expect(yoda_message.content).to eq 'With  you, may the force be'
  end
end
