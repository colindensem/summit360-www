#require_relative "./lib/build_cleaner"

set :site_description, "Ruby & Elixir Development  : Sheffield UK"

# For custom domains on github pages
page "CNAME", layout: false

page "/sitemap.xml", layout: false

page "/50x.html", directory_index: false
page "/403.html", directory_index: false
page "/404.html", directory_index: false
page "/500.html", directory_index: false
page "/502.html", directory_index: false
page "/503.html", directory_index: false
page "/504.html", directory_index: false
page "/503.jpg", directory_index: false
page "/maintenance.html", directory_index: false


# page "/*", layout: 'page'
page "/articles/*", :layout => "article"
page "/articles/", layout: "page"
page "/", layout: 'layout'

set :url_root, "https://summit360.co.uk" 

activate :search_engine_sitemap

activate :meta_tags

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-12318827-2' # Replace with your property ID.
  # Tracking in development environment (default = true)
  #ga.development = false
end

###
# Helpers
###
require "lib/custom_helpers"
helpers CustomHelpers

#require 'bootstrap-sass'

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

activate :directory_indexes

set :relative_links, true

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

activate :blog do |blog|
  # blog.prefix = "articles"

  blog.sources = "posts/{year}-{month}-{day}-{title}.html"
  blog.taglink = "tag/{tag}.html"

  blog.permalink = "posts/{title}.html"
  blog.summary_separator = /SPLIT_SUMMARY_BEFORE_THIS/

  blog.paginate = true
  blog.page_link = "p{num}"
  blog.per_page = 20
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

#
## Middleman v4 Sprockets
#

activate :sprockets
sprockets.append_path 'node_modules/bootstrap-sass/assets/fonts'
sprockets.append_path 'node_modules/bootstrap-sass/assets/javascripts'
sprockets.append_path 'node_modules'
#
## DEPLOY
#
activate :deploy do |deploy|

  deploy.deploy_method = :git
  deploy.remote = 'github'
  deploy.branch = 'master'
  deploy.build_before = true

end

# Build-specific configuration
configure :build do

  set :build_dir, 'public'
  #set :base_url, "/middleman" # baseurl for GitLab Pages (project name) - leave empty if you're building a user/group website

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Minify HTML on build
  activate :minify_html

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

end
