function CallURL(a){$.ajax({url:a,type:"GET",dataType:"jsonp",async:!0,success:function(a){JsonpCallback(a)},error:function(){ErrorFunction()}})}function JsonpCallback(a){for(var t=0;t<a.data.length;t++){var e=document.createElement("a");e.setAttribute("href",a.data[t].link),e.target="_blank";var n=document.createElement("img");n.src=a.data[t].images.low_resolution.url,e.appendChild(n),document.getElementById("instaPics").appendChild(e)}document.getElementById("instaPics")}function ErrorFunction(){alert("Error on getting the information. Please try again!")}$(document).ready(function(){hash=$("#hashtag").html(),hash=hash.replace("#",""),url="https://api.instagram.com/v1/tags/"+hash+"/media/recent?access_token=211418731.f59def8.1196a7a0ca134b12a0a70d87a3d7de57",console.log(url),CallURL(url)});