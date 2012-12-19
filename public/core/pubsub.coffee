define [], ->

    class PubSub
        @topics: {}

        @publish: (topic, data) ->
            return false unless @topics[topic]

            setTimeout =>
                subscribers = @topics[topic]
                len = if subscribers then subscribers.length else 0

                while len--
                    subscribers[len].func topic, data
            , 0

            return true

        @subscribe: (topic, func) ->
            @topics[topic] = [] unless @topics[topic]

            @topics[topic].push
                func: func

            return true