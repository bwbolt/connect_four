require './game'
require './menu'
require 'rspec'

describe Menu do
  it 'exists' do

    menu = Menu.new

  expect(menu).to be_a(Menu)
  end
  it 'responds to user input' do
    menu = Menu.new

  user_input = 'p'

  expect(menu.check_input_validity(user_input)).to eq('p')
  end
  it 'properly responds to input_coordinator' do
    menu = Menu.new

  expect(menu).to respond_to(:input_coordinator)
  end
end
