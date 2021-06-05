---
title: Into the Weather – Part 1 – Exploring weewx
author: Just van den Broecke
type: post
date: 2014-10-17T01:21:02+00:00
url: /into-the-weather-part-1/
featured_image: uploads/2014/10/screenshot-weewx-report-s-150x103.png
categories:
  - osgeo
  - Projects
  - Software
tags:
  - weather
  - weather underground
  - weewx

---
{{< a-img data-href="http://lib.heron-mc.org/heron/latest/examples/simpletimeslider/" data-src="/uploads/2014/10/wms-time-heron-knmi-300x181.png" data-caption="WMS Time Example with GeoServer in Heron" data-class="float_right">}}

Tagging this post as &#8220;Part 1&#8221;  is ambitious. Beware: there is hardly any &#8220;geo&#8221; for now. In the coming time I hope to share some technical experiences with weather stations, weather software and ultimately exposing weather data via some open geospatial standards like [OGC WMS(-Time)][7] as in [example image right][1], WFS and in particular [SOS (Sensor Observation Service)][8]. The context is an exciting project with [Geonovum][9] in the Netherlands: to transform and expose (via web services and reporting) open/raw Air Quality data from [RIVM][10], the Dutch National Institute for Public Health and the Environment. The main link to this project is [sensors.geonovum.nl][11]. All software is developed as FOSS [via a GitHub project][12]. There are already some results there. I may post on these later.

{{< a-img data-href="javascript:return false;" data-src="/uploads/2014/10/sospilot-screenshot-300x206.png" data-class="float_left">}}

Within a sub-project the aim is to expose measurements from a physical weather station via standardized OGC web services like WMS, WFS and SOS.  As a first step I dived into the world of weather hardware and software, in particular their vivid open source/open data communities. A whole new world expanded to me. To no surprise: Location and The Weather are part of everyday life since the beginnings of humanity. [OpenWeatherMap][13] and [Weather Underground][14] are just two of the many communities around open weather data. In addition there&#8217;s an abundance of FOSS weather software. Personal weather stations are measuring not just temperature but also pressure, humidity, rainfall, wind, up to UV radiation and are built [homebrew][3] or [bought for as cheap as $50,-. ][4]

![Weather Hacking](/uploads/2014/10/weather-hacking.png)

Being a noob in weather soft/hardware technology I had to start somewhere and then go step-by-step. The overall &#8220;architecture&#8221; can be even depicted in text:

```
weather station --> soft/middleware --> web services + reporting
```

{{< a-img data-href="http://www.davisnet.com/weather/products/vantage-pro-professional-weather-stations.asp" data-src="/uploads/2014/10/davis-vantage-pro2-300x188.jpg" data-class="float_right" data-caption="Davis Vantage Pro2 Weather Station">}}

Being more of a software person, I decided to start with the weather soft/middleware. Also, since Geonovum already owns a [Davis Vantage Pro2 Weather Station][19] and the [Raspberry Pi B+][20] I plan to use is still underway&#8230;

From what I gathered, [weewx][15] is the most widely used engine/framework within the weather FOSS community. Also the fact that it is written in Python with a very extensible architecture immediately settled my choice. Explaining [weewx][15] is a subject by itself but [very well documented][16]. I&#8217;ll try in a few sentences what [weewx][15] does:

  * collect current and archive weather station measurement data (drivers)
  * storing weather data (archive and statistics) in a database ([SQLite][17] or MySQL)
  * submitting data to weather community services like [Weather Underground][14]
  * creating formatted/templated reports for your local or remote website

Any of these functionalities is highly extensible through a configurable plugin architecture. The drivers support most common weather stations. Installing is a breeze, either in a local directory or via Linux package managers. Also note that weather data  have quite some different local units (Fahrenheit/Celsius, knots/meters etc). [weewx][15] will all take care of this.

So, not yet having access to a weather station, what could I do? One of the weather station drivers is the [Simulator][18] which intelligently generates weather data for testing.

{{< a-img data-href="http://openweathermap.org/maps" data-src="/uploads/2014/10/openweathermap-300x196.png" data-class="float_right" >}}

Trying to have some real-world data I set out on what appeared to be a two-hour hack: create a weather station driver that obtains its data from an open weather API. There are many off course. I choose the [OpenWeatherMap API][21] to get data in the area of our cabin in the woods near the place of [Otterlo in the Netherlands][22]. Writing this hard-coded driver took just a few line of Python. The [source code can be found here][23]. To not overask the API, I&#8217;ve set the time interval to 2 minutes within the [weewx configuration file][24]. Also it would not be fair to report these values to any of the weather communities. If the weewx community is interested I can donate this software, with some generalization (e.g. URLvia config).

But all in all my first driver is still running fine in weewx. The main challenge was converting all the values between different metric systems. weewx allows and even encourages you to store all data in US metrics. All the reporting and conversion utilities will always allow you to show your local metric units.

{{< a-img data-href="javascript:return false;" data-src="/uploads/2014/10/otterlo-weewx-report-300x275.png" data-class="float_left" >}}

As a Linux daemon now runs fine in our test system. It is time to show some results. weewx reporting is basically a website generated via [Cheetah templates][25]. The default template is basic white on black. I found a nice template called [Byteweather][26]. You can find my continuous weather report  here at [sensors.geonovum.nl/weather][27]. Measurements are now building up thanks to the weewx archive database. Values are mostly matching Dutch weather station data. Expect for the rainfall&#8230;Surely we have lots of rain but not that much&#8230;

Next posting I hope to tell more about deploying the Raspberry Pi and connecting to the Geonovum Davis Weather station. Then there will be also more &#8220;geo&#8221; in the post, I promise!

 [1]: http://lib.heron-mc.org/heron/latest/examples/simpletimeslider/
 [2]: uploads/2014/10/sospilot-screenshot.png
 [3]: http://www.zipfelmaus.com/blog/arduino-weather-shield-schematics-layout-code-everything-you-need/
 [4]: http://www.weathershop.co.uk/
 [5]: http://openweathermap.org/maps
 [6]: uploads/2014/10/otterlo-weewx-report.png
 [7]: http://mapserver.org/ogc/wms_time.html
 [8]: http://en.wikipedia.org/wiki/Sensor_Observation_Service
 [9]: http://www.geonovum.nl/
 [10]: http://www.rivm.nl/
 [11]: http://sensors.geonovum.nl
 [12]: https://github.com/Geonovum/sospilot
 [13]: http://openweathermap.org/
 [14]: http://www.wunderground.com/
 [15]: http://www.weewx.com
 [16]: http://www.weewx.com/docs.html
 [17]: http://www.sqlite.org/
 [18]: http://www.weewx.com/docs/usersguide.htm#[Simulator]
 [19]: http://www.davisnet.com/weather/products/vantage-pro-professional-weather-stations.asp
 [20]: http://www.raspberrypi.org/products/model-b-plus/
 [21]: http://openweathermap.org/api
 [22]: http://en.wikipedia.org/wiki/Otterlo
 [23]: https://github.com/Geonovum/sospilot/blob/master/src/weewx/test/weatherapidriver.py
 [24]: https://github.com/Geonovum/sospilot/blob/master/src/weewx/test/weewx.conf
 [25]: http://www.cheetahtemplate.org/
 [26]: http://davies-barnard.co.uk/2014/01/weewx-byteweather-template
 [27]: http://sensors.geonovum.nl/weather/
