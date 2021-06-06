---
title: GeoDrawing in the Night
author: Just van den Broecke
type: post
date: 2005-11-08T09:53:20+00:00
excerpt: A locative GPS-based mobile GeoDrawing game
url: /geodrawing-in-the-night/
categories:
  - Mobile
  - Projects

---
![ ][0]

Again I had the opportunity to do a fun and technically challenging geo-project using my [GeoTracing][2] platform: developing a [GPS-based mobile drawing game][3] for the  [Amsterdam Museum Night][4]. Teams would go into the city where they compete on who would (geo)draw the most beautiful &#8220;8&#8221; by walking with a GPS and a mobile phone. They could embellish their drawings with photo&#8217;s and video&#8217;s taken and submitted on the spot. The competitive element was creativity with both the drawing and the media. All submitted media were tagged to the geographic locations where they were taken. The player&#8217;s movements, tracks and media could be followed in real-time through a webbrowser. You can view [a report with video made by Bright magazine][5].

![ ][1]

The N8-game application was developed in about one month by two developers. It consisted of three main components: (1) the server (2) mobile clients and (3) a web-browser front end.

The **_mobile client_** is a Java J2ME application (Midlet) running on a Nokia 6600 communicating with a [Holux GPSlim Bluetooth Sirf III GPS module][7]. The main function of this app is to sample GPS data and transmit it to the server. Players could indicate with a button push to start (&#8220;pen-down&#8221;) and stop drawing (&#8220;pen-up&#8221;). Media were captured using the standard camera application on a Sony Z1010 phone. Media was submitted by email. The phone&#8217;s email adress is coupled to each team.

The **_server_** utilized the GeoTracing server without any modification. Basically a GeoTracing server functions as a remote GPS track-logger coupled to a Content Management System. GeoTracing is based on [KeyWorx][8]. Incoming media are tied to a player (tracer) and a tracklog and a geographic location using the date in the medium (e.g. EXIF date) or the email submit time. The GeoTracing server provides a [REST][9] service for clients to obtain tracklog meta information, (converted) media and tracklog data in an extended [GPX format][10]. This also facilitates coupling with [AJAX][11] browser-technology (see below). The server also pushes live events like user movements and other tracklog events through [Pushlets][12].

The **_web-browser front-end_** was written using pure DHTML with [Google Maps][13], [AJAX][11] and [a Pushlet client][12].  
Through Pushlets the browser receives real-time events like player movements and incoming media. Using the server REST service with AJAX player and tracklog info is obtained. Conceptually the browser-server interaction follows a distributed [Model-View-Controller pattern][14] with the Model on the server, the events to the View (browser) transmitted with Pushlets and the Controller function using AJAX.

 [0]: /uploads/2005/11/n8spel1.jpg
 [1]: /uploads/2005/11/n8spel2.jpg
 [2]: http://www.geotracing.com
 [3]: http://www.n8spel.nl
 [4]: http://www.n8.nl
 [5]: http://www.bright.nl/node/257
 [6]: uploads/2005/11/n8spel2.jpg
 [7]: http://www.holux.com.tw/Temp%20web/GR-236.htm
 [8]: http://www.keyworx.org
 [9]: http://en.wikipedia.org/wiki/Representational_State_Transfer
 [10]: http://www.topografix.com/gpx.asp
 [11]: http://en.wikipedia.org/wiki/AJAX
 [12]: http://www.pushlets.com
 [13]: http://www.google.com/apis/maps
 [14]: http://en.wikipedia.org/wiki/Model_view_controller
