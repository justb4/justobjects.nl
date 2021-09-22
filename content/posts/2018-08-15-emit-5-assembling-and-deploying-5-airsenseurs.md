---
title: 'Emit #5 – Assembling and Deploying 5 AirSensEURs – a Story in Pictures'
author: Just van den Broecke
type: post
date: 2018-08-15T21:01:46+00:00
url: /emit-5-assembling-and-deploying-5-airsenseurs/
featured_image: uploads/2018/08/asenl-unbox-assemble-deploy-6-150x87.jpg
categories:
  - osgeo
  - Projects
  - smartemission
  - Software
tags:
  - airsenseur
  - GeoSpatial
  - SensorThings
  - SOS
  - SWE

---
This is Emit #5, in a [series of blog-posts around the Smart Emission Platform][14], an Open Source software component framework that facilitates the acquisition, processing and (OGC web-API) unlocking of spatiotemporal sensor-data, mainly for Air Quality and other environmental sensor-data like noise.

Summer holidays and a heat-wave strikes The Netherlands. Time for some lighter material mainly told in pictures. As highlighted in [Emit #2][1], I have the honor of doing a project for the [European Union Joint Research Centre][2]  (EU JRC), to deploy five [AirSensEUR][3] (ASE) boxes within The Netherlands, attaching these to the [Smart Emission Platform][4] in cooperation with [RIVM][5] (National Institute for Public Health and the Environment). The ASE boxes measure four Air Quality (AQ) indicators: NO2 (Nitrogen Dioxide), NO (Nitrogen Monoxide), O3 (Ozone) and CO (Carbon Monoxide) plus meteo (Temp, Humidity, Air Pressure) and GPS. Read more on ASE [in this article][6].

![ASE Architecture](/uploads/2018/08/ase-arch.jpg)
<!--
<div id="attachment_801" style="width: 996px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-801" loading="lazy" class="size-full wp-image-801" src="uploads/2018/08/ase-arch.jpg" alt="" width="986" height="771" srcset="https://justobjects.nl/wp-content/uploads/2018/08/ase-arch.jpg 986w, https://justobjects.nl/wp-content/uploads/2018/08/ase-arch-300x235.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/ase-arch-768x601.jpg 768w, https://justobjects.nl/wp-content/uploads/2018/08/ase-arch-150x117.jpg 150w" sizes="(max-width: 986px) 100vw, 986px" />

  <p id="caption-attachment-801" class="wp-caption-text">
    ASE Architecture
  </p>
</div>
-->

The ASE is an Open Hard/Software platform that can be configured with multiple brands/types of sensors. In the current case all four above mentioned AQ sensors are from [AlphaSense][7]. As these are relatively cheap sensors (< $100,-), the challenge is to have these calibrated before final deployment. This calibration is done by placing the ASE boxes first at an RIVM station, gather data for a month or two and then calibrate these sensors from official RIVM reference measurements at the same location. Using both the raw ASE data and the RIVM reference data the calibration &#8220;formulae&#8221; can be determined, before placing the ASEs at their final deployment locations around The Netherlands and have the Smart Emission Platform assemble/publish the (calibrated) data for the next year or so. More info on AirSensEUR via [this Google Search][8].

Ok, picture time!  Explanatory text is below each picture.

![1. ASEs unboxed](/uploads/2018/08/asenl-unbox-assemble-deploy-9.jpg)
<!--
<div id="attachment_787" style="width: 1034px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-787" loading="lazy" class="wp-image-787 size-full" src="uploads/2018/08/asenl-unbox-assemble-deploy-9.jpg" alt="" width="1024" height="768" srcset="https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-9.jpg 1024w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-9-300x225.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-9-768x576.jpg 768w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-9-150x113.jpg 150w" sizes="(max-width: 1024px) 100vw, 1024px" />

  <p id="caption-attachment-787" class="wp-caption-text">
    1. ASEs unboxed
  </p>
</div>
-->

Picture 1: Boxes arrived from EU JRC Italy on June 12, 2018. Assembling: upper left shows the (total of 20) AlphaSense sensors like &#8220;blisters&#8221; (Dutch &#8220;doordrukstrips&#8221;), the ASE box (with screwdrivers on top) and the protecting metal outer shield on the right.

![2. placing AlphaSense sensors in sockets](/uploads/2018/08/asenl-unbox-assemble-deploy-11.jpg)
<!--
<div id="attachment_788" style="width: 1034px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-788" loading="lazy" class="wp-image-788 size-full" src="uploads/2018/08/asenl-unbox-assemble-deploy-11.jpg" alt="" width="1024" height="784" srcset="https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-11.jpg 1024w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-11-300x230.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-11-768x588.jpg 768w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-11-150x115.jpg 150w" sizes="(max-width: 1024px) 100vw, 1024px" />

  <p id="caption-attachment-788" class="wp-caption-text">
    2. placing AlphaSense sensors in sockets
  </p>
</div>
-->

Picture 2: Very carefully placing the AlphaSense sensors in the ASE Sensor Shield (an Arduino-like board) without touching the top-membrane!

![3. All sensors firmly in their sockets](/uploads/2018/08/asenl-unbox-assemble-deploy-12.jpg)
<!--
<div id="attachment_790" style="width: 1034px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-790" loading="lazy" class="size-full wp-image-790" src="uploads/2018/08/asenl-unbox-assemble-deploy-12.jpg" alt="" width="1024" height="830" srcset="https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-12.jpg 1024w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-12-300x243.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-12-768x623.jpg 768w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-12-150x122.jpg 150w" sizes="(max-width: 1024px) 100vw, 1024px" />

  <p id="caption-attachment-790" class="wp-caption-text">
    3. All sensors firmly in their sockets
  </p>
</div>
-->

Picture 3: all sensors placed, attach current and next to network and other configuring!

![4. Boxes humming and connected via WIFI to the LAN](/uploads/2018/08/asenl-unbox-assemble-deploy-2.jpg)
<!--
<div id="attachment_791" style="width: 1034px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-791" loading="lazy" class="size-full wp-image-791" src="uploads/2018/08/asenl-unbox-assemble-deploy-2.jpg" alt="" width="1024" height="771" srcset="https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-2.jpg 1024w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-2-300x226.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-2-768x578.jpg 768w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-2-150x113.jpg 150w" sizes="(max-width: 1024px) 100vw, 1024px" />

  <p id="caption-attachment-791" class="wp-caption-text">
    4. Boxes humming and connected via WIFI to the LAN
  </p>
</div>
-->

Picture 4: On default startup (via touch buttons) the ASE will expose a default WIFI access point. This can be used to attach and to login at the &#8220;ASE Host Board&#8221;, a Raspberry Pi-like board running standard Linux Debian. SSH into each box and further configure e.g. the WIFI settings to become a WIFI client, first having all boxes connect to the local office WLAN.

![5. configured for InfluxDB Data Push visualized via Grafana](/uploads/2018/08/asenl-unbox-assemble-deploy-1.jpg)
<!--
<div id="attachment_792" style="width: 1034px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-792" loading="lazy" class="size-full wp-image-792" src="uploads/2018/08/asenl-unbox-assemble-deploy-1.jpg" alt="" width="1024" height="715" srcset="https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-1.jpg 1024w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-1-300x209.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-1-768x536.jpg 768w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-1-150x105.jpg 150w" sizes="(max-width: 1024px) 100vw, 1024px" />

  <p id="caption-attachment-792" class="wp-caption-text">
    5. configured for InfluxDB Data Push visualized via Grafana
  </p>
</div>
-->

Picture 5. Each box runs a Data Aggregator and can be configured to push data to a remote InfluxDB database. In our case we have setup a Smart Emission InfluxDB Data Collector where the (raw) data is received. This InfluxDB datastore is visualized using a Grafana Panel shown in the picture. We see the five boxes ASE\_NL\_01-05 sensing and pushing data!

![6. All packed and in trunk of my car](/uploads/2018/08/asenl-unbox-assemble-deploy-4.jpg)
<!--
<div id="attachment_795" style="width: 1034px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-795" loading="lazy" class="wp-image-795 size-full" src="uploads/2018/08/asenl-unbox-assemble-deploy-4.jpg" alt="" width="1024" height="633" srcset="https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-4.jpg 1024w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-4-300x185.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-4-768x475.jpg 768w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-4-150x93.jpg 150w" sizes="(max-width: 1024px) 100vw, 1024px" />

  <p id="caption-attachment-795" class="wp-caption-text">
    6. All packed and in trunk of my car
  </p>
</div>
-->

Picture 6. A good start, but next we need to go out and place the boxes at the RIVM station for a period of calibration. So tearing down, packing, all into the trunk of my car. Up to the RIVM station! July 30, 2018, Still 35 degrees C outside.

![7. The RIVM sensor station, right near the highway](/uploads/2018/08/asenl-unbox-assemble-deploy-3.jpg)
<!--
<div id="attachment_796" style="width: 1034px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-796" loading="lazy" class="size-full wp-image-796" src="uploads/2018/08/asenl-unbox-assemble-deploy-3.jpg" alt="" width="1024" height="613" srcset="https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-3.jpg 1024w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-3-300x180.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-3-768x460.jpg 768w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-3-250x150.jpg 250w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-3-150x90.jpg 150w" sizes="(max-width: 1024px) 100vw, 1024px" />

  <p id="caption-attachment-796" class="wp-caption-text">
    7. The RIVM sensor station, right near the highway
  </p>
</div>
-->

Picture 7. July 30, 2018, 13:00. Arrived at the RIVM station. Now to figure out how to attach the five boxes. The lower horizontal iron pole seems the best option. Put all soft/hardware knowledge away, now real plumbing is required!

![8. Could not have made this without the great help of Jan Vonk (RIVM)](/uploads/2018/08/asenl-unbox-assemble-deploy-5.jpg)
<!--
<div id="attachment_797" style="width: 1034px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-797" loading="lazy" class="size-full wp-image-797" src="uploads/2018/08/asenl-unbox-assemble-deploy-5.jpg" alt="" width="1024" height="598" srcset="https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-5.jpg 1024w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-5-300x175.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-5-768x449.jpg 768w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-5-150x88.jpg 150w" sizes="(max-width: 1024px) 100vw, 1024px" />

  <p id="caption-attachment-797" class="wp-caption-text">
    8. Could not have made this without the great help of Jan Vonk (RIVM)
  </p>
</div>
-->

Picture 8. Jan Vonk of RIVM, who also have deployed about 12 ASEs, placing the first boxes on the horizontal pole, so far so good.

![9. All five boxes attached!](/uploads/2018/08/asenl-unbox-assemble-deploy-6-1.jpg)
<!--
<div id="attachment_798" style="width: 1034px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-798" loading="lazy" class="size-full wp-image-798" src="uploads/2018/08/asenl-unbox-assemble-deploy-6-1.jpg" alt="" width="1024" height="596" srcset="https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-6-1.jpg 1024w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-6-1-300x175.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-6-1-768x447.jpg 768w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-6-1-150x87.jpg 150w" sizes="(max-width: 1024px) 100vw, 1024px" />

  <p id="caption-attachment-798" class="wp-caption-text">
    9. All five boxes attached!
  </p>
</div>
-->

Picture 9. All five boxes strapped to the pole. Jan Vonk doing the hard work. Next challenge: they need power and WIFI&#8230;

![10. Connecting to power&#8230;](/uploads/2018/08/asenl-unbox-assemble-deploy-7.jpg)
<!--
<div id="attachment_803" style="width: 1034px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-803" loading="lazy" class="wp-image-803 size-full" src="uploads/2018/08/asenl-unbox-assemble-deploy-7.jpg" alt="" width="1024" height="649" srcset="https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-7.jpg 1024w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-7-300x190.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-7-768x487.jpg 768w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-7-150x95.jpg 150w" sizes="(max-width: 1024px) 100vw, 1024px" />

  <p id="caption-attachment-803" class="wp-caption-text">
    10. Connecting to power&#8230;
  </p>
</div>
-->

Picture 10. One cannot have enough power sockets.

![11. Power supplies covered under plastic box](/uploads/2018/08/asenl-unbox-assemble-deploy-1-1.jpg)
<!--
<div id="attachment_804" style="width: 1034px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-804" loading="lazy" class="size-full wp-image-804" src="uploads/2018/08/asenl-unbox-assemble-deploy-1-1.jpg" alt="" width="1024" height="714" srcset="https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-1-1.jpg 1024w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-1-1-300x209.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-1-1-768x536.jpg 768w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-1-1-150x105.jpg 150w" sizes="(max-width: 1024px) 100vw, 1024px" />

  <p id="caption-attachment-804" class="wp-caption-text">
    11. Power supplies covered under plastic box.
  </p>
</div>
-->

Picture 11. Covering all power supply stuff under tightened box shielded from rain.

![12. Moment of truth starting up and attaching to local WIFI](/uploads/2018/08/asenl-unbox-assemble-deploy-8.jpg)
<!--
<div id="attachment_805" style="width: 1034px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-805" loading="lazy" class="size-full wp-image-805" src="uploads/2018/08/asenl-unbox-assemble-deploy-8.jpg" alt="" width="1024" height="606" srcset="https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-8.jpg 1024w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-8-300x178.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-8-768x455.jpg 768w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-8-150x89.jpg 150w" sizes="(max-width: 1024px) 100vw, 1024px" />

  <p id="caption-attachment-805" class="wp-caption-text">
    12. Moment of truth starting up and attaching to local WIFI
  </p>
</div>
-->

Picture 12. July 30, 2018, 17:00. Last challenge: booting up the boxes and have them connecting to the local RIVM station&#8217;s WIFI. I had pre-configured WLAN settings in each box, but this is always a moment of truth: will they connect? If they do they will start sampling and push their raw data to the Smart Emission Platform&#8230;Then we can start the calibration period. And success ... they connected!

![13. All boxes connected and sampling and pushing data](/uploads/2018/08/grafana-all-pushing.jpg)
<!--
<div id="attachment_807" style="width: 1034px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-807" loading="lazy" class="size-full wp-image-807" src="uploads/2018/08/grafana-all-pushing.jpg" alt="" width="1024" height="323" srcset="https://justobjects.nl/wp-content/uploads/2018/08/grafana-all-pushing.jpg 1024w, https://justobjects.nl/wp-content/uploads/2018/08/grafana-all-pushing-300x95.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/grafana-all-pushing-768x242.jpg 768w, https://justobjects.nl/wp-content/uploads/2018/08/grafana-all-pushing-150x47.jpg 150w" sizes="(max-width: 1024px) 100vw, 1024px" />

  <p id="caption-attachment-807" class="wp-caption-text">
    13. All boxes connected and sampling and pushing data.
  </p>
</div>
-->

Picture 13. Now on August 15, 2018, with minor hickups, and with great help from the JRC folks Marco Signorini and Michel Gerboles, we have all five boxes sampling and pushing data for the calibration period. The above plot shows raw NO2 data, to be calibrated.

![A next step for the RIVM Program &#8220;Together Measuring Air Quality&#8221;](/uploads/2018/08/samenmeten-tweet.jpg)
<!--
<div id="attachment_810" style="width: 596px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-810" loading="lazy" class="size-full wp-image-810" src="uploads/2018/08/samenmeten-tweet.jpg" alt="" width="586" height="427" srcset="https://justobjects.nl/wp-content/uploads/2018/08/samenmeten-tweet.jpg 586w, https://justobjects.nl/wp-content/uploads/2018/08/samenmeten-tweet-300x219.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/samenmeten-tweet-150x109.jpg 150w" sizes="(max-width: 586px) 100vw, 586px" />

  <p id="caption-attachment-810" class="wp-caption-text">
    A next step for the RIVM Program &#8220;Together Measuring Air Quality&#8221;.
  </p>
</div>
-->

So a good start! The heatwave is over, the next hard work is calibration. Why are we doing this? Well, like with meteorology, RIVM and others are stimulating Air Quality to be measured by basically anyone, from groups of civilians to individuals. For this RIVM has setup the program [&#8220;Samen meten aan Luchtkwaliteit&#8221;][9] (&#8220;Together measuring air quality&#8221;). Measuring Air Quality is not an easy task. We need to learn by doing, make mistakes, and spread knowledge gained. Both AirSensEUR and Smart Emission are therefore Open. Below some further links:

Smart Emission: [GitHub][10], [WebSite][11], [Documentation][12], and [Docker Images][13].

 [1]: https://justobjects.nl/emit-2/
 [2]: https://ec.europa.eu/info/departments/joint-research-centre_en
 [3]: https://airsenseur.org/
 [4]: http://data.smartemission.nl/
 [5]: https://www.rivm.nl/
 [6]: http://publications.jrc.ec.europa.eu/repository/bitstream/JRC109337/jrc109337_airsenseur_part_c_jrc_technical_report_inspire.pdf
 [7]: http://www.alphasense.com/
 [8]: https://www.google.com/search?q=airsenseur
 [9]: https://www.samenmetenaanluchtkwaliteit.nl/
 [10]: https://github.com/smartemission
 [11]: http://data.smartemission.nl
 [12]: http://data.smartemission.nl/docs
 [13]: https://hub.docker.com/u/smartemission/
 [14]: /category/smartemission/
