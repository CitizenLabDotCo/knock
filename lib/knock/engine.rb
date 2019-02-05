module Knock
  class Engine < ::Rails::Engine
    # After https://github.com/ngty/knock, commit 97fb32f.
    # This prevents the error "Unable to load application: 
    # NameError: uninitialized constant Generators::Base"
    # upon build.
    if ::Rails.const_defined? 'Generators'
      config.eager_load_paths += Dir["#{config.root}/lib/**/"]
    else
      require_relative './authenticable'
    end
    isolate_namespace Knock
  end
end
