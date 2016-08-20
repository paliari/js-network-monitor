class JsNetworkMonitor
  constructor: (options) ->
    @_options = {url: '/favicon.ico', timeout: 3000, sleep_delay: 5000}
    @_options[k] = options[k] for k of options if options
    @_events = {}

  start: ->
    @_xhttpCreate()
    @stop()
    @interval = setInterval (=> @_check()), @_options.sleep_delay
    @

  stop: ->
    clearInterval @interval if @interval
    @

  on: (type, callback) ->
    @_events[type] = callback

  isOnline: ->
    @status is 'online'

  _xhttpCreate: ->
    @xhttp = new XMLHttpRequest()
    @xhttp.timeout = @_options.timeout
    @xhttp.onload = => @_checkEnd 'online'
    @xhttp.onerror = => @_checkEnd 'offline'
    @xhttp.ontimeout = => @_checkEnd 'offline'

  _check: ->
    @xhttp.open 'OPTIONS', "#{@_options.url}?t=#{Date.now()}"
    @xhttp.send()

  _checkEnd: (status) ->
    changed = status != @status
    @status = status
    if @status and changed
      @_events[status]() if @_events[status]
