// Generated by CoffeeScript 1.3.3
(function() {
  var Model,
    __slice = [].slice;

  Model = (function() {

    function Model() {}

    Model.prototype.constrcutor = function(opts) {
      return this.id = opts.id;
    };

    Model.prototype.base_url = 'url_here';

    Model.prototype.trigger = function() {
      var args, event;
      event = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      return $(document).trigger(event, args);
    };

    Model.prototype.on = function(event, callback) {
      return $(document).on(event, callback);
    };

    Model.prototype.fetch = $.getJSON("http://" + Model.base_url + "/" + Model.url + "/" + Model.id + ".json", function(data) {
      var key, value, _i, _len;
      for (value = _i = 0, _len = data.length; _i < _len; value = ++_i) {
        key = data[value];
        this[key] = value;
      }
      return this.trigger('fetch', this);
    });

    return Model;

  })();

  window.App.Model = Model;

}).call(this);