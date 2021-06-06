---
title: Google Maps Hacking is Fun
author: Just van den Broecke
type: post
date: 2005-09-16T15:54:37+00:00
excerpt: Add animation and route playback and WMS layers to Google Maps
url: /google-maps-hacking-is-fun-2/
categories:
  - Software

---
(The quick link for my experiments is [www.geoskating.com/gmap][1])

Just a week ago I learned about the [Google Maps JavaScript API][2]. Surprising how easy it was to use and build upon. Especially for my [GeoSkating project][3] I needed a more flexible way to display routes and media on a map. So I started experimenting with the Google Maps API. In less then 5 minutes I was able to [create a basic map][4]. But I needed more. Based on a [GPX (GPS track format)][5] player from [Jim Ley][6] I built a [TrackPlayer to play back skate routes][7]. In addition the [TLabel lib][8] allows you to overlay any HTML on a Google Map. Note: also check out [ka-Map][9]. With ka-Map you can do similar things plus it is open source.

**Adding layers from any WMS server**

Many map servers use a standard URL-pattern based on the [Web Map Server (WMS)][10] standard.

![ ][0]

So I wanted more: adding my own layers integrated in the map preferably with transparency. Well, this is possible thanks to work by [Brian Flood][12] and [Kyle Mulka][13]. I have created a [simple JavaScript library, gmap-wms.js][14] through which you can add your own WMS layers to a Google Map. The example above is trivial using a single transparent GIF image by faking a WMS server. All Google Maps does is requesting tiles from your WMS server (a lot of them!). In reality you will be running your own WMS server like [MapServer][15].

See all experiments at [www.geoskating.com/gmap][1]

![ ][16]

 [0]: /uploads/2005/09/gmap-overlay.jpg
 [1]: http://www.geoskating.com/gmap
 [2]: http://www.google.com/apis/maps
 [3]: http://www.geoskating.com
 [4]: http://www.geoskating.com/gmap/gmap.html
 [5]: http://www.topografix.com/gpx.asp
 [6]: http://jibbering.com
 [7]: http://www.geoskating.com/gs/player/trackplayer.jsp
 [8]: http://gmaps.tommangan.us/tlabel.html
 [9]: http://ka-map.maptools.org/
 [10]: http://www.opengeospatial.org
 [11]: uploads/2005/09/gmap-overlay.jpg
 [12]: http://www.spatialdatalogic.com/cs/blogs/brian_flood/archive/2005/07/11/39.aspx
 [13]: http://blog.kylemulka.com/?p=287
 [14]: http://www.geoskating.com/gmap/gmap-wms.js
 [15]: http://mapserver.gis.umn.edu/
 [16]: http://www.geoskating.com/gmap/route-wms.jsp
