begin
  require 'rubygems'
  gem 'executioner', '>= 0.2'
rescue LoadError
end
require 'executioner'
require 'fileutils'

module Miso
  class Processor
    class GraphicsMagick < Processor
      def self.available?
        !find_executable('gm').nil?
      end
      
      def crop(width, height)
        dimensions = "#{width}x#{height}"
        operations << "-resize #{dimensions}^ -gravity center -crop #{dimensions}+0+0!"
      end
      
      def fit(width, height)
        operations << "-resize #{width}x#{height}"
      end
      
      def dimensions
        if info = identify(input_file) and match = /\s(\d+)x(\d+)\+/.match(info)
          match.to_a[1..2].map { |d| d.to_i }
        end
      end
      
      def write(output_file)
        options = operations.join(' ')
        operations.clear
        convert(input_file, output_file, options)
      end
      
      include Executioner
      executable :gm
      
      def identify(input_file)
        gm "identify \"#{input_file}\""
      end

      def convert(source_path, output_path, options)
        ensure_output_directory(output_path)
        gm "convert '#{source_path}' #{options} '#{output_path}'"
      end
      
      private
      
      def operations
        @operations ||= []
      end
      
      def ensure_output_directory(path)
        FileUtils.mkdir_p(File.dirname(path))
      end
    end
  end
end