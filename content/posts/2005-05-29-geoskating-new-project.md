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
<a href="http://www.geoskating.com" target="_new">GeoSkating</a> is my latest project started in february 2005.

[<img loading="lazy" class="alignnone  wp-image-327" src="uploads/2005/05/geoskating-300x90.jpg" alt="geoskating" width="500" height="150" srcset="https://justobjects.nl/wp-content/uploads/2005/05/geoskating-300x90.jpg 300w, https://justobjects.nl/wp-content/uploads/2005/05/geoskating-250x75.jpg 250w, https://justobjects.nl/wp-content/uploads/2005/05/geoskating-150x45.jpg 150w, https://justobjects.nl/wp-content/uploads/2005/05/geoskating.jpg 541w" sizes="(max-width: 500px) 100vw, 500px" />][1]

GeoSkating aims to automate the generation of interactive annotated skate-maps by using the Global Positioning System (GPS), Mobile Phones and the Internet. The key idea is that while skating, GPS position data is being assembled and published to a server through a mobile phone. At the same time the skater can enrich the GPS data with road surface ratings and by submitting media items like pictures. The server will draw geographic maps showing road quality through colouring plus the submitted media on the GPS locations where they were captured. In addition, skaters can also be seen moving in real-time on the map while skating!

The technical setup is globally as follows. GPS data is sampled using a standard <a href="http://www.delorme.com/bluelogger" target="_new">Bluetooth GPS module</a>. This module communicates with a mobile phone, a <a href="http://www.nokia.com/nokia/0,4879,33210,00.html" target="_new">Nokia 6600</a>. On the mobile phone runs a small <a href="http://java.sun.com/j2me" target="_new">Java (J2ME)</a> program that reads the GPS data from the GPS module and sends it through the mobile data network (GPRS) to the geoskating.com server. The skater can enter the road quality as a number (1-5) on the phone keypad. The current quality is always added to each GPS sample sent to the server.

 [1]: uploads/2005/05/geoskating.jpg