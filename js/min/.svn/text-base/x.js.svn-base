
﻿
function addJavascript(jsname){var th=document.getElementsByTagName('head')[0];var s=document.createElement('script');s.setAttribute('type','text/javascript');s.setAttribute('src',jsname);th.appendChild(s);}
String.prototype.trim=function(){return this.replace(/^\s+|\s+$/g,"");};function setCookie(name,value)
{var argv=setCookie.arguments;var argc=setCookie.arguments.length;var expires=(argc>2)?argv[2]:null;var path=(argc>3)?argv[3]:null;var domain=(argc>4)?argv[4]:null;var secure=(argc>5)?argv[5]:null;document.cookie=escape(name)+"="+escape(value)+
((expires==null)?"":("; expires="+expires.toGMTString()+240))+
((path==null)?"":("; path="+path))+
((domain==null)?"":("; domain="+domain))+
((secure==null)?"":("; secure="+secure));}
function eliminateSpace(str){return str.replace(/[\s]+/g,"");}
function delAllCookie(name){cookieArray=document.cookie.split(";");for(var i=0;i<cookieArray.length;i++){thisCookie=cookieArray[i].split("=");cookieName=eliminateSpace(unescape(thisCookie[0]));cookieValue=eliminateSpace(unescape(thisCookie[1]));if(cookieName!=name){delCookie(cookieName);}}}
function getCookie(name,flag){var arg=escape(name)+"=";var nameLen=arg.length;var cookieLen=document.cookie.length;var i=0;while(i<cookieLen){var j=i+nameLen;if(document.cookie.substring(i,j)==arg)
return getCookieValueByIndex(j);i=document.cookie.indexOf(" ",i)+1;if(i==0)break;}
if(flag){var today=new Date()
var cooval="public"+today.valueOf()+Math.random();setCookie(name,cooval);return cooval;}
else return null;}
function delCookie(name){var exp=new Date();exp.setTime(exp.getTime()-1);var cval=getCookie(name);document.cookie=escape(name)+"="+cval+"; expires="+exp.toGMTString();}
function getCookieValueByIndex(startIndex){var endIndex=document.cookie.indexOf(";",startIndex);if(endIndex==-1)
endIndex=document.cookie.length;return document.cookie.substring(startIndex,endIndex);}
function getParameter(queryString,parameterName){var parameterName=parameterName+"=";if(queryString.length>0){begin=queryString.indexOf(parameterName);if(begin!=-1){begin+=parameterName.length;end=queryString.indexOf("&",begin);if(end==-1){end=queryString.length}
return unescape(queryString.substring(begin,end));}
return"";}}
function getURLParam(strParamName){var strReturn="";var strHref=window.location.href;if(strHref.indexOf("?")>-1){var strQueryString=strHref.substr(strHref.indexOf("?")).toLowerCase();var aQueryString=strQueryString.split("&");for(var iParam=0;iParam<aQueryString.length;iParam++){if(aQueryString[iParam].indexOf(strParamName.toLowerCase()+"=")>-1){var aParam=aQueryString[iParam].split("=");strReturn=aParam[1];break;}}}
return unescape(strReturn);}
function IsNumeric(sText)
{var ValidChars="0123456789";var IsNumber=true;var Char;for(i=0;i<sText.length&&IsNumber==true;i++)
{Char=sText.charAt(i);if(ValidChars.indexOf(Char)==-1)
{IsNumber=false;}}
return IsNumber;}
function getCheckedValue(radioObj){if(!radioObj)
return"";var radioLength=radioObj.length;if(radioLength==undefined)
if(radioObj.checked)
return radioObj.value;else
return"";for(var i=0;i<radioLength;i++){if(radioObj[i].checked){return radioObj[i].value;}}
return"";}
String.format=function(text)
{if(arguments.length<=1)
{return text;}
var tokenCount=arguments.length-2;for(var token=0;token<=tokenCount;token++)
{text=text.replace(new RegExp("\\{"+token+"\\}","gi"),arguments[token+1]);}
return text;};