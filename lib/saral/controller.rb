# saral/lib/saral/controller.rb

module Saral

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end

end
