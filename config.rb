###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }
["amuser", "defouler", "entrainer", "ressourcer", "tonifier", "aerer", "sport-a-2", "preparer-courses"].each do |cours|
  proxy "/envie-de/#{cours}.html", "/envie-de/show.html", :locals => { :cours => cours }, :ignore => true
end

data.lessons.envies.each do |lesson|
  proxy "/fiche/#{lesson.slug}.html", "/fiche/show.html", :locals => { :lesson => lesson }, :ignore => true
end


data.lessons.envies.each do |mire|
  proxy "/mire/#{mire.slug}.html", "/mire/show.html", :locals => { :mire => mire }, :ignore => true
end


# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
helpers do
  def is_page_active(page)
    current_page.url == page ? 'active' : ''
  end

  def inline_svg name
    root = Middleman::Application.root
    file_path = "#{root}/source/images/#{name}.svg"
    if File.exists?(file_path)
      File.read(file_path)
    else
      "<span class='icon-error'>Icon #{name} not found</span>"
    end
  end

end


# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end



activate :deploy do |deploy|
  deploy.deploy_method = :git
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch   = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end


activate :relative_assets
set :relative_links, true

