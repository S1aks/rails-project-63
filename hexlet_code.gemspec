# frozen_string_literal: true

require_relative "lib/hexlet_code/version"

Gem::Specification.new do |spec|
  spec.name = "hexlet_code"
  spec.version = HexletCode::VERSION
  spec.authors = ["Viacheslav Khrykin"]
  spec.email = ["vh78aks@gmail.com"]

  spec.summary = "Form Generator is a DSL that makes it easy to save forms."
  spec.description = "Form Generator is a DSL that makes it easy to save forms. This library takes on tasks that usually require writing a lot of boilerplate code, such as error handling. In the Rails world, Simple Form is used for this. Our generator is similar to it conceptually, but is much simpler."
  spec.homepage = "https://github.com/S1aks/rails-project-63"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/S1aks/rails-project-63"
  spec.metadata["changelog_uri"] = "https://github.com/S1aks/rails-project-63"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
