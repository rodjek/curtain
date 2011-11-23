# Curtain

Really basic proof of concept for a bundler type system for Puppet modules.
Heavily inspired by Bundler (obviously).

## Modulefile

```ruby
git 'git://github.com/puppetlabs/puppetlabs-stdlib.git', 'name' => 'stdlib',
'tag' => 'v2.2.0'
forge 'puppetlabs-apache'
```

```ruby
require 'curtain'
Curtain.install('Modulefile')
```

## Caveats

This is a proof of concept only.  There are no tests and there is no error
checking to speak of.
