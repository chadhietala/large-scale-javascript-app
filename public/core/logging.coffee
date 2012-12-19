define ['cs!core/pubsub'], (PubSub) ->

    class Log

        # Allow for a debug mode to be set
        @_debug: true

        # Traps errors in the module in which
        # they occured.
        @catch: (instance, moduleName) ->
            for name of instance
                method = instance[name]
                if typeof method is 'function'
                    instance[name] = ((name, method) ->
                        ->
                            try
                                return method.apply(this, arguments)
                            catch e
                                PubSub.publish 'restart', {module: moduleName}
                    )(name, method)

        # Custom logging method that either logs errors to the console or 
        # can easily send messages to the server
        @log: (severity, message...) ->
            if @_debug
                console[(if (severity is 1) then "log" else (if (severity is 2) then "warn" else "error"))](message)
            else
                # Actually send to the server
                console.log "Sent #{message} to server"