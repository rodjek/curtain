module Curtain
  module Source
    class Git
      def initialize(options)
        @uri = options['uri']
        @ref = options['ref'] || options['branch'] || options['tag'] || 'master'
        @name = options['name'] || name_from_uri
      end

      def install
        checkout
      end

    private

      def path
        "modules/#{@name}"
      end

      def name_from_uri
        File.basename(@uri, '.git')
      end

      def git(command)
        out = %x{git #{command}}
        out
      end

      def checkout
        unless File.exist?(path)
          FileUtils.mkdir_p(File.dirname(path))
          git "clone #{@uri} #{path}"
        end
        Dir.chdir(path) do
          git "fetch --force --quiet --tags"
          git "reset --hard #{@ref}"
        end
      end
    end
  end
end
