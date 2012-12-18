define ['cs!modules/module'], (Module) ->

    class Mod2 extends Module

        init: ->
            @container.html '<p>Hey from Module 2</p>'

            # Register any event handlers
            @container.on 'click', 'p', @poke

        poke: ->
            alert 'Ouch that really hurt!'
