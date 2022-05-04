# frozen_string_literal: true

# Generate an index for the panel.  This file will be downloaded
# directly from Github's repositories and is for internal use only.
Jekyll::Hooks.register :site, :post_read, priority: :low do |site|
  panel = {
    posts: {},
    layouts: {}
  }

  # Index everything by layout and relative path.
  site.posts.docs.each do |doc|
    # Relative path is for downloading
    # Title is for humans
    # Layout is for collections
    # and URL for linking back to the website
    panel[:posts][doc.relative_path] = {
      title: doc.data['title'],
      layout: doc.data['layout'],
      url: doc.url
    }

    panel[:posts][doc.relative_path][:book] = doc.data['book'].relative_path if doc.data['book']

    panel[:layouts][doc.data['layout']] ||= []
    panel[:layouts][doc.data['layout']]  << doc.relative_path
  end

  # The file is later available to themes.
  File.open(site.in_source_dir(site.config['data_dir'], 'panel.json'), 'w') do |f|
    Jekyll.logger.info 'Panel', "Creating #{f.path}"

    f.write panel.to_json
  end
end
