var width_of_object = 190;
var height_of_object = 190;
var names = document.getElementsByName('authenticity_token');
var auth = names[0].value;
var quiz_ref = $('quiz_ref').value;
var current_inspect = '';
var ref = '';
function LibraryItem(ref, quiz) {
  new Ajax.Updater('itemcanvas', '/quiz/add_item/' + quiz + '?ref=' + ref, {asynchronous:true, parameters:Form.serialize('authenticity'), evalScripts:true, method:'GET', insertion:Insertion.Bottom});
}
function H2InPlace(ref) {
   new Ajax.InPlaceEditor('h2_' + ref, '/quiz/edit_text/' + ref + '?authenticity_token=' + auth + '&quiz_ref=' + quiz_ref, {cols:45, cancelControl:'false', highlightcolor:'#C9E2FB', submitOnBlur:'true'});
}
function TXTInPlace(ref) {
   new Ajax.InPlaceEditor('txt_' + ref, '/quiz/edit_text/' + ref + '?authenticity_token=' + auth + '&quiz_ref=' + quiz_ref, {rows:3, cols:50, cancelControl:'false', highlightcolor:'#C9E2FB', submitOnBlur:'true'});
}
function MCInPlace(ref, elem_id) {
   new Ajax.InPlaceEditor('c' + elem_id + '_' + ref, '/quiz/edit_choice/' + ref + '?authenticity_token=' + auth + '&quiz_ref=' + quiz_ref + '&number=' + elem_id, {size:45, cancelControl:'false', highlightcolor:'#C9E2FB', submitOnBlur:'true'});
}
function MCInPlaceSize(ref, elem_id, size) {
   new Ajax.InPlaceEditor('c' + elem_id + '_' + ref, '/quiz/edit_choice/' + ref + '?authenticity_token=' + auth + '&quiz_ref=' + quiz_ref + '&number=' + elem_id, {size:size, cancelControl:'false', highlightcolor:'#C9E2FB', submitOnBlur:'true'});
}
function MCInPlaceMod(ref, elem_id, size, id) {
   new Ajax.InPlaceEditor('c' + elem_id + '_' + ref, '/quiz/edit_choice/' + ref + '?authenticity_token=' + auth + '&quiz_ref=' + quiz_ref + '&number=' + elem_id, {size:size, ajaxOptions:{onComplete:function(){ReloadItem(id)}}, cancelControl:'false', highlightcolor:'#C9E2FB', submitOnBlur:'true'});
}
function Answer(ref, answer) {
 new Ajax.Request('/quiz/assign_answer/' + ref + '?answer=' + answer + '&quiz_ref=' + quiz_ref, {asynchronous:true, parameters:Form.serialize('authenticity')});
}
function Inspect(id) {
  if (current_inspect != '') {
    $(current_inspect).setStyle({ border:'none'});
  } 
  $(id).setStyle({ border:'1px dashed #173A7A'});
  current_inspect = id;
  new Ajax.Updater('inspected', '/quiz/inspect/' + id, {asynchronous:true, evalScripts:true, parameters:Form.serialize('authenticity')});
}
function ReloadItem(id) {
  new Ajax.Updater('item_' + id, '/quiz/item/' + id, {asynchronous:true, parameters:Form.serialize('authenticity'), evalScripts:true});
  Inspect("item_" + id)
}
  function scaleIt(v, id) {
  var scalePhotos = document.getElementsByClassName('scale-image' + id);
  floorSize = .26;
  ceilingSize = 1.0;
  v = floorSize + (v * (ceilingSize - floorSize));
  for (i=0; i < scalePhotos.length; i++) {
    scalePhotos[i].style.width = (v*width_of_object)+'px';
    scalePhotos[i].style.height = (v*height_of_object)+'px';
  }
}
function OriginalWidth(ref, width) {
  new Ajax.Request('/quiz/edit_choice/' + ref + '?authenticity_token=' + auth + '&quiz_ref=' + quiz_ref + '&number=3', {asynchronous:true, parameters:{ value: width }});
}
function OriginalHeight(ref, height) {
  new Ajax.Request('/quiz/edit_choice/' + ref + '?authenticity_token=' + auth + '&quiz_ref=' + quiz_ref + '&number=4', {asynchronous:true, parameters:{ value: height }});
}
function sendWidthAndHeight(id) {
  setTimeout("sendWidthAndHeight('" + id + "')", 3000);
  new Ajax.Request('/quiz/edit_width_and_height/' + id, {asynchronous:true, method:'get', parameters:{ width:Element.getWidth('img' + id), height:Element.getHeight('img' + id)}});
}
