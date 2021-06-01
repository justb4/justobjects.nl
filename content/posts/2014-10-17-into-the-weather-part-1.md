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
<div id="attachment_420" style="width: 310px" class="wp-caption alignright">
  <a href="http://lib.heron-mc.org/heron/latest/examples/simpletimeslider/"><img aria-describedby="caption-attachment-420" loading="lazy" class="wp-image-420 size-medium" src="uploads/2014/10/wms-time-heron-knmi-300x181.png" alt="wms-time-heron-knmi" width="300" height="181" srcset="https://justobjects.nl/wp-content/uploads/2014/10/wms-time-heron-knmi-300x181.png 300w, https://justobjects.nl/wp-content/uploads/2014/10/wms-time-heron-knmi-1024x617.png 1024w, https://justobjects.nl/wp-content/uploads/2014/10/wms-time-heron-knmi-250x150.png 250w, https://justobjects.nl/wp-content/uploads/2014/10/wms-time-heron-knmi-150x90.png 150w, https://justobjects.nl/wp-content/uploads/2014/10/wms-time-heron-knmi.png 1175w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p id="caption-attachment-420" class="wp-caption-text">
    WMS Time Example with GeoServer in Heron
  </p>
</div>

Tagging this post as &#8220;Part 1&#8221;  is ambitious. Beware: there is hardly any &#8220;geo&#8221; for now. In the coming time I hope to share some technical experiences with weather stations, weather software and ultimately exposing weather data via some open geospatial standards like <a href="http://mapserver.org/ogc/wms_time.html" target="_blank">OGC WMS(-Time)</a> as in [example image right][1], WFS and in particular <a href="http://en.wikipedia.org/wiki/Sensor_Observation_Service" target="_blank">SOS (Sensor Observation Service)</a>. The context is an exciting project with <a href="http://www.geonovum.nl/" target="_blank">Geonovum</a> in the Netherlands: to transform and expose (via web services and reporting) open/raw Air Quality data from <a href="http://www.rivm.nl/" target="_blank">RIVM </a>, the  Dutch <span style="color: #000000;">National Institute for Public Health and the Environment. The main link to this project is <a href="http://sensors.geonovum.nl" target="_blank">sensors.geonovum.nl</a>. All software is developed as FOSS <a href="https://github.com/Geonovum/sospilot" target="_blank">via a GitHub project</a>. There are already some results there. I may post on these later.</span>

[<img loading="lazy" class="alignleft wp-image-418 size-medium" src="uploads/2014/10/sospilot-screenshot-300x206.png" alt="sospilot-screenshot" width="300" height="206" srcset="https://justobjects.nl/wp-content/uploads/2014/10/sospilot-screenshot-300x206.png 300w, https://justobjects.nl/wp-content/uploads/2014/10/sospilot-screenshot-218x150.png 218w, https://justobjects.nl/wp-content/uploads/2014/10/sospilot-screenshot-150x103.png 150w, https://justobjects.nl/wp-content/uploads/2014/10/sospilot-screenshot.png 800w" sizes="(max-width: 300px) 100vw, 300px" />][2]

Within a sub-project the aim is to expose measurements from a physical weather station via standardized OGC web services like WMS, WFS and SOS.  As a first step I dived into the world of weather hardware and software, in particular their vivid open source/open data communities. A whole new world expanded to me. To no surprise: Location and The Weather are part of everyday life since the beginnings of humanity. <a href="http://openweathermap.org/" target="_blank">OpenWeatherMap</a> and <a href="http://www.wunderground.com/" target="_blank">Weather Underground</a> are just two of the many communities around open weather data. In addition there&#8217;s an abundance of FOSS weather software. Personal weather stations are measuring not just temperature but also pressure, humidity, rainfall, wind, up to UV radiation and are built [homebrew][3] or [bought for as cheap as $50,-. ][4]

<div id="attachment_417" style="width: 463px" class="wp-caption alignnone">
  <a href="uploads/2014/10/weather-hacking.png"><img aria-describedby="caption-attachment-417" loading="lazy" class="wp-image-417 " src="uploads/2014/10/weather-hacking-300x102.png" alt="Weather Hacking" width="453" height="154" srcset="https://justobjects.nl/wp-content/uploads/2014/10/weather-hacking-300x102.png 300w, https://justobjects.nl/wp-content/uploads/2014/10/weather-hacking-250x85.png 250w, https://justobjects.nl/wp-content/uploads/2014/10/weather-hacking-150x51.png 150w, https://justobjects.nl/wp-content/uploads/2014/10/weather-hacking.png 800w" sizes="(max-width: 453px) 100vw, 453px" /></a>
  
  <p id="caption-attachment-417" class="wp-caption-text">
    Weather Hacking
  </p>
</div>

Being a noob in weather soft/hardware technology I had to start somewhere and then go step-by-step. The overall &#8220;architecture&#8221; can be even depicted in text:

<pre>weather station --&gt; soft/middleware --&gt; web services + reporting</pre>

<div id="attachment_416" style="width: 310px" class="wp-caption alignright">
  <a href="http://www.davisnet.com/weather/products/vantage-pro-professional-weather-stations.asp"><img aria-describedby="caption-attachment-416" loading="lazy" class="wp-image-416 size-medium" src="uploads/2014/10/davis-vantage-pro2-300x188.jpg" alt="Davis Vantage Pro2 Weather Station" width="300" height="188" srcset="https://justobjects.nl/wp-content/uploads/2014/10/davis-vantage-pro2-300x188.jpg 300w, https://justobjects.nl/wp-content/uploads/2014/10/davis-vantage-pro2-238x150.jpg 238w, https://justobjects.nl/wp-content/uploads/2014/10/davis-vantage-pro2-150x94.jpg 150w, https://justobjects.nl/wp-content/uploads/2014/10/davis-vantage-pro2.jpg 600w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p id="caption-attachment-416" class="wp-caption-text">
    Davis Vantage Pro2 Weather Station
  </p>
</div>

Being more of a software person, I decided to start with the weather soft/middleware. Also, since Geonovum already owns a <a href="http://www.davisnet.com/weather/products/vantage-pro-professional-weather-stations.asp" target="_blank">Davis Vantage Pro2 Weather Station</a> and the <a href="http://www.raspberrypi.org/products/model-b-plus/" target="_blank">Raspberry Pi B+ </a>I plan to use is still underway&#8230;

From what I gathered, <a href="http://www.weewx.com" target="_blank">weewx</a> is the most widely used engine/framework within the weather FOSS community. Also the fact that it is written in Python with a very extensible architecture immediately settled my choice. Explaining weewx is a subject by itself but <a href="http://www.weewx.com/docs.html" target="_blank">very well documented</a>. I&#8217;ll try in a few sentences what weewx does:

  * collect current and archive weather station measurement data (drivers)
  * storing weather data (archive and statistics) in a database (<a href="http://www.sqlite.org/" target="_blank">SQLite</a> or MySQL)
  * submitting data to weather community services like <a href="http://www.wunderground.com/" target="_blank">Weather Underground</a>
  * creating formatted/templated reports for your local or remote website

Any of these functionalities is highly extensible through a configurable plugin architecture. The drivers support most common weather stations. Installing is a breeze, either in a local directory or via Linux package managers. Also note that weather data  have quite some different local units (Fahrenheit/Celsius, knots/meters etc). weewx will all take care of this.

So, not yet having access to a weather station, what could I do? One of the weather station drivers is the <a href="http://www.weewx.com/docs/usersguide.htm#[Simulator]" target="_blank">Simulator</a> which intelligently generates weather data for testing.

[<img loading="lazy" class="alignright wp-image-419 size-medium" src="uploads/2014/10/openweathermap-300x196.png" alt="openweathermap" width="300" height="196" srcset="https://justobjects.nl/wp-content/uploads/2014/10/openweathermap-300x196.png 300w, https://justobjects.nl/wp-content/uploads/2014/10/openweathermap-1024x670.png 1024w, https://justobjects.nl/wp-content/uploads/2014/10/openweathermap-228x150.png 228w, https://justobjects.nl/wp-content/uploads/2014/10/openweathermap-150x98.png 150w, https://justobjects.nl/wp-content/uploads/2014/10/openweathermap.png 1082w" sizes="(max-width: 300px) 100vw, 300px" />][5]Trying to have some real-world data I set out on what appeared to be a two-hour hack: create a weather station driver that obtains its data from an open weather API. There are many off course. I choose the <a href="http://openweathermap.org/api" target="_blank">OpenWeatherMap API</a> to get data in the area of our cabin in the woods near the place of <a href="http://en.wikipedia.org/wiki/Otterlo" target="_blank">Otterlo in the Netherlands.</a> Writing this hard-coded driver took just a few line of Python. The <a href="https://github.com/Geonovum/sospilot/blob/master/src/weewx/test/weatherapidriver.py" target="_blank">source code can be found here</a>.  To not overask the API, I&#8217;ve set the time interval to 2 minutes within the <a href="https://github.com/Geonovum/sospilot/blob/master/src/weewx/test/weewx.conf" target="_blank">weewx configuration file</a>. Also it would not be fair to report these values to any of the weather communities. If the weewx community is interested I can donate this software, with some generalization (e.g. URLvia config).

But all in all my first driver is still running fine in weewx. The main challenge was converting all the values between different metric systems. weewx allows and even encourages you to store all data in US metrics. All the reporting and conversion utilities will always allow you to show your local metric units.

[<img loading="lazy" class="alignleft wp-image-414 size-medium" src="uploads/2014/10/otterlo-weewx-report-300x275.png" alt="otterlo-weewx-report" width="300" height="275" srcset="https://justobjects.nl/wp-content/uploads/2014/10/otterlo-weewx-report-300x275.png 300w, https://justobjects.nl/wp-content/uploads/2014/10/otterlo-weewx-report-163x150.png 163w, https://justobjects.nl/wp-content/uploads/2014/10/otterlo-weewx-report-150x137.png 150w, https://justobjects.nl/wp-content/uploads/2014/10/otterlo-weewx-report.png 962w" sizes="(max-width: 300px) 100vw, 300px" />][6]As a Linux daemon now runs fine in our test system. It is time to show some results. weewx reporting is basically a website generated via <a href="http://www.cheetahtemplate.org/" target="_blank">Cheetah templates</a>. The default template is basic white on black. I found a nice template called <a href="http://davies-barnard.co.uk/2014/01/weewx-byteweather-template" target="_blank">Byteweather</a>. You can find my continuous weather report  here at <a href="http://sensors.geonovum.nl/weather/" target="_blank">sensors.geonovum.nl/weather</a>. Measurements are now building up thanks to the weewx archive database. Values are mostly matching Dutch weather station data. Expect for the rainfall&#8230;Surely we have lots of rain but not that much&#8230;

Next posting I hope to tell more about deploying the Raspberry Pi and connecting to the Geonovum Davis Weather station. Then there will be also more &#8220;geo&#8221; in the post, I promise!

&nbsp;

 [1]: http://lib.heron-mc.org/heron/latest/examples/simpletimeslider/
 [2]: uploads/2014/10/sospilot-screenshot.png
 [3]: http://www.zipfelmaus.com/blog/arduino-weather-shield-schematics-layout-code-everything-you-need/
 [4]: http://www.weathershop.co.uk/
 [5]: http://openweathermap.org/maps
 [6]: uploads/2014/10/otterlo-weewx-report.png