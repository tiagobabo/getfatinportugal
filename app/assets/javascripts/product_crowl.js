
$(document).ready(function() {
	hash = $("#hashtag").html();
	hash = hash.replace('#','');
	url = "https://api.instagram.com/v1/tags/" + hash + "/media/recent?access_token=211418731.f59def8.1196a7a0ca134b12a0a70d87a3d7de57";
	CallURL(url);
});

function CallURL(url){
    $.ajax({
	    url: url,
	    type: "GET",
	    dataType: "jsonp",
	    async:true,
	     success: function (msg) {
	         JsonpCallback(msg);
	    },
	    error: function () {
	        ErrorFunction();
	    }
	});
}

function JsonpCallback(json)
{
	var max = json.data.length;
	if(json.data.length > 6){
		max = 6;
	}
	console.log(max);

	for (var i=0;i<max;i++)
	{
		var link = document.createElement('a'); // create the link
		link.setAttribute('href', json.data[i].link); // set link path
		link.target = "_blank";
		var elem = document.createElement("img");
		elem.src = json.data[i].images.low_resolution.url;
		link.appendChild(elem)
		document.getElementById("instaPics").appendChild(link);
	}
	var polaroid = document.getElementById("instaPics");
}

function ErrorFunction(){
	alert('Error on getting the information. Please try again!');
}
