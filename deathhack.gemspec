# -*- encoding: utf-8 -*-
require File.expand_path('../lib/deathhack/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Misty De Meo"]
  gem.email         = ["mistydemeo@gmail.com"]
  gem.description   = %q{Roguelike about dying}
  gem.summary       = %q{Roguelike about dying}
  gem.homepage      = "http://www.com"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = ['deathhack']
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "deathhack"
  gem.require_paths = ["lib"]
  gem.version       = DeathHack::VERSION
end
