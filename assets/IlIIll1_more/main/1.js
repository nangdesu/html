
document.addEventListener('DOMContentLoaded', function(){
  var style = `#button {
  display:none;
}
.imgb_vis {
  animation: imgb-animation 15s linear;
}
@keyframes imgb-animation {
  10% {
    transform: translateX(0);
  }
  20% {
    transform: translateX(100px);
  }
  90% {
    transform: translateX(100px);
  }
  100% {
    transform: translateX(0);
  }
}`;
  addStyle(style);

  var div = document.createElement('div');
  div.id = 'button';
  div.className = 'imgb';
  div.style = 'position:fixed;top:10%;left:-100px;z-index:10';
  div.innerHTML = '<a target="_blank" href="https://sites.google.com/view/pizza3x/" title="More of best Unblocked Games"><img src="https://lh4.googleusercontent.com/d/1Ut30AHQrfwHaJY1Gd17XRVxoHPOmOc60" width="100" height="15" style="cursor:pointer;" alt="More Unblocked Gamdes"></a>';
  document.body.appendChild(div);

  var image = document.getElementById('button');
  var i = 0;
  var s = ['block', 'none'];
  var t = [15000, 10000];
  show();

  document.querySelector('.imgb').classList.add('imgb_vis');

  function addStyle(styles) {
    var css = document.createElement('style');
    css.type = 'text/css';

    if (css.styleSheet) {
      css.styleSheet.cssText = styles;
    } else {
      css.appendChild(document.createTextNode(styles));
    }

    document.getElementsByTagName('head')[0].appendChild(css);
  }

  function show() {
    i ^= 1;
    image.style.display = s[i];
    setTimeout(show, t[i]);
  }
});
