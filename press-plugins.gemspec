# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'press-plugins'
  spec.version       = '0.1.0'
  spec.authors       = %w[f]
  spec.email         = %w[f@sutty.nl]

  spec.summary       = 'Jekyll plugins for NYU Press'
  spec.description   = 'Jekyll plugins for NYU Press'
  spec.homepage      = "https://github.com/nyu-dss/press-plugins"
  spec.license       = 'Custom'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  spec.metadata = {
    'bug_tracker_uri' => "#{spec.homepage}/issues",
    'homepage_uri' => spec.homepage,
    'source_code_uri' => spec.homepage,
    'changelog_uri' => "#{spec.homepage}/-/blob/master/CHANGELOG.md",
    'documentation_uri' => "https://rubydoc.info/gems/#{spec.name}"
  }

  spec.files         = Dir['lib/**/*']
  spec.require_paths = %w[lib]

  spec.extra_rdoc_files = Dir['README.md', 'CHANGELOG.md', 'LICENSE.txt']
  spec.rdoc_options += [
    '--title', "#{spec.name} - #{spec.summary}",
    '--main', 'README.md',
    '--line-numbers',
    '--inline-source',
    '--quiet'
  ]

  spec.add_dependency 'pry'
  spec.add_dependency 'jekyll', '~> 4.2.0'
  spec.add_dependency 'reverse_markdown'
  spec.add_dependency 'jaro_winkler'
  spec.add_dependency 'jekyll-write-and-commit-changes'
  spec.add_dependency 'sutty-migration', '~> 0.3.3'
  spec.add_dependency 'php-serialize'
  spec.add_dependency 'wordpress-formatting'
end
