# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{miso}
  s.version = "0.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eloy Duran", "Manfred Stienstra"]
  s.date = %q{2010-08-17}
  s.description = %q{Miso is a unified API for simple image operations commonly used on the web.}
  s.email = ["eloy@fngtps.com", "manfred@fngtps.com"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README",
     "TODO"
  ]
  s.files = [
    "LICENSE",
     "README",
     "Rakefile",
     "TODO",
     "VERSION",
     "lib/miso.rb",
     "lib/miso/factory.rb",
     "lib/miso/image.rb",
     "lib/miso/processor.rb",
     "lib/miso/processor/core_image.rb",
     "lib/miso/processor/graphics_magick.rb",
     "lib/miso/processor/image_magick.rb",
     "miso.gemspec",
     "spec/api/factory_spec.rb",
     "spec/api/image_spec.rb",
     "spec/api/processor_spec.rb",
     "spec/api/processors_spec.rb",
     "spec/fixtures/120x100.png",
     "spec/functional/processor/core_image_spec.rb",
     "spec/functional/processor/graphics_magick_spec.rb",
     "spec/functional/processor/image_magick_spec.rb",
     "spec/functional/processor_spec.rb",
     "spec/start.rb"
  ]
  s.homepage = %q{http://github.com/Fingertips/miso}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Miso is a unified API for simple image operations commonly used on the web.}
  s.test_files = [
    "spec/api/factory_spec.rb",
     "spec/api/image_spec.rb",
     "spec/api/processor_spec.rb",
     "spec/api/processors_spec.rb",
     "spec/functional/processor/core_image_spec.rb",
     "spec/functional/processor/graphics_magick_spec.rb",
     "spec/functional/processor/image_magick_spec.rb",
     "spec/functional/processor_spec.rb",
     "spec/start.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<executioner>, [">= 0.3.0"])
    else
      s.add_dependency(%q<executioner>, [">= 0.3.0"])
    end
  else
    s.add_dependency(%q<executioner>, [">= 0.3.0"])
  end
end

