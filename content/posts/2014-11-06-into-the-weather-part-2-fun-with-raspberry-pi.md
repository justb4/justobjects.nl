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
This is a follow-up to [&#8220;Into the Weather &#8211; Part 1 &#8211; Exploring weewx&#8221;][7]. Sorry, still almost no geospatial content for now. To recap: I am trying to setup an infrastructure where measurements from a [Davis Vantage Pro2 Weather Station][8] are collected and exposed to web services, most notably OGC Services like [WMS-Time][9] and SOS, the [Sensor Observation Service][10]. The TLDR; /impatient can view results at [sensors.geonovum.nl][11], sources in the [GitHub project][12] and in general [the documentation][13].

As this setup needs to be run from within my client&#8217;s local intranet with available servers &#8220;in the Cloud&#8221; there is a need for a &#8220;relaying middleman&#8221;.

The [Raspberry Pi][14] (RPi) was my first choice. The RPi is a credit-card sized computer that can run Linux-es like [Raspbian][15], a Linux OS based on [Debian][16]. As the Davis weather station console has a USB-interface and [weewx][17] supports read-outs from Davis weather stations, choosing the RPi was obvious. The combination RPi, Raspbian, weewx (try [this Google search][1]) is becoming more and more popular for setting up public and community-based weather stations.

By now it is time to depict the overall architecture as in the image below.

![ ](/uploads/2014/11/weather-hw-setup1.png)

The Davis weather station will connect via USB to the RPi. The RPi will run [weewx][17] to gather and store weather data (in a SQLite DB) from the weather station. In addition the RPi will run ETL software based on [Stetl][18] to publish weather data to a PostgreSQL/PostGIS database in a cloud server. Using [Geoserver][19] and the [52North SOS][20] the cloud server will expose the weather data via web services like WMS (Time), WFS and SOS and plain HTML using custom weather web templates like the fabulous [steelseries gauges][21]. I will expand on the software setup in the next post.

For now I will focus on acquiring and setting up the RPi, as this was a fun-exercise by itself. I ordered a kit with a Raspberry Pi Model B+ with power unit, casing, micro SD and WIFI USB adapter ([WiPi][22]) at [Kiwi Electronics][23]. The whole package arrived the next day.

![ ](/uploads/2014/11/rasp-pi-all1.jpg)

From unboxing to having everything installed with the [weewx Simulator (see Part 1)][7] went smooth. It would take too far to describe all the install steps and gotcha&#8217;s. I&#8217;ve summarized these here in the [RPi installation doc][24]. Apart from a standard Raspbian install, I paid in particular attention to two aspects:

  * running unattended as a headless server, i.e. monitoring and self-healing
  * having SSH access outside the LAN via reverse SSH-tunneling

Monitoring and self-healing are non-neglectable aspects, in particular the weewx server may go down for some reason, as well as the WIFI network and any of the SSH-tunnels. These aspects are described [in the documentation][24].

All in all this step was to get weewx running, still in simulator mode, storing raw weather data in a SQLite database and publishing HTML reports.

So the final result is an RPi humming silently, weewx reporting regularly. In general having a stable system for the next steps: gathering and publishing the weather data to the OGC services like WMS, WFS and SOS. The [Python-based Stetl framework][18], again proved to be instrumental to this effort, both on the RPi and on the Linux server in the Cloud.  This will be a subject for my next post. See the architecture below.

![ ](/uploads/2014/11/weather-sw-setup.png)

Summarizing: A Stetl process ([Stetl sync][5]) continuously gathers and publishes weather data to a remote PostgreSQL/PostGIS server. Through PostgreSQL-VIEWs refined weather data is immediately available to GeoServer as WMS(Time) and WFS sources, and via another Stetl process ([Stetl SOS][6]) published via SOS-T (ala WFS-T) to the SOS. The weewx engine has a plugin to publish a flat HTML website via _rsync_ using configurable templates.

There is much to expand still. I&#8217;m excited to see this whole infrastructure work in such a short time _**thanks to** **all these developers that produce all of the Open Source software involved here**_: from the core Debian/Raspbian OSs, the weewx weather software, PostgreSQL/PostGIS, GeoServer and the 52North SOS. The proverbial sentence is: _**I am just standing on the shoulders of you giants**_. This is the way humanity should evolve regarding soft/hardware-technology. Thanks again, and if you have read this far, I hope to see you in my next post !

 [1]: https://www.google.nl/search?q=RPi%2C+Raspbian%2C+weewx
 [2]: uploads/2014/11/weather-hw-setup1.png
 [3]: uploads/2014/11/rasp-pi-all1.jpg
 [4]: uploads/2014/11/weather-sw-setup.png
 [5]: https://github.com/Geonovum/sospilot/tree/master/src/weather/weewx2pg
 [6]: https://github.com/Geonovum/sospilot/tree/master/src/weather/pg2sos
 [7]: /into-the-weather-part-1/
 [8]: http://www.davisnet.com/weather/products/vantage-pro-professional-weather-stations.asp
 [9]: http://docs.geoserver.org/latest/en/user/services/wms/time.html
 [10]: http://www.opengeospatial.org/standards/sos
 [11]: http://sensors.geonovum.nl
 [12]: https://github.com/Geonovum/sospilot/tree/master/src
 [13]: http://sospilot.readthedocs.org/en/latest/
 [14]: http://www.raspberrypi.org/
 [15]: http://www.raspbian.org/
 [16]: https://www.debian.org/
 [17]: http://www.weewx.com/
 [18]: http://www.stetl.org
 [19]: http://geoserver.org
 [20]: http://52north.org/communities/sensorweb/sos/
 [21]: http://wiki.sandaysoft.com/a/SteelSeries_Gauges
 [22]: http://www.kiwi-electronics.nl/raspberry-pi/raspberry-pi-accessoires/wi-pi-draadloze-usb-adapter-voor-raspberry-pi
 [23]: http://www.kiwi-electronics.nl/
 [24]: http://sospilot.readthedocs.org/en/latest/raspberrypi-install.html
