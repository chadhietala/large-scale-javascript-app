define ['cs!modules/module'], (Module) ->

    class Mod1 extends Module

        init: ->
            @container.text 'Hello from Module 1'