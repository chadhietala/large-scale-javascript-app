define [], ->

    class Router
        @add: (path, callback) ->
            @routes or= []
            @routes.push {
                path: new RegExp(path.replace(/\//g, "\\/").replace(/:(\w*)/g,"(\\w*)"))
                callback: callback
            }

        @process: ->
            for route in @routes
                params = window.location.pathname.match(route.path)
                if params?
                    route.callback params
                    return
