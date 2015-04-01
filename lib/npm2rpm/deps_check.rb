module Npm2Rpm
  class DepsCheck
    attr_accessor :metadata, :new_version, :previous_version
    
    def initialize metadata
      @metadata = metadata
      @new_version = @metadata.metadata["dist-tags"]["latest"]
      @previous_version = @metadata.metadata["versions"].keys[@metadata.metadata["versions"].keys.index(@metadata.metadata["dist-tags"]["latest"])-1]
    end
    
    def fedora_version
      #TODO: fetch module version from fedora 
    end
    
    def new_version_deps
        puts "#{@new_version} Deps:"
        puts @metadata.metadata["versions"][@new_version]["dependencies"]
	puts "#{@new_version} DevDeps:"
	puts @metadata.metadata["versions"][@new_version]["devDependencies"]
    end
    
    def previous_verion_deps
        puts "#{@previous_version} Deps:"
        puts @metadata.metadata["versions"][@previous_version]["dependencies"]
	puts "#{@previous_version} DevDeps:"
	puts @metadata.metadata["versions"][@previous_version]["devDependencies"]
    end
    
    def fedora_version_deps
      
    end
    
    def check
    end
  end
end