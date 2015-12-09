$(document).ready(function(){
  // function CanvAnimation( cc, width, height, tang, numOfLines, ss, aa, bb, xx, yy, _xx, _yy, _ttang = 1/60) {
  //   this.c = cc;
  //   this.w = width;
  //   this.h = height;
  //   this.t = tang;
  //   this.num = numOfLines;
  //   this.s = ss;
  //   this.a = aa;
  //   this.b = bb;
  //   this.x = xx;
  //   this.y = yy;
  //   this._x = _xx;
  //   this._y = _yy;
  //   this._tang = _ttang;
  //
  //
  //
  // }
  //
  var c = document.getElementById('canv'),
    $ = c.getContext('2d'),
    w = c.width = document.getElementById("header_logo").offsetWidth,
    h = c.height = document.getElementById("header_logo").offsetHeight,
    t = 0, num = 1550,
    s, a, b,
    x, y, _x, _y,
    _t = 1 / 300;

  var anim = function() {
    $.fillStyle = 'rgba(151,151,151, 0.056)';
    $.fillRect(0, 0, w, h);
    for (var i = 0; i < 1; i++) {
      x = 0;
      $.beginPath();
      for (var j = 0; j < num; j++) {
        x += .6 * Math.sin(15);
        y = x * Math.sin(i + 3.0 * t + x /20)/.5;
        _x = x * Math.cos(b) - y * Math.sin(b);
        _y = x * Math.sin(b) + y * Math.cos(b);
        b = (j) * Math.PI / 2.0;
        $.lineWidth = .2;
        $.lineTo(w / 2- _x, h / 2 -_y);
      }
      $.strokeStyle = 'rgba(0,0,0,.7)';
      $.stroke();
    }
    t += _t;
    window.requestAnimationFrame(anim);
  };
  anim();

  window.addEventListener('resize', function() {
    c.width = w = document.getElementById("header_logo").offsetWidth;
    c.height = h = document.getElementById("header_logo").offsetHeight;
  }, false);

})
