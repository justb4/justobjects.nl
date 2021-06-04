---
title: 'Emit #6 – AirSensEUR Calibration'
author: Just van den Broecke
type: post
date: 2019-02-19T16:23:52+00:00
excerpt: 'This is Emit #6, in a series of blog-posts around the Smart Emission Platform, an Open Source software component framework that facilitates the acquisition, processing and (OGC web-API) unlocking of spatiotemporal sensor-data, mainly for Air Quality and other environmental sensor-data like noise.'
url: /emit-6-airsenseur-calibration/
featured_image: uploads/2019/02/heron1-150x99.png
categories:
  - osgeo
  - Projects
  - smartemission
  - Software
tags:
  - airquality
  - GeoSpatial
  - iot
  - nijmegen
  - ogc
  - OSgeo
  - SensorThings
  - sensorweb
  - SOS
  - SWE
  - wms

---
This is Emit #6, in a [series of blog-posts around the Smart Emission Platform][15], an Open Source software component framework that facilitates the acquisition, processing and (OGC web-API) unlocking of spatiotemporal sensor-data, mainly for Air Quality and other environmental sensor-data like noise.

In [Emit #5 &#8211; Assembling and Deploying 5 AirSensEURs&#8230;][1], I described how , with the great help of Jan Vonk from RIVM, we placed five [AirSensEUR][2] (ASE) air quality stations at the RIVM reference site near the A2 Highway at Breukelen. For about 2.5 months raw data was gathered there while the RIVM station was gathering its data to be used as reference for calibration.

![ ](/uploads/2019/02/airsenseur-deploy-combined-s.jpg)
<!--
<img loading="lazy" class="aligncenter  wp-image-864" src="uploads/2019/02/airsenseur-deploy-combined-s-1024x537.jpg" alt="" width="555" height="291" srcset="https://justobjects.nl/wp-content/uploads/2019/02/airsenseur-deploy-combined-s.jpg 1024w, https://justobjects.nl/wp-content/uploads/2019/02/airsenseur-deploy-combined-s-300x157.jpg 300w, https://justobjects.nl/wp-content/uploads/2019/02/airsenseur-deploy-combined-s-768x403.jpg 768w, https://justobjects.nl/wp-content/uploads/2019/02/airsenseur-deploy-combined-s-150x79.jpg 150w" sizes="(max-width: 555px) 100vw, 555px" />
-->

Now &#8220;calibration&#8221; is a huge and increasingly important topic when using inexpensive sensors for measuring Air Quality. Within the Smart Emission project we have been applying [Artificial Neural Networks][3] to calibrate the gas-sensors within the Josene stations. See also the [SE documentation][4]. These sensors were so called [metaloxide (MICS) sensors from SGX Sensortech Limited][16].

The AirSensEURs contain [electrochemical sensors from AlphaSense][17]. Several sources like [RIVM][18], state that these sensors are more accurate (than metaloxide sensors), but at the same time need per-sensor calibration.

Within the ASE boxes the following four gas-sensors were applied:

  * NO2 (Nitrogen Dioxide): the [NO2-B43F][5], see [datasheet][6].
  * NO (Nitric Oxide): the [NO-B4][7], see [datasheet][8].
  * O3 (Ozone): the [OX_A431][9], see [datasheet][10].
  * CO (Carbon Monoxide): the [CO-A4][11], see [datasheet][12].

![The Gang of Four Sensors](/uploads/2018/08/asenl-unbox-assemble-deploy-12.jpg)
<!--
<div id="attachment_790" style="width: 358px" class="wp-caption aligncenter">
  <img aria-describedby="caption-attachment-790" loading="lazy" class=" wp-image-790" src="uploads/2018/08/asenl-unbox-assemble-deploy-12-300x243.jpg" alt="" width="348" height="282" srcset="https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-12-300x243.jpg 300w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-12-768x623.jpg 768w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-12.jpg 1024w, https://justobjects.nl/wp-content/uploads/2018/08/asenl-unbox-assemble-deploy-12-150x122.jpg 150w" sizes="(max-width: 348px) 100vw, 348px" />
  <p id="caption-attachment-790" class="wp-caption-text">
    The Gang of Four Sensors
  </p>
</div>
-->

The calibration to be applied is based on [Regression Analysis][13]. This and other calibration-methods have been investigated and evaluated for many types/brands of sensors by the EC-JRC team. Read all in this [landmark article][14] and other references there. 

![ ](/uploads/2019/02/field-calibration-article.png)
<!--
<img loading="lazy" class="wp-image-862 aligncenter" src="uploads/2019/02/field-calibration-article.png" alt="" width="404" height="251" srcset="https://justobjects.nl/wp-content/uploads/2019/02/field-calibration-article.png 665w, https://justobjects.nl/wp-content/uploads/2019/02/field-calibration-article-300x186.png 300w, https://justobjects.nl/wp-content/uploads/2019/02/field-calibration-article-150x93.png 150w" sizes="(max-width: 404px) 100vw, 404px" />
-->

The complete timeline was as follows. Each phase will be expanded below.

1. Aug 1, 2018 &#8211; Okt 9, 2018  
Raw ASE and RIVM reference data collection (Breukelen site)

2. Okt 10, 2018 &#8211; Nov 2, 2018  
All ASEs deployed at their target locations

3. Nov/dec 2018  
Calibration performed by Michel Gerboles at the EC-JRC lab 

4. Jan 2019  
Calibration formulas implemented in Smart Emission (SE) platform

5. Feb 2019  
All ASE calibrated gas-data continuously available via SE viewers/APIs

6. Feb 2019  
Analysis of the calibration ([SE Python Stetl][19]) implementation results

**ad 1)** The five ASE Boxes were mounted on a horizontal pole and connected to WIFI and current. As end-result all boxes were publishing their raw data to the SE InfluxDB Data Collector and were visible in the [SE Grafana raw data viewer][20].

![Configured for InfluxDB Data Push visualized via Grafana](/uploads/2018/08/asenl-unbox-assemble-deploy-1.jpg)

**ad 2)** The picture below shows ASE_NL_01 (left above) through _05 clockwise at their deployment sites. ASE_03 and 04 (right below) were at a single location.

![ ](/uploads/2019/02/ase-nl-1-5-deployed.jpg)

ASE_NL 01 was deployed at an RIVM site in Nijmegen. This allowed us to verify its calibration with different reference data as with which it was calibrated! See below.

![ ](/uploads/2019/02/deployment-map-s.jpg)

**ad 3)** The calibration was performed by EC-JRC (M. Gerboles) using R and ShinyR webapp. All sources can be found in this [EC-JRC GitHub repo][21]. This process is quite intricate and a bit hard to explain in the context of a blog-post paragraph. I&#8217;ll try a summary:

Sensor values are digital readings (0..65535). This is effected by the electrical circuitry within each ASE, for optimal gain. To calculate back to mV and nA a per-sensor (brand+type) calculation is required first before applying any regression formula. A bit is explained in the image below.

![ ](/uploads/2019/02/readings-vref.jpg)

The second outcome is a per-individual-sensor regression formula. This is for most sensors a linear equation. For O3 (OX_A431) the formula is polynomial, as O3 readings are influenced by NO2 concentration. Below is an example as later implemented in Python using [SE Stetl ETL][19]

![ ](/uploads/2019/02/calibration-formulae.jpg)

The main three outcomes of the calibration are:

* the parameters for digital to nA calculation (per sensor brand+type)
* the linear (polynomial) equations for nA to concentration (ug/m3)
* the per-individual-sensor parameters (a0-a3)

![ ](/uploads/2019/02/scatterplots-asenl03.jpg)

Above some scatterplots made for ASE Box 3 NO2 and O3.

**ad 4)** Knowing all equations and their parameters from step 3 above, I attempted to integrate this in the continuous ETL within the Smart Emission Platform. Up to now the platform supported only a single sensor station type: the Intemo Jose(ne). As the platform is fed by harvesting raw data from a set of remote APIs provided by Data Collectors, it was relatively easy to add sensor(-station)-metadata and extend the Refiner ETL to apply calibration algorithms driven by that metadata. 

So for Josene stations the existing ANN calibration would still be applied, while for ASE stations per-sensor linear equations would be performed. All parameterization was already configurable using the [Device, DeviceDefs, DeviceFuncs][22] abstractions in the [SE Stetl implementation][19]. Recently, to allow stations that already send calibrated values, I introduced the [Vanilla Device][23] starting with harvesting [Luftdaten.info][24] stations (more in a later post).

The formula&#8217;s as applied in Python SE Stetl are as follows:

```
STEP 1a - Digital to Voltage (V)
V = (Ref - RefAD) + (Digital+1) /2^16 x 2 x RefAD
```

```
STEP 1b - Voltage (V) to Ampere (I) as Ri
I = 10^9 V/(Gain x Rload)
```

```
STEP 2 - Ampere (I) to concentration (ug/m3) - Example
I=a0+a1*NO2+a2*T
```

```
==> NO2 = (I - a0 - a2 * T) / a1
a0-a2 has specific values for each NO2-B43F sensor.
```

Now that these formulas and their parameters were implemented, near-realtime values could be made visible in all SE apps (viewers) and APIs such as the [SmartApp][25] and the [Heron Viewer][26].

{{< a-img data-href="https://data.smartemission.nl/smartapp/" data-src="/uploads/2019/02/smartapp-ase01-nijmegen.png" >}}

Within the Heron Viewer we can compare for example NO2, not only with Josene measurements, but also with official RIVM values.

![ ](/uploads/2019/02/heron1.png)

Also the data is available through all [SE OGC APIs][27], for example the [SensorThings API][28].


**ad 6)** The moment of truth! How well does the SE-based SE Stetl Python calibration results fit with the original RIVM values? One of the advantages of Data Harvesting (opposed to data push) is that we can switch back in time, i.e. restart harvesting from a given date. Harvesting and continuous calibration was restarted from august 1, 2018, the start of the calibration period at the RIVM station. Using a Grafana panel that displays both RIVM and SE-calculated values we can graphically see how well the data aligns.

![ ](/uploads/2019/02/breukelen-grafana.jpg)

What we can see from the above image, is that visually the data aligns very well, here for NO2. The purple graph is the official RIVM measurement. Only station ASE NL 02 is not completely aligned.


To also have some numeric proof and a more objective comparison, I dived in scatterplot and numerical analysis in Python. Apart from scatterplots that show calculated (Y) agains RIVM ref values (X) I calculated the [&#8220;R-squared&#8221;][29] and &#8220;slope&#8221; for fitting indicator values. This was also my first serious use of Python libs like Scipy, Pandas, Seaborn and Numpy (you&#8217;re never too old to become a data-scientist!).

As all SE calibrated data is also stored in InfluxDB with RIVM refdata harvested from their SOS, it was easy to fetch values for the plots/calculations.

Objectivity could be effected since station ASE NL 01 was finally deployed (okt 2018) in Nijmegen, also next to an RIVM station. So the calibration calculations from RIVM refdata in Breukelen could be compared to &#8220;Nijmegen&#8221;. The implementation for making these scatterplots can be found [here][30]. Lets look at some results, mainly for NO2, as I consider this one of the most important AQ indicator gasses.

![ ](/uploads/2019/02/nijm-ruy-no2-ASE_NL01-2018-12-25-2019-01-24.png)

I like this image a lot as it shows an almost ideal alignment with an R2 of 0.976 and slope of almost 1. Mind: calibration was thus done at a very different site (about 80 km west) and AQ condition (highway) as the deployment (city street). 

![ ](/uploads/2019/02/asenl01-se-pycal-plots.png)

Above are plots for the other gasses as well. First row in Breukelen (no ref CO available in RIVM SOS), front row in Nijmegen. Only NO in Nijmegen is a bit problematic.

![ ](/uploads/2019/02/breuk-sw-no2-ASE_NL_All-2018-09-10-2018-10-09.png)

To close off: this last image above shows NO2 fit at the Breukelen station for all five ASE boxes. Also quite good.


What to conclude? First of all AirSensEUR is a major step forward in affordable accurate AQ sensing. We hope to expand the community.

AlphaSense NO2 electrochemical sensors appear quite accurate, but calibration requires quite some effort, plus calibration formulas apply per individual sensor. Would automatic per-sensor ANN be less time-consuming and still accurate? Something I would like to investigate.

The Smart Emission project and platform is still going strong, running within a Kubernetes Cloud maintained by Dutch Kadaster.

Next emit will discuss how I integrated data from the amazing Luftdaten.info project for the municipality of Nijmegen.

 [1]: /emit-5-assembling-and-deploying-5-airsenseurs/
 [2]: https://airsenseur.org/
 [3]: https://en.wikipedia.org/wiki/Artificial_neural_network
 [4]: https://smartplatform.readthedocs.io/en/latest/calibration.html
 [5]: http://www.alphasense.com/index.php/products/nitrogen-dioxide/
 [6]: http://www.alphasense.com/WEB1213/wp-content/uploads/2018/12/NO2B43F.pdf
 [7]: http://www.alphasense.com/index.php/products/nitric-oxide-safety/
 [8]: http://www.alphasense.com/WEB1213/wp-content/uploads/2015/03/NO-B4.pdf
 [9]: http://www.alphasense.com/index.php/products/ozone-2/
 [10]: http://www.alphasense.com/WEB1213/wp-content/uploads/2018/12/OXA431.pdf
 [11]: http://www.alphasense.com/index.php/products/carbon-monoxide-safety/
 [12]: http://www.alphasense.com/WEB1213/wp-content/uploads/2017/01/COA4.pdf
 [13]: https://en.wikipedia.org/wiki/Regression_analysis
 [14]: https://www.sciencedirect.com/science/article/pii/S092540051500355X
 [15]: /categories/smartemission/
 [16]: https://sgx.cdistore.com/products/sgx-sensortech/metaloxide-gas-sensor
 [17]: http://www.alphasense.com/index.php/safety/products/
 [18]: https://www.samenmetenaanluchtkwaliteit.nl/sensoren-voor-no2
 [19]: https://github.com/smartemission/docker-se-stetl/
 [20]: https://data.smartemission.nl/grafana-dc/d/HVSBmbHmz/airsenseur-netherlands-deploy
 [21]: https://github.com/ec-jrc/airsenseur-calibration
 [22]: https://github.com/smartemission/docker-se-stetl/tree/mast
 [23]: https://github.com/smartemission/docker-se-stetl/blob/master/smartem/devices/vanilla.py
 [24]: https://luftdaten.info
 [25]: https://data.smartemission.nl/smartapp/
 [26]: https://data.smartemission.nl/heron/
 [27]: https://data.smartemission.nl/data
 [28]: https://en.wikipedia.org/wiki/SensorThings_API
 [29]: https://en.wikipedia.org/wiki/Coefficient_of_determination
 [30]: https://github.com/smartemission/smartemission/tree/master/etl/calibration
