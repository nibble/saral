# saral/lib/saral.rb
require "saral/version"
require "saral/routing"
require "saral/controller"

module Saral

  # Our code goes here...
  class Application
    def call(env)
      if env['PATH_INFO'] == '/'
        klass, act = CoursesController, :create
      else
        klass, act = get_controller_and_action(env)
      end
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

end
