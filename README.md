js-network-monitor
==================

Monitor internet connection with javascript

#### Install with bower

```
$ bower install --save js-network-monitor
```

#### Install with npm

```
$ npm install --save js-network-monitor
```

### Usage

```html
<!-- Compiled JavaScript -->
<script src="bower_components/dist/js-network-monitor.js"></script>

<script>
  var options = {
    url: '/favicon.ico', // default
    timeout: 3000, // default 3 seconds
    sleep_delay: 5000, // default 5 seconds
  };
  var js_network_monitor = new JsNetworkMonitor(options);
  js_network_monitor.on('online', function() {
      console.log('you are online.');
    }
  );
  js_network_monitor.on('offline', function() {
      console.log('you are offline.');
    }
  );
  js_network_monitor.start();
</script>

```
