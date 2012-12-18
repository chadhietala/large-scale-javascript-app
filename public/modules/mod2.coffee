define ['cs!modules/module'], (Module) ->

    class Mod2 extends Module

        init: ->
            @container.html '<p>Hey from Module 2</p>'

            # Register all of the events on the container.
            # Keep your hands off other modules
            @container.on 'click', 'p', @poke

        poke: ->
            alert 'Ouch that really hurt!'
