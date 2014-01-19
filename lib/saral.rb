require "saral/version"

module Saral

  class Application
    def call(env)
      [200, {'Content-Type' => 'text/html'}, ["Hello from the Saral framework!"]]
    end
  end

end
