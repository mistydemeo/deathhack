# -*- encoding: utf-8 -*-
require File.expand_path('../lib/deathhack/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Misty De Meo"]
  gem.email         = ["mistydemeo@gmail.com"]
  gem.description   = %q{Roguelike about dying}
  gem.summary       = <<-EOS
  In most roguelikes, death is an inevitable, continual rite of passage for new players. So why not make a roguelike about dying?

  DeathHack is a silly little robotmeetskitten clone. You are the rogue, and you are tired of life. In a dungeon filled with non-deadly traps, creatures, and items, you must find something with which to end your miserable existence. The fewer turns, the better!
  EOS
  gem.homepage      = "http://github.com/mistydemeo/deathhack"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = ['deathhack']
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "deathhack"
  gem.require_paths = ["lib"]
  gem.version       = DeathHack::VERSION
end
