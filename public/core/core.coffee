define [], ->
    modules = {}

    # Returns a module Object
    getModule = (moduleName) ->
        modules[moduleName]

    # Registers a module to the core and setup it's container
    register = (moduleName, module) ->
        unless modules[moduleName] and typeof module is 'function'

            if $("##{moduleName}").length > 0
                container = $("##{moduleName}")
            else
                container = null

            instance = new module(moduleName)

            modules[moduleName] = 
                instance: instance
                container: container
        else
            return true

    # Starts a module up by calling it's init function
    start = (moduleName, args...) ->
        module = modules[moduleName]
        if module and typeof module.instance is 'object'
            if module.instance and typeof module.instance.init is 'function'
                module.instance.init args...
            return module.instance
        else
            throw new Error ("Module #{moduleName} could not be started.")

    # Stops a module, but does not delete it
    stop = (moduleName) ->
        module = modules[moduleName]
        if module and module.instance
            modules[moduleName].instance.destroy() if typeof module.instance.destroy is 'function'
            module.instance = null

    # Convience method to start all the register modules
    startAll = ->
        for module of modules
            start module if modules.hasOwnProperty(module)

    # Convience method to stop all the register modules
    stopAll = ->
        for module of modules
            stop module if modules.hasOwnProperty(module)

    # Stops a module then deletes it from the core
    deleteModule = (moduleName) ->
        stop moduleName
        modules[moduleName] = null
        delete modules[moduleName]

    # Convience method for deleting all registered modules
    deleteAll = ->
        for module of modules
            deleteModule module if modules.hasOwnProperty(module)

    # Return the Core API
    return {
        getModule: getModule
        register: register
        start: start
        stop: stop
        deleteModule: deleteModule
        startAll: startAll
        stopAll: stopAll
        deleteAll: deleteAll
        modules: modules
    }
