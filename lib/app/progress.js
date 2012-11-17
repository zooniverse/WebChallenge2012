// Generated by CoffeeScript 1.3.3
(function() {
  var ProgressMeter,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  ProgressMeter = (function(_super) {

    __extends(ProgressMeter, _super);

    ProgressMeter.prototype.base_image = 'url';

    ProgressMeter.prototype.stage_urls = ['url_1', 'url_2', 'url_3'];

    function ProgressMeter(opts) {
      this.setupMeter = __bind(this.setupMeter, this);
      this.el = $(opts.el);
      this.stage = opts.stage || 0;
    }

    ProgressMeter.prototype.setupMeter = function() {
      var img_src, _i, _len, _ref;
      this.el.append('img').attr('src', this.base_image);
      _ref = this.stage_urls;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        img_src = _ref[_i];
        this.el.append('img').attr('src', img_src).hide();
      }
      if (this.stage === 1) {
        this.el.children().get(this.stage).show();
      }
      if (this.stage === 2) {
        this.el.children().get(this.stage).show();
      }
      if (this.stage === 3) {
        return this.el.children().get(this.stage).show();
      }
    };

    return ProgressMeter;

  })(window.App);

  window.App.ProgressMeter = ProgressMeter;

}).call(this);