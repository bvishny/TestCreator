var names = document.getElementsByName('authenticity_token');
var auth = names[0].value;
function deleteAttempt(ref) {
  new Ajax.Request('/quiz/delete_taken/' + ref, {asynchronous:true, parameters:{authenticity_token:auth}});
  new Effect.DropOut('row_' + ref);
}
function deleteQuiz(ref) {
  new Ajax.Request('/quiz/delete/' + ref, {asynchronous:true, parameters:{authenticity_token:auth}});
  new Effect.DropOut('row_' + ref);
}