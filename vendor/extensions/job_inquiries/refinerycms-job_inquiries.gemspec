# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = "refinerycms-job_inquiries"
  s.version           = "1.0.0"
  s.description       = "Ruby on Rails Job Inquiries forms-extension for Refinery CMS"
  s.date              = "2016-07-19"
  s.summary           = "Job Inquiries forms-extension for Refinery CMS"
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.authors           = ["John Jones"]

  # Runtime dependencies
  s.add_dependency    "refinerycms-core",     "~> 3.0.4"
  s.add_dependency    "refinerycms-settings", "~> 3.0.0"
  s.add_dependency    "filters_spam", "~> 0.3"
  s.add_dependency    "actionmailer"

  # Development dependencies (usually used for testing)
  s.add_development_dependency "refinerycms-testing", "~> 3.0.4"
end
