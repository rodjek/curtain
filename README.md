# Curtain

Really basic proof of concept for a bundler type system for Puppet modules.
Heavily inspired by Bundler (obviously).

## Modulefile

```ruby
git 'git://github.com/puppetlabs/puppetlabs-stdlib.git', 'name' => 'stdlib',
'tag' => 'v2.2.0'
```

```ruby
require 'curtain'
Curtain.install('Modulefile')
```
