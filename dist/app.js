(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var Module, infect,
  bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

infect = require("infect");

Module = (function() {
  function Module() {
    this.infect = bind(this.infect, this);
    this.init = bind(this.init, this);
    this.viewModel = bind(this.viewModel, this);
    this.view = bind(this.view, this);
  }

  Module.prototype.view = function(viewName, viewClass) {
    this.viewName = viewName;
    this.viewClass = viewClass;
    if (!!this.viewName && !!this.viewClass) {
      infect.set(this.viewName, this.viewClass);
      return this;
    } else {
      return this.view;
    }
  };

  Module.prototype.viewModel = function(viewModelName, viewModelClass) {
    this.viewModelName = viewModelName;
    this.viewModelClass = viewModelClass;
    if (!!this.viewModelName && !!this.viewModelClass) {
      infect.set(this.viewModelName, this.viewModelClass);
      return this;
    } else {
      return this.viewModel;
    }
  };

  Module.prototype.init = function() {
    this.viewModel = typeof this.viewModelClass === "function" ? new this.viewModelClass() : void 0;
    this.view = new this.viewClass(this.viewModel);
    return this;
  };

  Module.prototype.infect = function(name, infectable) {
    infect.set(name, infectable);
    return this;
  };

  return Module;

})();

module.exports = Module;


},{"infect":undefined}],2:[function(require,module,exports){
"use strict";
var comp, components, infect, m, name,
  hasProp = {}.hasOwnProperty;

m = require("mithril");

infect = require("infect");

components = require("./components/index.coffee");

for (name in components) {
  if (!hasProp.call(components, name)) continue;
  comp = components[name];
  infect.set(name, comp);
}

m.route.mode = "search";

m.route(document.body, "/todo", {
  "/todo": require("./modules/todo/TodoModule.coffee"),
  "/about": require("./modules/about/AboutModule.coffee")
});


},{"./components/index.coffee":3,"./modules/about/AboutModule.coffee":6,"./modules/todo/TodoModule.coffee":10,"infect":undefined,"mithril":undefined}],3:[function(require,module,exports){
module.exports = {
  NavigationModule: require("./navigation/NavigationModule.coffee")
};


},{"./navigation/NavigationModule.coffee":4}],4:[function(require,module,exports){
var Module;

Module = require("../../Module.coffee");

module.exports = new Module().view("NavigationView", require("./NavigationView.coffee")).init();


},{"../../Module.coffee":1,"./NavigationView.coffee":5}],5:[function(require,module,exports){
"use strict";
var NavigationView, m;

m = require("mithril");

NavigationView = (function() {
  function NavigationView(vm) {
    return function() {
      return m("nav", m("a[href='#'][class=brand]", "Demo"), m("input#bmenub.show[type=checkbox]"), m("label.pseudo.button.toggle.burger[for=bmenub]", "Menu"), m("div.menu", m("a.pseudo.button[href='/todo']", {
        config: m.route
      }, "Todo"), m("a.pseudo.button[href='/about']", {
        config: m.route
      }, "About")));
    };
  }

  return NavigationView;

})();

module.exports = NavigationView;


},{"mithril":undefined}],6:[function(require,module,exports){
var Module;

Module = require("../../Module.coffee");

module.exports = new Module().view("AboutView", require("./AboutView.coffee")).init();


},{"../../Module.coffee":1,"./AboutView.coffee":7}],7:[function(require,module,exports){
"use strict";
var AboutView, Klass, infect, m;

m = require("mithril");

infect = require("infect");

Klass = (function() {
  function Klass(vm, $NavigationModule) {
    return function() {
      return m("div", m.component($NavigationModule), m("article.card.row.two-third", m("header", m("h2", "About")), m("div.content", "Hello. Welcome to this great module. It is a very\ngreat module because it tells you all about the great demo. The\ngreat demo was created by Brandon. Thank you for reading this text."), m("footer", m("button.row", "Great!"))));
    };
  }

  return Klass;

})();

AboutView = infect.func(Klass);

AboutView.$infect = ["NavigationModule"];

module.exports = AboutView;


},{"infect":undefined,"mithril":undefined}],8:[function(require,module,exports){
"use strict";
var TodoListModel;

module.exports = TodoListModel = Array;


},{}],9:[function(require,module,exports){
"use strict";
var TodoModel, m;

m = require("mithril");

TodoModel = (function() {
  function TodoModel(data) {
    this.data = data;
    this.description = m.prop(this.data.description);
    this.done = m.prop(false);
  }

  return TodoModel;

})();

module.exports = TodoModel;


},{"mithril":undefined}],10:[function(require,module,exports){
var Module;

Module = require("../../Module.coffee");

module.exports = new Module().viewModel("TodoViewModel", require("./TodoViewModel.coffee")).view("TodoView", require("./TodoView.coffee")).infect("TodoModel", require("./TodoModel.coffee")).infect("TodoListModel", require("./TodoListModel.coffee")).init();


},{"../../Module.coffee":1,"./TodoListModel.coffee":8,"./TodoModel.coffee":9,"./TodoView.coffee":11,"./TodoViewModel.coffee":12}],11:[function(require,module,exports){
"use strict";
var Klass, TodoView, infect, m;

m = require("mithril");

infect = require("infect");

Klass = (function() {
  function Klass(vm, $NavigationModule) {
    return function() {
      return m("div", m.component($NavigationModule), m("article.card.row.two-third", m("header", m("h2", "Todo")), m("div.content", m("input", {
        onchange: m.withAttr("value", vm.description),
        value: vm.description()
      }), m("button.row", {
        onclick: vm.add
      }, "Add"), m("div", vm.list.map(function(task, index) {
        var decor, style;
        decor = task.done() ? "line-through" : "none";
        style = {
          style: {
            textDecoration: decor
          }
        };
        return m("div.row.one", m("label", m("input[type=checkbox]", {
          onclick: m.withAttr("checked", task.done),
          checked: task.done()
        }), m("span.checkable", style, task.description())));
      })))));
    };
  }

  return Klass;

})();

TodoView = infect.func(Klass);

TodoView.$infect = ["NavigationModule"];

module.exports = TodoView;


},{"infect":undefined,"mithril":undefined}],12:[function(require,module,exports){
"use strict";
var Klass, TodoViewModel, infect, m,
  bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

m = require("mithril");

infect = require("infect");

Klass = (function() {
  function Klass($TodoModel, $TodoListModel) {
    this.$TodoModel = $TodoModel;
    this.$TodoListModel = $TodoListModel;
    this.add = bind(this.add, this);
    this.list = new this.$TodoListModel();
    this.description = m.prop("");
  }

  Klass.prototype.add = function() {
    if (this.description()) {
      this.list.push(new this.$TodoModel({
        description: this.description()
      }));
      return this.description("");
    }
  };

  return Klass;

})();

TodoViewModel = infect.func(Klass);

TodoViewModel.$infect = ["TodoModel, TodoViewModel"];

module.exports = TodoViewModel;


},{"infect":undefined,"mithril":undefined}]},{},[2]);
