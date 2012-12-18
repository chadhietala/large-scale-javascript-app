define ['cs!core/core'
    'cs!core/router'
    'cs!modules/index'
    'jquery'
], (Core, Router, Modules, $) ->

    # Register the global level modules
    Core.register 'globalMod', Modules.global

    # Register the modules with the core
    home = ->
        Core.register 'mod1', Modules.mod1
        Core.register 'mod2', Modules.mod2

    # Set the path in which we want to execute on
    Router.add '/home', home

    # Process the paths on ready and start
    $ ->
        Router.process()
        Core.startAll()

     

