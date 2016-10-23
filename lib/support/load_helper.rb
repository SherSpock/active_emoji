# Helper to facilitate errorlessly loading the classes aliased by ActiveEmoji

# List of files for all ActiveEmoji aliased classes
FILELIST = Dir[File.dirname(__FILE__) + '/active_emoji/core_ext/*.rb']

def load_all_loadable_classes
  # Load aliases for all classes that exist in memory at runtime
  if rails_loaded?
    load_all_classes
  else
    load_all_classes_except 'date.rb'
  end
end



# Constituent methods of load_all_loadable_classes

def rails_loaded?
  # TODO: Extend to accept top-level constants for any library as argument
  defined?(Rails) ? true : false
end

def load_all_classes
  FILELIST.each do |file|
    require file
  end
end

def load_all_classes_except(unwanted_class)
  # TODO: Extend this method to accept an array
  FILELIST.each do |file|
    require file unless file.include? unwanted_class
  end
end
