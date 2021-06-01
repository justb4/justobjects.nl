---
title: Into the Weather – Part 2 – Fun with Raspberry Pi
author: Just van den Broecke
type: post
date: 2014-11-06T01:35:30+00:00
url: /into-the-weather-part-2-fun-with-raspberry-pi/
featured_image: uploads/2014/11/weather-hw-setup1-150x127.png
categories:
  - osgeo
  - Projects
  - Software
tags:
  - gdal
  - geoserver
  - GeoSpatial
  - GIS
  - OSgeo
  - PostGIS
  - raspberry pi
  - SensorThings
  - SOS
  - SWE
  - weather
  - weather underground
  - weewx
  - wms

---
<span style="color: #333333;">This is a follow-up to <a title="Into the Weather – Part 1 – Exploring weewx" href="http://justobjects.nl/into-the-weather-part-1/">&#8220;Into the Weather &#8211; Part 1 &#8211; Exploring weewx&#8221;</a>. Sorry, still almost no geospatial content for now. To recap: I am trying to setup an infrastructure where measurements from a <a href="http://www.davisnet.com/weather/products/vantage-pro-professional-weather-stations.asp" target="_blank">Davis Vantage Pro2 Weather Station</a> are collected and exposed to web services, most notably OGC Services like <a href="http://docs.geoserver.org/latest/en/user/services/wms/time.html">WMS-Time</a> and SOS, the <a href="http://www.opengeospatial.org/standards/sos">Sensor Observation Service.</a>  The TLDR; /impatient can view results at <a href="http://sensors.geonovum.nl" target="_blank">sensors.geonovum.nl</a>, sources in the <a href="https://github.com/Geonovum/sospilot/tree/master/src" target="_blank">GitHub project</a> and in general <a href="http://sospilot.readthedocs.org/en/latest/" target="_blank">the documentation</a>. </span>

As this setup needs to be run from within my client&#8217;s local intranet with available servers &#8220;in the Cloud&#8221; there is a need for a &#8220;relaying middleman&#8221;.

<span style="color: #333333;">The <a href="http://www.raspberrypi.org/" target="_blank">Raspberry Pi </a> (RPi) was my first choice. <span style="color: #222222;">The RPi is a credit-card sized computer</span> that can run Linux-es like <a href="http://www.raspbian.org/" target="_blank">Raspbian</a>, a Linux OS based on <a href="https://www.debian.org/" target="_blank">Debian</a>.  </span>As the Davis weather station console has a USB-interface and <a href="http://www.weewx.com/" target="_blank">weewx </a>supports read-outs from Davis weather stations, choosing the RPi was obvious. The combination RPi, Raspbian, weewx (try [this Google search][1]) is becoming more and more popular for setting up public and community-based weather stations.

By now it is time to depict the overall architecture as in the image below.

[  
<img class="alignleft wp-image-429" src="uploads/2014/11/weather-hw-setup1-1024x868.png" alt="weather-hw-setup" width="800" srcset="https://justobjects.nl/wp-content/uploads/2014/11/weather-hw-setup1-1024x868.png 1024w, https://justobjects.nl/wp-content/uploads/2014/11/weather-hw-setup1-300x254.png 300w, https://justobjects.nl/wp-content/uploads/2014/11/weather-hw-setup1-176x150.png 176w, https://justobjects.nl/wp-content/uploads/2014/11/weather-hw-setup1-150x127.png 150w, https://justobjects.nl/wp-content/uploads/2014/11/weather-hw-setup1.png 1193w" sizes="(max-width: 1024px) 100vw, 1024px" />][2] 

The Davis weather station will connect via USB to the RPi. The RPi will run <a href="http://weewx.org" target="_blank">weewx</a> to gather and store weather data (in a SQLite DB) from the weather station. In addition the RPi will run ETL software based on <a href="http://www.stetl.org" target="_blank">Stetl</a> to publish weather data to a PostgreSQL/PostGIS database in a cloud server. Using <a href="http://geoserver.org" target="_blank">Geoserver</a> and the <a href="http://52north.org/communities/sensorweb/sos/" target="_blank">52North SOS</a> the cloud server will expose the weather data via web services like WMS (Time), WFS and SOS and plain HTML using custom weather web templates like the fabulous <a href="http://wiki.sandaysoft.com/a/SteelSeries_Gauges" target="_blank">steelseries gauges</a>. I will expand on the software setup in the next post.

For now I will focus on acquiring and setting up the RPi, as this was a fun-exercise by itself. I ordered a kit with a Raspberry Pi Model B+ with power unit, casing, micro SD and WIFI USB adapter (<a href="http://www.kiwi-electronics.nl/raspberry-pi/raspberry-pi-accessoires/wi-pi-draadloze-usb-adapter-voor-raspberry-pi" target="_blank">WiPi</a>) at <a href="http://www.kiwi-electronics.nl/" target="_blank">Kiwi Electronics</a>.  The whole package arrived the next day.

[<img loading="lazy" class="alignnone wp-image-434 size-large" src="uploads/2014/11/rasp-pi-all1-1024x607.jpg" alt="rasp-pi-all" width="820" height="486" srcset="https://justobjects.nl/wp-content/uploads/2014/11/rasp-pi-all1-1024x607.jpg 1024w, https://justobjects.nl/wp-content/uploads/2014/11/rasp-pi-all1-300x178.jpg 300w, https://justobjects.nl/wp-content/uploads/2014/11/rasp-pi-all1-250x148.jpg 250w, https://justobjects.nl/wp-content/uploads/2014/11/rasp-pi-all1-150x89.jpg 150w, https://justobjects.nl/wp-content/uploads/2014/11/rasp-pi-all1.jpg 1272w" sizes="(max-width: 820px) 100vw, 820px" />][3]

From unboxing to having everything installed with the <a title="Into the Weather – Part 1 – Exploring weewx" href="http://justobjects.nl/into-the-weather-part-1/" target="_blank">weewx Simulator (see Part 1)</a> went smooth. It would take too far to describe all the install steps and gotcha&#8217;s. I&#8217;ve summarized these here in the <a href="http://sospilot.readthedocs.org/en/latest/raspberrypi-install.html" target="_blank">RPi installation doc</a>. Apart from a standard Raspbian install, I paid in particular attention to two aspects:

  * running unattended as a headless server, i.e. monitoring and self-healing
  * having SSH access outside the LAN via reverse SSH-tunneling

Monitoring and self-healing are non-neglectable aspects, in particular the weewx server may go down for some reason, as well as the WIFI network and any of the SSH-tunnels. These aspects are described <a href="http://sospilot.readthedocs.org/en/latest/raspberrypi-install.html" target="_blank">in the documentation</a>.

All in all this step was to get weewx running, still in simulator mode, storing raw weather data in a SQLite database and publishing HTML reports.

So the final result is an RPi humming silently, weewx reporting regularly. In general having a stable system for the next steps: gathering and publishing the weather data to the OGC services like WMS, WFS and SOS. The <a href="http://www.stetl.org" target="_blank">Python-based Stetl framework</a>, again proved to be instrumental to this effort, both on the RPi and on the Linux server in the Cloud.  This will be a subject for my next post. See the architecture below.

[<img loading="lazy" class="alignnone wp-image-435 size-large" src="uploads/2014/11/weather-sw-setup-848x1024.png" alt="weather-sw-setup" width="820" height="990" srcset="https://justobjects.nl/wp-content/uploads/2014/11/weather-sw-setup-848x1024.png 848w, https://justobjects.nl/wp-content/uploads/2014/11/weather-sw-setup-248x300.png 248w, https://justobjects.nl/wp-content/uploads/2014/11/weather-sw-setup-124x150.png 124w, https://justobjects.nl/wp-content/uploads/2014/11/weather-sw-setup.png 1161w" sizes="(max-width: 820px) 100vw, 820px" />][4]

Summarizing: A Stetl process ([Stetl sync][5]) continuously gathers and publishes weather data to a remote PostgreSQL/PostGIS server. Through PostgreSQL-VIEWs refined weather data is immediately available to GeoServer as WMS(Time) and WFS sources, and via another Stetl process ([Stetl SOS][6]) published via SOS-T (ala WFS-T) to the SOS. The weewx engine has a plugin to publish a flat HTML website via _rsync_ using configurable templates.

There is much to expand still. I&#8217;m excited to see this whole infrastructure work in such a short time _**thanks to** **all these developers that produce all of the Open Source software involved here**_: from the core Debian/Raspbian OSs, the weewx weather software, PostgreSQL/PostGIS, GeoServer and the 52North SOS. The proverbial sentence is: _**I am just standing on the shoulders of you giants**_. This is the way humanity should evolve regarding soft/hardware-technology. Thanks again, and if you have read this far, I hope to see you in my next post !

&nbsp;

&nbsp;

&nbsp;

 [1]: https://www.google.nl/search?q=RPi%2C+Raspbian%2C+weewx
 [2]: uploads/2014/11/weather-hw-setup1.png
 [3]: uploads/2014/11/rasp-pi-all1.jpg
 [4]: uploads/2014/11/weather-sw-setup.png
 [5]: https://github.com/Geonovum/sospilot/tree/master/src/weather/weewx2pg
 [6]: https://github.com/Geonovum/sospilot/tree/master/src/weather/pg2sos