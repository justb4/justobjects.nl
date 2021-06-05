---
title: Into the Weather – Part 3 – Publishing Data to the Cloud – 1
author: Just van den Broecke
type: post
date: 2014-12-15T23:19:17+00:00
url: /into-the-weather-part-3/
featured_image: uploads/2014/12/weewx-geonovum-gauges-screen1-150x105.png
categories:
  - General
  - osgeo
  - Projects
  - Software
tags:
  - geoserver
  - ogc
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
In my last post, [Into the Weather &#8211; Part 2][6], I outlined a global architecture of a [Davis Vantage Pro2][7] weather station connected to a [Raspberry Pi][8] (RPi) running [weewx][9] weather software to capture raw weather data. Here I will try to depict how to bring this weather data &#8220;from the [fluffy clouds][10] into the digital cloud&#8221;. Finally, at the end, also some geospatial content. The image below shows the weather station sensors at the Geonovum building rooftop (was quite hazardous replacing a faulty temperature sensor there!) and the Davis console connected to the Raspberry Pi (transparent enclosure). All documentation and code can be found via: [sospilot.readthedocs.org][11].

![ ](/uploads/2014/12/davis-pws-geonovum-pics1.jpg)

To recap: the [Davis Weather Station][12] continuously captures raw weather data through its sensors: temperature (out/in), pressure, wind (speed, direction), rainfall and even UV-radiation. This data is initially gathered within the local console display. This is fine for personal/local usage, but for capturing history, deriving trends and in particular for external sharing this is quite limited. The real fun starts with getting access to the raw data and go from there.

![ ](/uploads/2014/11/weather-hw-setup.png)

This is where the Raspberry Pi with weewx and later [Stetl][13], PostGIS, GeoServer and the 52North SOS come in, but I&#8217;ll go step-by-step. Let&#8217;s first see how we can publish weather data with just weewx.

My first post [Into the Weather &#8211; Part 1][14] in this series introduced weewx, a Python framework for capturing, storing and publishing weather data. The Davis weather station is connected via USB to the RPi. The RPi runs [weewx][9] to gather and store weather data (in a SQLite DB) from the weather station. But weewx can do more than this: it can also publish weather data to a variety of services. As any well-designed framework, weewx is basically a kernel, the _weewx engine_ with configurable plugins, all specified and parameterized from a single configuration file _weewx.conf_, like in [this example][15]. The _weewx daemon_ process runs forever in a main loop continuously calling on all plugins.

First there are _weewx station-drivers_ that continuously capture raw data from most common weather stations. Although there are many brands of weather stations, many will share common hardware and protocols. The second class of plugins are _archiving drivers_, where/how to store raw weather data. Two standard archiving drivers are available: SQLite and MySQL. My choice: SQLite. For publication from archived data, a _standard reporting driver_ generates a plain HTML website using an extensible _skin containing (HTML) templates_. By configuring an FTP or _rsync_ destination, the generated HTML can be published to a remote webserver. This is the first connection to the digital cloud. Off course the skin and templates are highly configurable [as in this example][16]. Many examples can be found on the web. I found the nice [byteweather-template by Chris Davies-Barnard][17]. Below is the result as can be found at: [sensors.geonovum.nl/weewx][18].

{{< a-img data-href="http://sensors.geonovum.nl/weewx/" data-src="/uploads/2014/12/weewx-geonovum-screen1.png" data-caption="Weewx Standard Report">}}

In addition, I&#8217;ve added even a more dynamic weather display like the [Steelseries Gauges][19], as seen below and via the link [sensors.geonovum.nl/weewx/gauges][20].

{{< a-img data-href="http://sensors.geonovum.nl/weewx/gauges/index.html" data-src="/uploads/2014/12/weewx-geonovum-gauges-screen1.png" >}}

Just like other crowd-sourced projects like OpenStreetMap and WikiPedia there are various weather  communities where you can join and publish your weather data via RESTful APIs. weewx provides drivers for most common communities like [Weather Underground][5] and [PWSWeather][21]. For example, I registered the Geonovum weather station as  [Geonovum IUTRECHT96][4] as below.

{{< a-img data-href="http://www.wunderground.com/personal-weather-station/dashboard?ID=IUTRECHT96" data-src="/uploads/2014/12/wu-geonovum-pws1.png" >}}

Weather Underground also provides various apps and a map, the [WunderMap][5]. Here you can view your station, together with all others that jointly provide weather data. As can be seen there is already quite some coverage within The Netherlands.

{{< a-img data-href="http://www.wunderground.com/wundermap?lat=52.152&lon=5.372&zoom=13" data-src="/uploads/2014/12/wundermap-nl1.png" >}}

All in all, there is a fascinating world to explore once you get into the weather domain and its many communities.

So why am I doing all of this? Apart from having the opportunity to develop this as part of the [SOSPilot Project at Geonovum][11], I think that &#8220;geospatial&#8221; is moving from 2D to &#8220;N-dimensional&#8221;: not only more and more &#8220;3D&#8221;  is hitting the shores (just see the recent 2014 blogs at [planet.osgeo.org][22]), but also location-based sensor data (like Air Quality and weather data) and the [Internet of Things][23] drives a need to deal with time-series data: management, storage, services and visualization. Within the Open Source geospatial world I happily see that many frameworks and tools are extended to deal with 3D, like [OpenLayers/Cesium][24] (one of my next posts) and [PostGIS/PDAL][25] and with Time like in [GeoServer Dimension][26] support. Also the [OGC Sensor Web Enablement][27] and its lighter-weight version [OGC SensorThings][28] is gaining more attention.

Not yet done with the weather. Next post I will dive into further unlocking weather data via OGC services like WMS and SOS. That would be &#8220;Publishing Data to Cloud 9&#8221; ;-)

 [1]: uploads/2014/12/davis-pws-geonovum-pics1.jpg
 [2]: uploads/2014/11/weather-hw-setup.png
 [3]: http://sensors.geonovum.nl/weewx/gauges/index.html
 [4]: http://www.wunderground.com/personal-weather-station/dashboard?ID=IUTRECHT96
 [5]: http://www.wunderground.com/wundermap?lat=52.152&lon=5.372&zoom=13
 [6]: /into-the-weather-part-2-fun-with-raspberry-pi/
 [7]: http://www.davisnet.com/weather/products/vantage-pro-professional-weather-stations.asp
 [8]: http://www.raspberrypi.org/
 [9]: http://www.weewx.com/
 [10]: http://en.wikipedia.org/wiki/Little_Fluffy_Clouds
 [11]: http://sospilot.readthedocs.org
 [12]: http://www.davisnet.com/weather/
 [13]: http://www.stetl.org
 [14]: /into-the-weather-part-1/
 [15]: https://github.com/Geonovum/sospilot/blob/master/src/weewx/davis/weewx.conf
 [16]: https://github.com/Geonovum/sospilot/tree/master/src/weewx/davis/byteweather
 [17]: http://davies-barnard.co.uk/2014/01/weewx-byteweather-template
 [18]: http://sensors.geonovum.nl/weewx
 [19]: http://wiki.sandaysoft.com/a/SteelSeries_Gauges
 [20]: http://sensors.geonovum.nl/weewx/gauges/
 [21]: http://pwsweather.com/
 [22]: http://planet.osgeo.org/
 [23]: http://en.wikipedia.org/wiki/Internet_of_Things
 [24]: http://openlayers.org/ol3-cesium/
 [25]: http://boundlessgeo.com/2013/11/manage-lidar-postgis/
 [26]: http://docs.geoserver.org/latest/en/user/services/wms/time.html
 [27]: http://www.opengeospatial.org/ogc/markets-technologies/swe
 [28]: http://ogc-iot.github.io/ogc-iot-api/
