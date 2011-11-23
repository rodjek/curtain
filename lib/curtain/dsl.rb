module Curtain
  class Dsl
    def self.evaluate(modulefile)
      builder = new
      builder.instance_eval(File.read(modulefile.to_s))
      builder.to_definition
    end

    def initialize
      @sources = []
    end

    def to_definition
      @sources
    end

    def git(uri, options = {})
      source Source::Git.new(options.merge({'uri' => uri}))
    end

    def forge(package, options = {})
      source Source::Forge.new(options.merge({'package' => package}))
    end

  private

    def source(obj)
      @sources << obj
    end
  end
end
