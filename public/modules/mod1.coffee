define ['cs!modules/module', 'cs!core/core'], (Module, Core) ->

    class Mod1 extends Module

        init: ->
            @setDefault()

            # Simulating a module dieing at runtime and restarting the module
            if @restarted
                setDefault()
            else
                throw new Error 'Oh snap something happened.  Lets try to restart.'

        setDefault: ->
            setTimeout =>
                @container.text "Hello from Module 1"
                @container.css
                    background: 'white'
            , 2000

        destroy: ->
            @container.text 'Opps I died... trying to restart'
            @container.css
                background: 'red'