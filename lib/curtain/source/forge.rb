module Curtain
  module Source
    class Forge
      def initialize(options)
        @package = options['package']
        @name = options['name'] || options['package']
        @version = options['version']
      end

      def install
        install_module
      end

    private

      def path
        "modules/#{@name}"
      end

      def module_tool(command)
        out = %x{puppet-module #{command}}
        out
      end

      def install_module
        FileUtils.mkdir_p(File.dirname(path))
        Dir.chdir(File.dirname(path)) do
          if @version.nil?
            module_tool "install #{@name} --force"
          else
            module_tool "install #{@name} --force --version #{@version}"
          end

          unless @name == @package
            FileUtils.mv(@package, @name)
          end
        end
      end
    end
  end
end
