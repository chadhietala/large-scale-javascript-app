define ['cs!modules/mod1'
    'cs!modules/mod2'
    'cs!modules/global'
], (Mod1, Mod2, Global) ->

    # Provide our available modules so the can
    # be started by the router
    return {
        mod1: Mod1
        mod2: Mod2
        global: Global
    }