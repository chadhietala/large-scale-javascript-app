define [], ->
    class Module
        constructor: (@moduleName) ->
            @container = $("##{@moduleName}")

        init: ->
            throw new Error 'Your module should have an init that overrides this'