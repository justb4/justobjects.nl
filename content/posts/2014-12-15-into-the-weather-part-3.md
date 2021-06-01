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
In my last post, <a title="Into the Weather – Part 2 – Fun with Raspberry Pi" href="http://justobjects.nl/into-the-weather-part-2-fun-with-raspberry-pi/" target="_blank">Into the Weather &#8211; Part 2</a>, I outlined a global architecture of a <a href="http://www.davisnet.com/weather/products/vantage-pro-professional-weather-stations.asp" target="_blank">Davis Vantage Pro2</a> weather station connected to a <a href="http://www.raspberrypi.org/" target="_blank">Raspberry Pi </a> (RPi) running <a href="http://www.weewx.com/" target="_blank">weewx</a> weather software to capture raw weather data. Here I will try to depict how to bring this weather data &#8220;from the <a href="http://en.wikipedia.org/wiki/Little_Fluffy_Clouds" target="_blank">fluffy clouds</a> into the digital cloud&#8221;.  Finally, at the end, also some geospatial content. The image below shows the weather station sensors at the Geonovum building rooftop (was quite hazardous replacing a faulty temperature sensor there!) and the Davis console connected to the Raspberry Pi (transparent enclosure). All documentation and code can be found via: <a href="http://sospilot.readthedocs.org" target="_blank">sospilot.readthedocs.org</a>.

[<img loading="lazy" class="alignnone size-full wp-image-483" src="uploads/2014/12/davis-pws-geonovum-pics1.jpg" alt="davis-pws-geonovum-pics" width="500" height="326" srcset="https://justobjects.nl/wp-content/uploads/2014/12/davis-pws-geonovum-pics1.jpg 500w, https://justobjects.nl/wp-content/uploads/2014/12/davis-pws-geonovum-pics1-300x195.jpg 300w, https://justobjects.nl/wp-content/uploads/2014/12/davis-pws-geonovum-pics1-230x150.jpg 230w, https://justobjects.nl/wp-content/uploads/2014/12/davis-pws-geonovum-pics1-150x97.jpg 150w" sizes="(max-width: 500px) 100vw, 500px" />][1]

To recap: the <a href="http://www.davisnet.com/weather/" target="_blank">Davis Weather Station</a> continuously captures raw weather data through its sensors: temperature (out/in), pressure, wind (speed, direction), rainfall and even UV-radiation. This data is initially gathered within the local console display. This is fine for personal/local usage, but for capturing history, deriving trends and in particular for external sharing this is quite limited. The real fun starts with getting access to the raw data and go from there.

[<img loading="lazy" class="alignnone  wp-image-427" src="uploads/2014/11/weather-hw-setup-300x253.png" alt="Weather Project Setup" width="394" height="332" srcset="https://justobjects.nl/wp-content/uploads/2014/11/weather-hw-setup-300x253.png 300w, https://justobjects.nl/wp-content/uploads/2014/11/weather-hw-setup-1024x864.png 1024w, https://justobjects.nl/wp-content/uploads/2014/11/weather-hw-setup-177x150.png 177w, https://justobjects.nl/wp-content/uploads/2014/11/weather-hw-setup-150x126.png 150w, https://justobjects.nl/wp-content/uploads/2014/11/weather-hw-setup.png 1154w" sizes="(max-width: 394px) 100vw, 394px" />][2]

This is where the Raspberry Pi with weewx and later <a href="http://www.stetl.org" target="_blank">Stetl</a>, PostGIS, GeoServer and the 52North SOS come in, but I&#8217;ll go step-by-step. Let&#8217;s first see how we can publish weather data with just weewx.

My first post <a title="Into the Weather – Part 1 – Exploring weewx" href="http://justobjects.nl/into-the-weather-part-1/" target="_blank">Into the Weather &#8211; Part 1 </a>in this series introduced weewx, a Python framework for capturing, storing and publishing weather data. The Davis weather station is connected via USB to the RPi. The RPi runs <a href="http://weewx.org" target="_blank">weewx</a> to gather and store weather data (in a SQLite DB) from the weather station. But weewx can do more than this: it can also publish weather data to a variety of services. As any well-designed framework, weewx is basically a kernel, the w_eewx engine_ with configurable plugins, all specified and parameterized from a single configuration file _weewx.conf, _ like in <a href="https://github.com/Geonovum/sospilot/blob/master/src/weewx/davis/weewx.conf" target="_blank">this example</a>. The _weewx daemon_ process runs forever in a main loop continuously calling on all plugins.

First there are _weewx station-drivers_ that continuously capture raw data from most common weather stations. Although there are many brands of weather stations, many will share common hardware and protocols. The second class of plugins are _archiving drivers_, where/how to store raw weather data. Two standard archiving drivers are available: SQLite and MySQL. My choice: SQLite. For publication from archived data, a _standard reporting driver_ generates a plain HTML website using an extensible _skin containing (HTML) templates_. By configuring an FTP or _rsync_ destination, the generated HTML can be published to a remote webserver. This is the first connection to the digital cloud. Off course the skin and templates are highly configurable <a href="https://github.com/Geonovum/sospilot/tree/master/src/weewx/davis/byteweather" target="_blank">as in this example</a>. Many examples can be found on the web. I found the nice <a href="http://davies-barnard.co.uk/2014/01/weewx-byteweather-template" target="_blank">byteweather-template by Chris Davies-Barnard</a>. Below is the result as can be found at: <a href="http://sensors.geonovum.nl/weewx" target="_blank">sensors.geonovum.nl/weewx</a>.

<div id="attachment_484" style="width: 650px" class="wp-caption alignnone">
  <a href="http://sensors.geonovum.nl/weewx/"><img aria-describedby="caption-attachment-484" loading="lazy" class="size-full wp-image-484" src="uploads/2014/12/weewx-geonovum-screen1.png" alt="Weewx Standard Report" width="640" height="451" srcset="https://justobjects.nl/wp-content/uploads/2014/12/weewx-geonovum-screen1.png 640w, https://justobjects.nl/wp-content/uploads/2014/12/weewx-geonovum-screen1-300x211.png 300w, https://justobjects.nl/wp-content/uploads/2014/12/weewx-geonovum-screen1-212x150.png 212w, https://justobjects.nl/wp-content/uploads/2014/12/weewx-geonovum-screen1-150x105.png 150w, https://justobjects.nl/wp-content/uploads/2014/12/weewx-geonovum-screen1-285x201.png 285w" sizes="(max-width: 640px) 100vw, 640px" /></a>
  
  <p id="caption-attachment-484" class="wp-caption-text">
    Weewx Standard Report
  </p>
</div>

In addition, I&#8217;ve added even a more dynamic weather display like the <a href="http://wiki.sandaysoft.com/a/SteelSeries_Gauges" target="_blank">Steelseries Gauges</a>, as seen below and via the link <a href="http://sensors.geonovum.nl/weewx/gauges/" target="_blank">sensors.geonovum.nl/weewx/gauges</a>.

[<img loading="lazy" class="alignnone wp-image-485 size-full" src="uploads/2014/12/weewx-geonovum-gauges-screen1.png" alt="" width="640" height="451" srcset="https://justobjects.nl/wp-content/uploads/2014/12/weewx-geonovum-gauges-screen1.png 640w, https://justobjects.nl/wp-content/uploads/2014/12/weewx-geonovum-gauges-screen1-300x211.png 300w, https://justobjects.nl/wp-content/uploads/2014/12/weewx-geonovum-gauges-screen1-212x150.png 212w, https://justobjects.nl/wp-content/uploads/2014/12/weewx-geonovum-gauges-screen1-150x105.png 150w, https://justobjects.nl/wp-content/uploads/2014/12/weewx-geonovum-gauges-screen1-285x201.png 285w" sizes="(max-width: 640px) 100vw, 640px" />][3]

Just like other crowd-sourced projects like OpenStreetMap and WikiPedia there are various weather  communities where you can join and publish your weather data via RESTful APIs. weewx provides drivers for most common communities like <a href="http://www.wunderground.com/" target="_blank">Weather Underground </a>and <a href="http://pwsweather.com/" target="_blank">PWSWeather</a>. For example, I registered the Geonovum weather station as  <a href="http://www.wunderground.com/personal-weather-station/dashboard?ID=IUTRECHT96" target="_blank">Geonovum IUTRECHT96</a> as below.

[<img loading="lazy" class="alignnone wp-image-486 size-full" src="uploads/2014/12/wu-geonovum-pws1.png" alt="" width="640" height="530" srcset="https://justobjects.nl/wp-content/uploads/2014/12/wu-geonovum-pws1.png 640w, https://justobjects.nl/wp-content/uploads/2014/12/wu-geonovum-pws1-300x248.png 300w, https://justobjects.nl/wp-content/uploads/2014/12/wu-geonovum-pws1-181x150.png 181w, https://justobjects.nl/wp-content/uploads/2014/12/wu-geonovum-pws1-150x124.png 150w" sizes="(max-width: 640px) 100vw, 640px" />][4]

Weather Underground also provides various apps and a map, the <a href="http://www.wunderground.com/wundermap?lat=52.152&lon=5.372&zoom=13" target="_blank">WunderMap</a>. Here you can view your station, together with all others that jointly provide weather data. As can be seen there is already quite some coverage within The Netherlands.

[<img loading="lazy" class="alignnone wp-image-487 size-full" src="uploads/2014/12/wundermap-nl1.png" alt="" width="640" height="530" srcset="https://justobjects.nl/wp-content/uploads/2014/12/wundermap-nl1.png 640w, https://justobjects.nl/wp-content/uploads/2014/12/wundermap-nl1-300x248.png 300w, https://justobjects.nl/wp-content/uploads/2014/12/wundermap-nl1-181x150.png 181w, https://justobjects.nl/wp-content/uploads/2014/12/wundermap-nl1-150x124.png 150w" sizes="(max-width: 640px) 100vw, 640px" />][5]

&nbsp;

All in all, there is a fascinating world to explore once you get into the weather domain and its many communities.

So why am I doing all of this? Apart from having the opportunity to develop this as part of the <a href="http://sospilot.readthedocs.org/" target="_blank">SOSPilot Project at Geonovum</a>, I think that &#8220;geospatial&#8221; is moving from 2D to &#8220;N-dimensional&#8221;: not only more and more &#8220;3D&#8221;   is hitting the shores (just see the recent 2014 blogs at <a href="http://planet.osgeo.org/" target="_blank">planet.osgeo.org</a>), but also location-based sensor data (like Air Quality and weather data) and the <a href="http://en.wikipedia.org/wiki/Internet_of_Things" target="_blank">Internet of Things</a> drives a need to deal with time-series data: management, storage, services and visualization. Within the Open Source geospatial world I happily see that many frameworks and tools are extended to deal with 3D, like <a href="http://openlayers.org/ol3-cesium/" target="_blank">OpenLayers/Cesium</a> (one of my next posts) and <a href="http://boundlessgeo.com/2013/11/manage-lidar-postgis/" target="_blank">PostGIS/PDAL</a> and with Time like in <a href="http://docs.geoserver.org/latest/en/user/services/wms/time.html" target="_blank">GeoServer Dimension</a> support. Also the <a href="http://www.opengeospatial.org/ogc/markets-technologies/swe" target="_blank">OGC Sensor Web Enablement </a>and its lighter- weight version <a href="http://ogc-iot.github.io/ogc-iot-api/" target="_blank">OGC SensorThings</a> is gaining more attention.

Not yet done with the weather. Next post I will dive into further unlocking weather data via OGC services like WMS and SOS. That would be &#8220;Publishing Data to Cloud 9&#8221; ;-).

&nbsp;

&nbsp;

 [1]: uploads/2014/12/davis-pws-geonovum-pics1.jpg
 [2]: uploads/2014/11/weather-hw-setup.png
 [3]: http://sensors.geonovum.nl/weewx/gauges/index.html
 [4]: http://www.wunderground.com/personal-weather-station/dashboard?ID=IUTRECHT96
 [5]: http://www.wunderground.com/wundermap?lat=52.152&lon=5.372&zoom=13