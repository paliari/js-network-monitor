class JsNetworkMonitor
  constructor: (options) ->
    @options = {url: '/favicon.ico', timeout: 3000, sleep_delay: 5000}
    @options[k] = options[k] for k of options if options
    @_events = {}
