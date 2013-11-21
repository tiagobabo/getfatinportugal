// JQuery Twitter Feed. Coded by Tom Elliott (Web Dev Door) www.webdevdoor.com (2013)
//UPDATED TO AUTHENTICATE TO API 1.1
(function($) {	
	$(document).ready(function () {
		var displaylimit = 10;
		var twittersearchtitle = gon.hashtag +" on Twitter";
		var showretweets = false;
		var showtweetlinks = true;
		var autorefresh = true;
		var showtweetactions = true;
		var showretweetindicator = true;
		var refreshinterval = 300000; //Time to autorefresh tweets in milliseconds. 600000 milliseconds = 1 minute
		var refreshtimer;
		
		
		var headerHTML = '';
		var loadingHTML = '';
		headerHTML += '<a href="https://twitter.com/" ><img src="/assets/twitter-bird-light.png" width="34" style="float:left;padding:3px 12px 0px 6px" alt="twitter bird" /></a>';
		headerHTML += '<h1>'+twittersearchtitle+'</h1>';
		loadingHTML += '<div id="loading-container"><img src="/assets/ajax-loader.gif" width="32" height="32" alt="tweet loader" /></div>';
		
		$('#twitter-feed').html(headerHTML + loadingHTML);
		 
		 if (autorefresh == true) {
			refreshtimer = setInterval(gettwitterjson, refreshinterval); 
		 }	
		 
		 gettwitterjson();
		 
		function gettwitterjson() { 
			 
				   var feeds = gon.twitter.statuses; //search returns an array of statuses	
				if(feeds.length!=0){				
					var feedHTML = '';
					var displayCounter = 1;  
					for (var i=0; i<feeds.length; i++) {
						var tweetscreenname = feeds[i].user.name;
						var tweetusername = feeds[i].user.screen_name;
						var profileimage = feeds[i].user.profile_image_url_https;
						var status = feeds[i].text; 
						var isaretweet = false;
						var isdirect = false;
						var tweetid = feeds[i].id_str;
						
						//If the tweet has been retweeted, get the profile pic of the tweeter
						if(typeof feeds[i].retweeted_status != 'undefined'){
						   profileimage = feeds[i].retweeted_status.user.profile_image_url_https;
						   tweetscreenname = feeds[i].retweeted_status.user.name;
						   tweetusername = feeds[i].retweeted_status.user.screen_name;
						   tweetid = feeds[i].retweeted_status.id_str
						   isaretweet = true;
						 };
						 
						 
						 if (((showretweets == true) || ((isaretweet == false) && (showretweets == false)))) { 
							if ((feeds[i].text.length > 1) && (displayCounter <= displaylimit)) {             
								if (showtweetlinks == true) {
									status = addlinks(status);
								}
								 
								if (displayCounter == 1) {
									feedHTML += headerHTML;
								}
											 
								feedHTML += '<div class="twitter-article" id="tw'+displayCounter+'">';                  
								feedHTML += '<div class="twitter-pic"><a href="https://twitter.com/'+tweetusername+'" ><img src="'+profileimage+'"images/twitter-feed-icon.png" width="42" height="42" alt="twitter icon" /></a></div>';
								feedHTML += '<div class="twitter-text"><p><span class="tweetprofilelink"><strong><a href="https://twitter.com/'+tweetusername+'" >'+tweetscreenname+'</a></strong> <a href="https://twitter.com/'+tweetusername+'" >@'+tweetusername+'</a></span><span class="tweet-time"><a href="https://twitter.com/'+tweetusername+'/status/'+tweetid+'">'+relative_time(feeds[i].created_at)+'</a></span><br/>'+status+'</p></div>';
								if ((isaretweet == true) && (showretweetindicator == true)) {
									feedHTML += '<div id="retweet-indicator"></div>';
								}						
								if (showtweetactions == true) {
									feedHTML += '<div id="twitter-actions"><div class="intent" id="intent-reply"><a href="https://twitter.com/intent/tweet?in_reply_to='+tweetid+'" title="Reply"></a></div><div class="intent" id="intent-retweet"><a href="https://twitter.com/intent/retweet?tweet_id='+tweetid+'" title="Retweet"></a></div><div class="intent" id="intent-fave"><a href="https://twitter.com/intent/favorite?tweet_id='+tweetid+'" title="Favourite"></a></div></div>';
								}
								feedHTML += '</div>';
								displayCounter++;
							}   
						 }
					}
					 
					$('#twitter-feed').html(feedHTML);
					
					//Add twitter action animation and rollovers
					if (showtweetactions == true) {				
						$('.twitter-article').hover(function(){
							$(this).find('#twitter-actions').css({'display':'block', 'opacity':0, 'margin-top':-20});
							$(this).find('#twitter-actions').animate({'opacity':1, 'margin-top':0},200);
						}, function() {
							$(this).find('#twitter-actions').animate({'opacity':0, 'margin-top':-20},120, function(){
								$(this).css('display', 'none');
							});
						});			
					
						//Add new window for action clicks
					
						$('#twitter-actions a').click(function(){
							var url = $(this).attr('href');
						  window.open(url, 'tweet action window', 'width=580,height=500');
						  return false;
						});
					}
				}else
				{
					$('#twitter-feed').html(headerHTML+" <div> <h5 class='red'> no tweets are available</h5></div>");
				}
			
		}
			 
		//Function modified from Stack Overflow
		function addlinks(data) {
			//Add link to all http:// links within tweets
			data = data.replace(/((https?|s?ftp|ssh)\:\/\/[^"\s\<\>]*[^.,;'">\:\s\<\>\)\]\!])/g, function(url) {
				return '<a href="'+url+'"  target="_blank">'+url+'</a>';
			});
				 
			//Add link to @usernames used within tweets
			data = data.replace(/\B@([_a-z0-9]+)/ig, function(reply) {
				return '<a href="http://twitter.com/'+reply.substring(1)+'" style="font-weight:lighter;" >'+reply.charAt(0)+reply.substring(1)+'</a>';
			});
			return data;
		}
		 
		 
		function relative_time(time_value) {
		  var values = time_value.split(" ");
		  time_value = values[1] + " " + values[2] + ", " + values[5] + " " + values[3];
		  var parsed_date = Date.parse(time_value);
		  var relative_to = (arguments.length > 1) ? arguments[1] : new Date();
		  var delta = parseInt((relative_to.getTime() - parsed_date) / 1000);
		  var shortdate = time_value.substr(4,2) + " " + time_value.substr(0,3);
		  delta = delta + (relative_to.getTimezoneOffset() * 60);
		 
		  if (delta < 60) {
			return '1m';
		  } else if(delta < 120) {
			return '1m';
		  } else if(delta < (60*60)) {
			return (parseInt(delta / 60)).toString() + 'm';
		  } else if(delta < (120*60)) {
			return '1h';
		  } else if(delta < (24*60*60)) {
			return (parseInt(delta / 3600)).toString() + 'h';
		  } else if(delta < (48*60*60)) {
			//return '1 day';
			return shortdate;
		  } else {
			return shortdate;
		  }
		}
	});
})(jQuery);
