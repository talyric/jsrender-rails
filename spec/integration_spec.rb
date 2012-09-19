require "spec_helper"

feature "Using jsRender", js: true do
  after do
    Rails.application.config.jsRender.prefix = ''
  end

  scenario "Loading a page that uses jsRender" do
    visit "/"
    page.should have_content("Sebastian Pape")
  end

  scenario "Using template prefix", js: true do
    Rails.application.config.jsRender.prefix = 'views'
    visit "/prefix"
    page.should have_content("Sebastian Pape")
  end

  scenario "Using a regular expression as a template prefix", js: true do
    Rails.application.config.jsRender.prefix = %r{([^/]*/)*}
    visit "/prefix"
    page.should have_content("Sebastian Pape")
  end
end
