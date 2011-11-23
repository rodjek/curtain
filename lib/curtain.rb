require 'fileutils'
require 'curtain/source/git'
require 'curtain/dsl'

module Curtain
  def self.install(file)
    Dsl.evaluate(file).each do |source|
      source.install
    end
  end
end
