'use strict';

var keys = [];
var cmd = ['cmd'];
var ctrlShift = ['ctrl', 'shift'];

var grids = {
    '1 Up': {rows: 1, cols: 1},
    '2 Up': {rows: 1, cols: 2},
    '3 Up': {rows: 1, cols: 3},
    '4 Up': {rows: 2, cols: 2},
    '6 Up': {rows: 2, cols: 3},
    '9 Up': {rows: 3, cols: 3},
};

function center() {
    if (Window.recent().length == 0) {
        return;
    }
    var window = Window.recent()[0];
    var screenFrame = Screen.main().visibleFrameInRectangle();
    var width = 2 * screenFrame.width / 3;
    var remainingScreenWidth = screenFrame.width - width;
    var height = 2 * screenFrame.height / 3;
    var remainingScreenHeight = screenFrame.height - height;

    var rect = {x: remainingScreenWidth / 2, y: remainingScreenHeight / 2, width: width, height: height};
    window.setFrame(rect);
}

function grid(name) {
    var rows = grids[name].rows;
    var cols = grids[name].cols;
    return function applyGrid() {
	var windows = Window.recent();
	windows.splice(Math.min(windows.length, cols*rows));
	var pre = windows.length;
	var sFrame = Screen.main().visibleFrameInRectangle();
	var width = Math.round(sFrame.width / cols);
	var height = Math.round(sFrame.height / rows);

	var x = sFrame.x;
	var y = sFrame.y;
	_.times(cols, function(col) {
		_.times(rows, function(row) {
			var n = col + (row*cols);
			var rect = {x: x + (col*width), y: y + (row*height), width: width, height: height};
			if (windows.length > n) {
			    windows[n].setFrame(rect);
			}
		    });
	    });
    };
}

keys.push(new Key('1', ctrlShift, grid('1 Up')));
keys.push(new Key('2', ctrlShift, grid('2 Up')));
keys.push(new Key('3', ctrlShift, grid('3 Up')));
keys.push(new Key('4', ctrlShift, grid('4 Up')));
keys.push(new Key('6', ctrlShift, grid('6 Up')));
keys.push(new Key('9', ctrlShift, grid('9 Up')));
keys.push(new Key('c', ctrlShift, center));

function moveFocusFn(dir) {
  return function moveFocus() {
    var fnNames = {
      a: 'focusClosestWindowInWest',
      s: 'focusClosestWindowInSouth',
      w: 'focusClosestWindowInNorth',
      d: 'focusClosestWindowInEast'
    };
    Window.focused()[fnNames[dir]]();
  };
}

keys.push(new Key('a', ctrlShift, moveFocusFn('a')));
keys.push(new Key('s', ctrlShift, moveFocusFn('s')));
keys.push(new Key('w', ctrlShift, moveFocusFn('w')));
keys.push(new Key('d', ctrlShift, moveFocusFn('d')));

function showCenteredModal(message, offset) {
  var m = new Modal();
  m.duration = 0.5;
  m.message = message;

  var sFrame = Screen.main().visibleFrameInRectangle();
  var mFrame = m.frame();

  var mX = Math.round((sFrame.width / 2) - (mFrame.width / 2));
  var mY = Math.round((sFrame.height / 2) - (mFrame.height / 2));
  if (!offset) {
    offset = {x: 0, y: 0};
  }

  m.origin = {x: sFrame.x + mX + offset.x, y: sFrame.y + mY + offset.y};
  m.show();
}


