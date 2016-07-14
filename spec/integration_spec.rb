require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new doctor', {:type => :feature}) do
  it('allows administrator to click a doctor to see the name and specialty') do
    visit('/')
    click_link('Add New Doctor')
    fill_in('name', :with => 'Dr. Deodhar')
    click_button('Add Specialty')
    expect(page).to have_content('Success!')
    end
  end
