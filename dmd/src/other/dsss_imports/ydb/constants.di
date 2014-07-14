
// Written in the D programming language.

/*******************************************************************************
        
        copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        author:         yidabu ( D China : http://bbs.d-programming-language-china.org )

*******************************************************************************/


module ydb.constants;

//  mixin(ydbUrls)
const char[] ydburls = `
    char[][char[]] ydbUrls;
    ydbUrls["一大步网站"] = "http://www.d-programming-language-china.org
    ydbUrls["一大步社区"] = "http://bbs.d-programming-language-china.org
    ydbUrls["最好的软件"] = "http://bbs.d-programming-language-china.org
    ydbUrls["Excel  论坛"] = "http://bbs.d-programming-language-china.org
    ydbUrls["AutoIt 论坛"] = "http://bbs.d-programming-language-china.org
    ydbUrls["D语言 文档"] = "http://bbs.d-programming-language-china.org
`;

const char[] mainUrl="http://www.d-programming-language-china.org
const char[] bbsUrl="http://bbs.d-programming-language-china.org
const char[] hostUrl="bbs.d-programming-language-china.org
const char[] coreUrl="yidabu";

   // if have charset meta, the url will be about:blank, so must use mbs charset of content
    //<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	char[] htmlHead = `
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>一大步成功社区 http://www.d-programming-language-china.org
<script type="text/javascript" language="javascript">
function copycode(obj) {
	var rng = document.body.createTextRange();
	rng.moveToElementText(obj);
	rng.scrollIntoView();
	rng.select();
	rng.execCommand("Copy");
	rng.collapse(false);
}
function imgzoom(o) {
	if(event.ctrlKey) {
		var zoom = parseInt(o.style.zoom, 10) || 100;
		zoom -= event.wheelDelta / 12;
		if(zoom > 0) {
			o.style.zoom = zoom + '%';
		}
		return false;
	} else {
		return true;
	}
}
function $(id) {
	return document.getElementById(id);
}

function getcookie(name) {
	var cookie_start = document.cookie.indexOf(name);
	var cookie_end = document.cookie.indexOf(";", cookie_start);
	return cookie_start == -1 ? '' : unescape(document.cookie.substring(cookie_start + name.length + 1, (cookie_end > 

cookie_start ? cookie_end : document.cookie.length)));
}

function setcookie(cookieName, cookieValue, seconds, path, domain, secure) {
	var expires = new Date();
	expires.setTime(expires.getTime() + seconds);
	document.cookie = escape(cookieName) + '=' + escape(cookieValue)
		+ (expires ? '; expires=' + expires.toGMTString() : '')
		+ (path ? '; path=' + path : '/')
		+ (domain ? '; domain=' + domain : '')
		+ (secure ? '; secure' : '');
}
function isUndefined(variable) {
	return typeof variable == 'undefined' ? true : false;
}
function toggle_collapse(objname, unfolded) {
	if(isUndefined(unfolded)) {
		var unfolded = 1;
	}
	var obj = $(objname);
	var oldstatus = obj.style.display;
	var collapsed = getcookie('discuz_collapse');
	var cookie_start = collapsed ? collapsed.indexOf(objname) : -1;
	var cookie_end = cookie_start + objname.length + 1;

	obj.style.display = oldstatus == 'none' ? '' : 'none';
	collapsed = cookie_start != -1 && ((unfolded && oldstatus == 'none') || (!unfolded && oldstatus == '')) ?
			collapsed.substring(0, cookie_start) + collapsed.substring(cookie_end, collapsed.length) : (
			cookie_start == -1 && ((unfolded && oldstatus == '') || (!unfolded && oldstatus == 'none')) ?
			collapsed + objname + ' ' : collapsed);

	setcookie('discuz_collapse', collapsed, (collapsed ? 86400 * 30 : -(86400 * 30 * 1000)));

	if(img = $(objname + '_img')) {
		var img_regexp = new RegExp((oldstatus == 'none' ? '_yes' : '_no') + '\\.gif$');
		var img_re = oldstatus == 'none' ? '_no.gif' : '_yes.gif';
		img.src = img.src.replace(img_regexp, img_re);
	}
	if(symbol = $(objname + '_symbol')) {
		symbol.innerHTML = symbol.innerHTML == '+' ? '-' : '+';
	}
}

function attachimg(obj, action, text) {
	if(action == 'load') {
		if(obj.width > screen.width * 0.7) {
			obj.resized = true;
			obj.width = screen.width * 0.7;
			obj.alt = text;
		}
		obj.onload = null;
	} else if(action == 'mouseover') {
		if(obj.resized) {
			obj.style.cursor = 'pointer';
		}
	} else if(action == 'click') {
		if(!obj.resized) {
			return false;
		} else {
			window.open(text);
		}
	}
}

function attachimginfo(obj, infoobj, show, event) {
	var left_offset = obj.offsetLeft;
	var top_offset = obj.offsetTop;
	var width_offset = obj.offsetWidth;
	var height_offset = obj.offsetHeight;
	while ((obj = obj.offsetParent) != null) {
		left_offset += obj.offsetLeft;
		top_offset += obj.offsetTop;
	}
	if(show) {
		$(infoobj).style.position = 'absolute';
		$(infoobj).style.left = left_offset + 3;
		$(infoobj).style.top = height_offset < 40 ? top_offset + height_offset : top_offset + 3;
		$(infoobj).style.display = '';
	} else {
		if(is_ie) {
			$(infoobj).style.display = 'none';
			return;
		} else {
			var mousex = document.body.scrollLeft + event.clientX;
			var mousey = document.body.scrollTop + event.clientY;
			if(mousex < left_offset || mousex > left_offset + width_offset || mousey < top_offset || mousey > 

top_offset + height_offset) {
				$(infoobj).style.display = 'none';
			}
		}
	}
}


</script>

<style type="text/css">
html,body {margin:0;padding:0;width:100%;height:100%; }
body { text-align:center; background:#F7F7F7;color: #333;font: 13px Arial, Helvetica, sans-serif;}
a {color: #154BA0;text-decoration: none;}
a:hover {text-decoration: underline;color: #000098; }
a:visited {color: #666;}
p {margin:0;padding-bottom:10px;}
code{font-weight:bold;}
.msgbody{overflow: hidden;width: auto !important;width: 100%;}
.msgheader{margin:0 2em;font-weight: bold;background: #F3F8D7;padding: 5px;color: #000000}
.msgborder{margin: 0 2em;padding: 10px;border: 1px solid #DEDEB8;word-break: break-all;background: #FDFFF2;overflow: hidden;}
.right{float: right;text-align: right;padding: 0px;}
.smalltxt{font:12px Arial, Tahoma}
</style>
</head>
<body>
<!--wrap--><div id="wrap">
`;

	char[] htmlFoot = `
</div><!--/wrap-->
</body>
</html>
`;	
version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
