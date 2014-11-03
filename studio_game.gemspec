Gem::Specification.new do |s|
  s.name         = "Studio Game"
  s.version      = "1.0.0"
  s.author       = "Andrew Fong"
  s.email        = "andrew.fong@opower.com"
  s.homepage     = "http://opower.com"
  s.summary      = "Ruby Training"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README.md)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end
