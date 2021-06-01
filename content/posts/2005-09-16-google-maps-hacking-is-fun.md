---
title: Google Maps Hacking is Fun
author: Just van den Broecke
type: post
date: 2005-09-16T15:59:58+00:00
excerpt: Add animation and route playback and WMS layers to Google Maps
draft: true
url: /?p=15
categories:
  - Software

---
(The quick link for my experiments is [www.geoskating.com/gmap][1].) 

Just a week ago I learned about the [Google Maps JavaScript API][2]. Surprising how easy it was to use and build upon. Especially for my [GeoSkating project][3] I needed a more flexible way to display routes and media on a map. So I started experimenting with the Google Maps API. In less then 5 minutes I was able to create a basic map. But I needed more. Based on a [GPX (GPS track format)][4] player from [Jim Ley][5] I built a [TrackPlayer to play back skate routes][6]. In addition the [TLabel lib][7] allows you to overlay any HTML on a Google Map. 

**Adding layers from any WMS server** 

Many map servers use a standard URL-pattern based on the [Web Map Server (WMS)][8] standard. 

[<img src="/assets/media/gmap-overlay.jpg" border="0" />][9] 

So I wanted more: adding my own layers integrated in the map preferably with transparency. Well, this is possible thanks to work by [Brian Flood][10] and  
[Kyle Mulka][11]. I have created a [simple JavaScript  
library, gmap-wms.js][12] through which you can add your own WMS layers to a Google Map. The example below  
is trivial using a single transparent GIF image<img src="http://www.geoskating.com/gmap/route-wms.jsp" border="0" />  
by faking a WMS server. 

See all experiments at [www.geoskating.com/gmap][1]

 [1]: http://www.geoskating.com/gmap
 [2]: http://www.google.com/apis/maps
 [3]: http://www.geoskating.com
 [4]: http://www.topografix.com/gpx.asp
 [5]: http://jibbering.com
 [6]: http://www.geoskating.com/gs/player/trackplayer.jsp
 [7]: http://gmaps.tommangan.us/tlabel.html
 [8]: http://www.opengeospatial.org
 [9]: http://www.geoskating.com/gmap/gmap-wms-1.html
 [10]: http://www.spatialdatalogic.com/cs/blogs/brian_flood/archive/2005/07/11/39.aspx
 [11]: http://blog.kylemulka.com/?p=287
 [12]: http://www.geoskating.com/gmap/gmap-wms.js