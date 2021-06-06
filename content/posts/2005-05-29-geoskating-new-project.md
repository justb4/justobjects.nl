---
title: GeoSkating – Draw maps while skating
author: Just van den Broecke
type: post
date: 2005-05-29T15:08:13+00:00
excerpt: 'GeoSkating aims to automate the generation of interactive annotated skate-maps by using the Global Positioning System (GPS), Mobile Phones and the Internet. '
url: /geoskating-new-project/
categories:
  - Mobile

---
[GeoSkating][1] is my latest project started in february 2005.

![ ][2]

[GeoSkating][1] aims to automate the generation of interactive annotated skate-maps by using the Global Positioning System (GPS), Mobile Phones and the Internet. The key idea is that while skating, GPS position data is being assembled and published to a server through a mobile phone. At the same time the skater can enrich the GPS data with road surface ratings and by submitting media items like pictures. The server will draw geographic maps showing road quality through colouring plus the submitted media on the GPS locations where they were captured. In addition, skaters can also be seen moving in real-time on the map while skating!

The technical setup is globally as follows. GPS data is sampled using a standard [Bluetooth GPS module][3]. This module communicates with a mobile phone, a [Nokia 6600][4]. On the mobile phone runs a small [Java (J2ME)][5] program that reads the GPS data from the GPS module and sends it through the mobile data network (GPRS) to the geoskating.com server. The skater can enter the road quality as a number (1-5) on the phone keypad. The current quality is always added to each GPS sample sent to the server.

 [1]: http://www.geoskating.com
 [2]: /uploads/2005/05/geoskating.jpg
 [3]: http://www.delorme.com/bluelogger
 [4]: http://www.nokia.com/nokia/0,4879,33210,00.html
 [5]: http://java.sun.com/j2me
