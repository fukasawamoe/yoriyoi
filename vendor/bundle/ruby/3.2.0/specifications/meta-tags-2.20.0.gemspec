# -*- encoding: utf-8 -*-
# stub: meta-tags 2.20.0 ruby lib

Gem::Specification.new do |s|
  s.name = "meta-tags".freeze
  s.version = "2.20.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/kpumuk/meta-tags/issues/", "changelog_uri" => "https://github.com/kpumuk/meta-tags/blob/main/CHANGELOG.md", "documentation_uri" => "https://rubydoc.info/github/kpumuk/meta-tags/", "homepage_uri" => "https://github.com/kpumuk/meta-tags/", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/kpumuk/meta-tags/" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dmytro Shteflyuk".freeze]
  s.bindir = "exe".freeze
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDcDCCAligAwIBAgIBATANBgkqhkiG9w0BAQsFADA/MQ8wDQYDVQQDDAZrcHVt\ndWsxFjAUBgoJkiaJk/IsZAEZFgZrcHVtdWsxFDASBgoJkiaJk/IsZAEZFgRpbmZv\nMB4XDTIzMDcwNjEyMjY0MVoXDTI0MDcwNTEyMjY0MVowPzEPMA0GA1UEAwwGa3B1\nbXVrMRYwFAYKCZImiZPyLGQBGRYGa3B1bXVrMRQwEgYKCZImiZPyLGQBGRYEaW5m\nbzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALw2YroZc+IT+rs8NuPu\nc13DelrxrpAgPEu1zuRb3l7WaHRNWA4TyS8Z6Aa1G2O+FdUZNMW1n7IwP/QMJ9Mz\nahRBiTmhik5kasJ9s0h1lq5/hZiycm0o5OtGioUzCkvk+UEMpzMHbLmVSZCzYciy\nNDRDbXB0rLLu1eJk+gKgn6Qf5vj93h1w28BdWdaA7YegtbmipZ+pjmzCQAfPActT\n6uXHG4dSo7Lz9jiFRI5dUizFbGXcRqkQ2b5AB8FFmfcvbqERvzQKBICnybjsKP0N\npJ3vGgO2sh5GvJFOPk1Vlur2nX9ZFznPEP1CEAQ+NFrmKRt355Z5sgOkAojSGnIL\n/1sCAwEAAaN3MHUwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0OBBYEFPa4\nVFc1YOlV1u/7EGTwMCAk8YE9MB0GA1UdEQQWMBSBEmtwdW11a0BrcHVtdWsuaW5m\nbzAdBgNVHRIEFjAUgRJrcHVtdWtAa3B1bXVrLmluZm8wDQYJKoZIhvcNAQELBQAD\nggEBALwivjTzGErFzBtgPEQe7uO6DMysgm/OIF5jLFkvRiuFbuueHM2cUZZBx2Rd\n2R5uQS4uiZ5KA+3SkgWQOFOzpFlo7ywS5264ULCcvfix6NQpb2aIDsZuzWGBIDbs\nixS+8wYslrzsOgUSn/RjF0sVB0dw4wv6G8YnVrR/Jf2SaO+Q2lYuKEOKfj52I+Yt\nTdFiOjR+WwXSxs/XdSdFtqK2q/THbZdk+HkAe8guvXYtD/fzO2mBlk2AQ0hV1Pxu\novz1LEphwrX/6v635mteXvl+OKWrNo1Q78sU364BgY5MvJMxFytmUrKMgO6RAiIM\nN9+lhJiLa7+h0LrvPPDZRhV8ze0=\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2023-12-26"
  s.description = "Search Engine Optimization (SEO) plugin for Ruby on Rails applications.".freeze
  s.email = ["kpumuk@kpumuk.info".freeze]
  s.homepage = "https://github.com/kpumuk/meta-tags".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.4.1".freeze
  s.summary = "Collection of SEO helpers for Ruby on Rails.".freeze

  s.installed_by_version = "3.4.1" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<actionpack>.freeze, [">= 6.0.0", "< 7.2"])
  s.add_development_dependency(%q<railties>.freeze, [">= 3.2.0", "< 7.2"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.12.0"])
  s.add_development_dependency(%q<rspec-html-matchers>.freeze, ["~> 0.10.0"])
  s.add_development_dependency(%q<appraisal>.freeze, ["~> 2.5.0"])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.22.0"])
  s.add_development_dependency(%q<standard>.freeze, ["~> 1.31"])
  s.add_development_dependency(%q<rubocop-rails>.freeze, ["~> 2.23.0"])
  s.add_development_dependency(%q<rubocop-rake>.freeze, ["~> 0.6.0"])
  s.add_development_dependency(%q<rubocop-rspec>.freeze, ["~> 2.25.0"])
  s.add_development_dependency(%q<rspec_junit_formatter>.freeze, ["~> 0.6.0"])
end
