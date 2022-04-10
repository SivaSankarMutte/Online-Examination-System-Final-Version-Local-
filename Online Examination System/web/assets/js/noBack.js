function preventBack()
{
    window.history.forward();
    window.history.forward();
}
setTimeout("preventBack()",0);
window.onunload=function(){null;};

