---
title: Tales from Topographic Lowlands
author: Just van den Broecke
type: post
date: 2015-05-08T00:20:28+00:00
url: /tales-from-topographic-lowlands/
featured_image: uploads/2015/05/nltopo-screens-150x83.jpg
categories:
  - osgeo
  - Projects
tags:
  - GIS
  - Map5.nl
  - NLExtract
  - openstreetmap
  - OpenTopo
  - OSgeo

---
As far as Open geo-data is concerned, the Netherlands goes through prosperous times: country-wide datasets for detailed topography ([BRT][11], [BGT][12]), buildings and addresses ([BAG][13]), 0.5m elevation data ([AHN2][14]) and many more are available for download. Even [3D-versions][15] for several of these datasets are upcoming. These and other nuggets can be found and downloaded via our national geo-portal: [PDOK][16]. The datasets are available also via OGC web services like WMS, WMTS, WCS and WFS, yes thanks also to [INSPIRE][17]. Having access to the raw data, in XML, GML and Lidar/LAS has stirred creativity and productivity within the Dutch OSGeo and OpenStreetMap communities. Thinking of the endless possibilities for combining these open datasets boggles the mind!

Without a fixed plan three activities have been emerging:

  1. Refinement: converting raw datasets to formats like PostGIS and GeoTIFF (ETL)
  2. Creation: using and combining these refined datasets to maps and imports
  3. Dissemination: making the results from 2) available as data and web-services

Looks like a subsidized EU-project, but in reality this work has been done by enthusiastic, but unpaid volunteers. I will try to give some illustration below.

**1. Refinement**

The [NLExtract][18] project has emerged to provide not only tools, but also downloads for processable formats of the above datasets. For example the Dutch Addresses and Buildings dataset (BAG) is a quite involved semi-GML dataset monthly downloadable as a 1.8 GB zipfile. The NLExtract project provides a [tool][19] to convert this dataset to a PostGIS schema and CSV (for addresses) and make these available for download at [data.nlextract.nl/bag][21]. Also the Dutch Base Topography (BRT, Top10NL) is [processed][20] in the same fashion. Upcoming are GeoTIFFs for the Dutch elevation (yes we have some heights!)  Lidar/LAS data.

![ ](/uploads/2015/05/nlextract.png)

**2. Creation**

This phase is more interesting, since here true creativity is happening. Two examples to illustrate.

![ ](/uploads/2015/05/osm-bag.png)

The Addresses and Buildings dataset was immediately of interest to the [Dutch OpenStreetMap community][3]. After much debate and careful planning a [structured import][22] has been performed.  This has enriched the Dutch OSM data enormously.

![ ](/uploads/2015/05/opentopo-1600-otterlo.png)

Now we get to even more visible results. [Jan-Willem van Aalst][23] is a Dutch mapmaker who has combined &#8220;the best of&#8221; several Dutch open datasets and OpenStreetMap data into a compelling series of beautiful maps under the name [OpenTopo][24]. His main tool is [QGIS][5]. You can see results on [his website][24]. But the story does not stop there. Thanks to the work of Frank Steggink who has processed raw Dutch elevation data (AHN2) into GeoTIFFs, Jan-Willem is also producing a very detailed (up to 0.625 m/px about 1:5000 scale) hillshade-map of our entire country.

![ ](/uploads/2015/05/relief-struct-500x300-1600.jpg)

In addition OpenTopo topography has been overlayed on the free Dutch areal imagery from PDOK tiles. Who needs Google Maps ;)?

![ ](/uploads/2015/05/openlufo-500-300.jpg)

**3. Dissemination**

So how are all these fine results shared? The OpenStreetMap database now contains all Dutch Addresses and Buildings and is always [visible on OpenStreetMap][8].

The OpenTopo maps of Jan-Willem are exported as GeoTIFFs via [data.nlextract.nl/opentopo][25]. But many users may need an online map, or may want a standard web/tiling service to integrate maps into their applications or use them in their GIS.

To cater for the latter I have launched the [Map5.nl][9] platform: to provide Dutch topography as standard web-services. Using a geo-stack built with [MapServer][26] and [MapProxy][27], the [OpenTopo and several other Dutch topomaps][28], also historical, are now available in most of the common web mapping protocols: WMTS, TMS, Google/OSM tiling and even WMS.

{{< a-img data-href="http://www.map5.nl" data-src="/uploads/2015/05/map5.nl_.png" >}}

I have been thinking hard how to offer these services with respect to payment. Similar to what Andy Allan with [www.thunderforest.com][29] provides for OSM maps, Map5.nl offers a free and a paid service.  Part of the subscription fees will flow back into the OpenTopo development.

![ ](/uploads/2015/05/nltopo.png)

The software and data behind the map5 services are still free. But to develop and maintain such a service and infrastructure has imminent costs. I hope that organizations within the Netherlands find the map5 services useful and are willing to pay the relatively small yearly fee to expose these maps on their websites publicly. The free service has some small advertisements now and then. After some stable amount of subscriptions these may also go away. You can view the current maps on the [NLTopo App][30], which should work on most current (HTML5) mobiles/tablets.

 [1]: uploads/2015/05/nlextract.png
 [2]: uploads/2015/05/osm-bag.png
 [3]: http://www.openstreetmap.nl
 [4]: uploads/2015/05/opentopo-1600-otterlo.png
 [5]: http://qgis.org
 [6]: uploads/2015/05/relief-struct-500x300-1600.jpg
 [7]: uploads/2015/05/openlufo-500-300.jpg
 [8]: http://www.openstreetmap.org/#map=18/52.10386/5.04983
 [9]: http://www.map5.nl
 [10]: uploads/2015/05/nltopo.png
 [11]: http://www.kadaster.nl/web/Themas/Registraties/brt.htm
 [12]: http://www.kadaster.nl/web/Themas/Registraties/bgt.htm
 [13]: https://www.kadaster.nl/bag
 [14]: http://www.ahn.nl/
 [15]: https://www.pdok.nl/nl/producten/pdok-downloads/basis-registratie-topografie/top10nl-3d
 [16]: https://www.pdok.nl
 [17]: http://inspire.ec.europa.eu/
 [18]: http://nlextract.nl
 [19]: https://github.com/opengeogroep/NLExtract/tree/master/bag
 [20]: https://github.com/opengeogroep/NLExtract/tree/master/top10nl/etl
 [21]: http://data.nlextract.nl/bag
 [22]: http://wiki.openstreetmap.org/wiki/BAGimport
 [23]: https://www.linkedin.com/in/janwillemvanaalst
 [24]: http://opentopo.nl/
 [25]: http;//data.nlextract.nl/opentopo
 [26]: http://mapserver.org
 [27]: http://mapproxy.org
 [28]: http://www.map5.nl/kaarten.html
 [29]: http://www.thunderforest.com/
 [30]: http://app.map5.nl/nltopo/
