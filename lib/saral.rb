# saral/lib/saral.rb
require "saral/version"
require "saral/routing"
require "saral/controller"

module Saral

  # Our code goes here...
  class Application
    def call(env)
      begin
        if env['PATH_INFO'] == '/'
          klass, act = CoursesController, :create
        else
          klass, act = get_controller_and_action(env)
        end
      rescue NameError => e
        return [404, {'Content-Type' => 'text/html'}, ["Sorry! Page not found."]]
      end
      controller = klass.new(env)
      text = controller.send(act)
      [202, {'Content-Type' => 'text/html'}, [text]]
    end
  end

end
