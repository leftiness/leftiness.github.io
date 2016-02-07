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
var commons, comp, components, infect, m, name,
  hasProp = {}.hasOwnProperty;

m = require("mithril");

infect = require("infect");

components = require("./components/index.coffee");

commons = require("./common/index.coffee");

for (name in components) {
  if (!hasProp.call(components, name)) continue;
  comp = components[name];
  infect.set(name, comp);
}

for (name in commons) {
  if (!hasProp.call(commons, name)) continue;
  comp = commons[name];
  infect.set(name, comp);
}

m.route.mode = "search";

m.route(document.body, "/todo", {
  "/todo": require("./modules/todo/TodoModule.coffee"),
  "/about": require("./modules/about/AboutModule.coffee")
});


},{"./common/index.coffee":3,"./components/index.coffee":5,"./modules/about/AboutModule.coffee":8,"./modules/todo/TodoModule.coffee":12,"infect":undefined,"mithril":undefined}],3:[function(require,module,exports){
module.exports = {
  TransitionFactory: require("./services/TransitionFactory.coffee")
};


},{"./services/TransitionFactory.coffee":4}],4:[function(require,module,exports){
var Klass, transition;

transition = require("mithril-transition");

Klass = (function() {
  function Klass() {}

  Klass.prototype.create = function(intro, outro) {
    return transition({
      anim: function(lastEl, newEl, dir, cbLast, cbNew) {
        var events;
        events = ["webkitAnimationEnd", "mozAnimationEnd", "MSAnimationEnd", "oanimationend", "animationend"];
        events.map(function(event) {
          var handler;
          lastEl.addEventListener(event, handler = function(e) {
            e.target.removeEventListener(e.type, handler);
            cbLast();
          });
          newEl.addEventListener(event, handler = function(e) {
            e.target.removeEventListener(e.type, handler);
            newEl.classList.remove(intro);
            cbNew();
          });
        });
        lastEl.classList.add(outro);
        newEl.classList.add(intro);
      }
    });
  };

  return Klass;

})();

module.exports = new Klass();


},{"mithril-transition":undefined}],5:[function(require,module,exports){
module.exports = {
  NavigationModule: require("./navigation/NavigationModule.coffee")
};


},{"./navigation/NavigationModule.coffee":6}],6:[function(require,module,exports){
var Module;

Module = require("../../Module.coffee");

module.exports = new Module().view("NavigationView", require("./NavigationView.coffee")).init();


},{"../../Module.coffee":1,"./NavigationView.coffee":7}],7:[function(require,module,exports){
"use strict";
var NavigationView, m;

m = require("mithril");

NavigationView = (function() {
  function NavigationView(vm) {
    return function() {
      return m("nav", (function() {
        return [].concat(m("a[href='#'][class=brand]", "Demo")).concat(m("input#bmenub.show[type=checkbox]")).concat(m("label.pseudo.button.toggle.burger[for=bmenub]", "Menu")).concat(m("div.menu", (function() {
          return [].concat(m("a.pseudo.button[href='/todo']", {
            config: m.route
          }, "Todo")).concat(m("a.pseudo.button[href='/about']", {
            config: m.route
          }, "About"));
        })()));
      })());
    };
  }

  return NavigationView;

})();

module.exports = NavigationView;


},{"mithril":undefined}],8:[function(require,module,exports){
var Module;

Module = require("../../Module.coffee");

module.exports = new Module().view("AboutView", require("./AboutView.coffee")).init();


},{"../../Module.coffee":1,"./AboutView.coffee":9}],9:[function(require,module,exports){
"use strict";
var AboutView, Klass, infect, m;

m = require("mithril");

infect = require("infect");

Klass = (function() {
  function Klass(vm, Nav, Trans) {
    var anim;
    anim = Trans.create("pt-page-moveFromRight", "pt-page-moveToLeft");
    return function() {
      return m("div", (function() {
        return [].concat(m.component(Nav)).concat(m("div", m(".pt-page", {
          key: m.route(),
          config: anim
        }, m("article.card.row.two-third", (function() {
          return [].concat(m("header", m("h2", "About"))).concat(m("div.content", "Hello. Welcome to this great module. It is a very\ngreat module because it tells you all about the great demo. The\ngreat demo was created by Brandon. Thank you for reading this text.")).concat(m("footer", m("button.row", "Great!")));
        })()))));
      })());
    };
  }

  return Klass;

})();

AboutView = infect.func(Klass);

AboutView.$infect = ["NavigationModule", "TransitionFactory"];

module.exports = AboutView;


},{"infect":undefined,"mithril":undefined}],10:[function(require,module,exports){
"use strict";
var TodoListModel;

module.exports = TodoListModel = Array;


},{}],11:[function(require,module,exports){
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


},{"mithril":undefined}],12:[function(require,module,exports){
var Module;

Module = require("../../Module.coffee");

module.exports = new Module().viewModel("TodoViewModel", require("./TodoViewModel.coffee")).view("TodoView", require("./TodoView.coffee")).infect("TodoModel", require("./TodoModel.coffee")).infect("TodoListModel", require("./TodoListModel.coffee")).init();


},{"../../Module.coffee":1,"./TodoListModel.coffee":10,"./TodoModel.coffee":11,"./TodoView.coffee":13,"./TodoViewModel.coffee":14}],13:[function(require,module,exports){
"use strict";
var Klass, TodoView, infect, m;

m = require("mithril");

infect = require("infect");

Klass = (function() {
  function Klass(vm, Nav, Trans) {
    var anim;
    anim = Trans.create("pt-page-moveFromRight", "pt-page-moveToLeft");
    return function() {
      return m("div", (function() {
        return [].concat(m.component(Nav)).concat(m("div", m(".pt-page", {
          key: m.route(),
          config: anim
        }, m("article.card.row.two-third", (function() {
          return [].concat(m("header", m("h2", "Todo"))).concat(m("div.content", (function() {
            return [].concat(m("input", {
              onchange: m.withAttr("value", vm.description),
              value: vm.description()
            })).concat(m("button.row", {
              onclick: vm.add
            }, "Add")).concat(m("div", vm.list.map(function(task, index) {
              var decor, style;
              decor = task.done() ? "line-through" : "none";
              style = {
                style: {
                  textDecoration: decor
                }
              };
              return m("div.row.one", m("label", (function() {
                return [].concat(m("input[type=checkbox]", {
                  onclick: m.withAttr("checked", task.done),
                  checked: task.done()
                })).concat(m("span.checkable", style, task.description()));
              })()));
            })));
          })()));
        })()))));
      })());
    };
  }

  return Klass;

})();

TodoView = infect.func(Klass);

TodoView.$infect = ["NavigationModule", "TransitionFactory"];

module.exports = TodoView;


},{"infect":undefined,"mithril":undefined}],14:[function(require,module,exports){
"use strict";
var Klass, TodoViewModel, infect, m,
  bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

m = require("mithril");

infect = require("infect");

Klass = (function() {
  function Klass(Todo, TodoList) {
    this.Todo = Todo;
    this.TodoList = TodoList;
    this.add = bind(this.add, this);
    this.list = new this.TodoList();
    this.description = m.prop("");
  }

  Klass.prototype.add = function() {
    if (this.description()) {
      this.list.push(new this.Todo({
        description: this.description()
      }));
      return this.description("");
    }
  };

  return Klass;

})();

TodoViewModel = infect.func(Klass);

TodoViewModel.$infect = ["TodoModel", "TodoListModel"];

module.exports = TodoViewModel;


},{"infect":undefined,"mithril":undefined}]},{},[2]);
