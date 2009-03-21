var current_inspect = '';
function SubmitAnswer(ref, answer) {
 $('btnSubmit').update("Please wait..");
  new Ajax.Request('/quiz/check_answer/?answer=' + answer + '&ref=' + ref, {asynchronous:true, onComplete:function(){$('btnSubmit').update("<img src='/images/icons/accept.png'/> Submit Quiz");}, parameters:Form.serialize('tokens')});
}
function InspectorWindow(params, id) {
  if (current_inspect != '') {
    $(current_inspect).setStyle({ border:'none'});
  }
  $(id).setStyle({ border:'1px dashed #173A7A'});
  current_inspect = id;
  if (typeof(newwindow) == 'undefined') {
    newwindow=window.open('/quiz/review_inspector/' + params,'Question Inspector','height=400,width=400,resizable=no,menubar=no,location=no,toolbar=yes');
  } else {
      newwindow=window.open('/quiz/review_inspector/' + params,'Question Inspector','height=400,width=400,resizable=no,menubar=no,location=no,toolbar=yes');
  }
  window.blur();
  newwindow.focus();
}