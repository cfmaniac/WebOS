function textCounter(field, countfield, maxlimit) {
if (field.value.length > maxlimit) 
field.value = field.value.substring(0, maxlimit);
else 
countfield.value = maxlimit - field.value.length;
}

function stripHTML(){
var re= /<\S[^><]*>/g
for (i=0; i<arguments.length; i++)
arguments[i].value=arguments[i].value.replace(re, "")
}
