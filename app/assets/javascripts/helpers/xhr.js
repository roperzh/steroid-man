SteroidMan.xhr = function(options) {
  var url = options.url || "/",
    method = options.method || "GET";

  var req = new XMLHttpRequest();

  var handler = function() {
    if(req.readyState === 4) {
      if(req.status === 200) {
        options.success(req);
      } else {
        options.error(req);
      }
    }
  }

  req.onreadystatechange = handler;
  req.open(method, url, true);
  req.send(null);
};
