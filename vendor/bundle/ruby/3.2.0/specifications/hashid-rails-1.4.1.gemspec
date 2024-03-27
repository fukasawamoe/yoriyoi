# -*- encoding: utf-8 -*-
# stub: hashid-rails 1.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "hashid-rails".freeze
  s.version = "1.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Justin Cypret".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-08-10"
  s.description = "    This gem allows you to easily use [Hashids](http://hashids.org/ruby/)\n    in your Rails app. Instead of your models using sequential numbers like 1,\n    2, 3, they will instead have unique short hashes like \"yLA6m0oM\",\n    \"5bAyD0LO\", and \"wz3MZ49l\". The database will still use integers under\n    the hood, so this gem can be added or removed at any time.\n".freeze
  s.email = ["jcypret@gmail.com".freeze]
  s.homepage = "https://github.com/jcypret/hashid-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.1".freeze
  s.summary = "Use Hashids in your Rails app models.".freeze

  s.installed_by_version = "3.4.1" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<appraisal>.freeze, [">= 0"])
  s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
  s.add_development_dependency(%q<byebug>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4.0"])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.17.1"])
  s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<activerecord>.freeze, [">= 4.0"])
  s.add_runtime_dependency(%q<hashids>.freeze, ["~> 1.0"])
end
