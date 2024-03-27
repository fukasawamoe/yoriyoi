# -*- encoding: utf-8 -*-
# stub: rubocop-airbnb 6.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rubocop-airbnb".freeze
  s.version = "6.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Airbnb Engineering".freeze]
  s.date = "2023-02-28"
  s.description = "    A plugin for RuboCop code style enforcing & linting tool. It includes Rubocop configuration\n    used at Airbnb and a few custom rules that have cause internal issues at Airbnb but are not\n    supported by core Rubocop.\n".freeze
  s.email = ["rubocop@airbnb.com".freeze]
  s.homepage = "https://github.com/airbnb/ruby".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.4.1".freeze
  s.summary = "Custom code style checking for Airbnb.".freeze

  s.installed_by_version = "3.4.1" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rubocop>.freeze, ["~> 1.32.0"])
  s.add_runtime_dependency(%q<rubocop-performance>.freeze, ["~> 1.10.2"])
  s.add_runtime_dependency(%q<rubocop-rails>.freeze, ["~> 2.9.1"])
  s.add_runtime_dependency(%q<rubocop-rspec>.freeze, ["~> 2.0.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5"])
end
