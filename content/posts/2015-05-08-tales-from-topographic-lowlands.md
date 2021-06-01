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
As far as Open geo-data is concerned, the Netherlands goes through prosperous times: country-wide datasets for detailed topography (<a href="http://www.kadaster.nl/web/Themas/Registraties/brt.htm" target="_blank">BRT</a>, <a href="http://www.kadaster.nl/web/Themas/Registraties/bgt.htm" target="_blank">BGT</a>), buildings and addresses (<a href="https://www.kadaster.nl/bag" target="_blank">BAG</a>), 0.5m elevation data (<a href="http://www.ahn.nl/" target="_blank">AHN2</a>) and many more are available for download. Even <a href="https://www.pdok.nl/nl/producten/pdok-downloads/basis-registratie-topografie/top10nl-3d" target="_blank">3D-versions</a> for several of these datasets are upcoming. These and other nuggets can be found and downloaded via our national geo-portal: <a href="https://www.pdok.nl" target="_blank">PDOK</a>. The datasets are available also via OGC web services like WMS, WMTS, WCS and WFS, yes thanks also to <a href="http://inspire.ec.europa.eu/" target="_blank">INSPIRE</a>. Having access to the raw data, in XML, GML and Lidar/LAS has stirred creativity and productivity within the Dutch OSGeo and OpenStreetMap communities. Thinking of the endless possibilities for combining these open datasets boggles the mind!

Without a fixed plan three activities have been emerging:

  1. Refinement: converting raw datasets to formats like PostGIS and GeoTIFF (ETL)
  2. Creation: using and combining these refined datasets to maps and imports
  3. Dissemination: making the results from 2) available as data and web-services

Looks like a subsidized EU-project, but in reality this work has been done by enthusiastic, but unpaid volunteers. I will try to give some illustration below.

**1. Refinement**

The <a href="http://nlextract.nl" target="_blank">NLExtract</a> project has emerged to provide not only tools, but also downloads for processable formats of the above datasets. For example the Dutch Addresses and Buildings dataset (BAG) is a quite involved semi-GML dataset monthly downloadable as a 1.8 GB zipfile.  The NLExtract project provides a <a href="https://github.com/opengeogroep/NLExtract/tree/master/bag" target="_blank">tool</a> to convert this dataset to a PostGIS schema and CSV (for addresses) and make these available for download at <a href="http://data.nlextract.nl/bag" target="_blank">data.nlextract.nl/bag</a>. Also the Dutch Base Topography (BRT, Top10NL) is <a href="https://github.com/opengeogroep/NLExtract/tree/master/top10nl/etl" target="_blank">processed</a> in the same fashion. Upcoming are GeoTIFFs for the Dutch elevation (yes we have some heights!)  Lidar/LAS data.

[<img loading="lazy" class=" size-full wp-image-583 aligncenter" src="uploads/2015/05/nlextract.png" alt="nlextract" width="640" height="436" srcset="https://justobjects.nl/wp-content/uploads/2015/05/nlextract.png 640w, https://justobjects.nl/wp-content/uploads/2015/05/nlextract-300x204.png 300w, https://justobjects.nl/wp-content/uploads/2015/05/nlextract-220x150.png 220w, https://justobjects.nl/wp-content/uploads/2015/05/nlextract-150x102.png 150w" sizes="(max-width: 640px) 100vw, 640px" />][1]

**2. Creation**

This phase is more interesting, since here true creativity is happening. Two examples to illustrate.

[<img loading="lazy" class=" size-full wp-image-577 aligncenter" src="uploads/2015/05/osm-bag.png" alt="osm-bag" width="476" height="317" srcset="https://justobjects.nl/wp-content/uploads/2015/05/osm-bag.png 476w, https://justobjects.nl/wp-content/uploads/2015/05/osm-bag-300x200.png 300w, https://justobjects.nl/wp-content/uploads/2015/05/osm-bag-225x150.png 225w, https://justobjects.nl/wp-content/uploads/2015/05/osm-bag-150x100.png 150w" sizes="(max-width: 476px) 100vw, 476px" />][2]

The Addresses and Buildings dataset was immediately of interest to the [Dutch OpenStreetMap community][3]. After much debate and careful planning a <a href="http://wiki.openstreetmap.org/wiki/BAGimport" target="_blank">structured import</a> has been performed.  This has enriched the Dutch OSM data enormously.

[<img loading="lazy" class="  wp-image-573 aligncenter" src="uploads/2015/05/opentopo-1600-otterlo.png" alt="opentopo-1600-otterlo" width="472" height="323" srcset="https://justobjects.nl/wp-content/uploads/2015/05/opentopo-1600-otterlo.png 565w, https://justobjects.nl/wp-content/uploads/2015/05/opentopo-1600-otterlo-300x205.png 300w, https://justobjects.nl/wp-content/uploads/2015/05/opentopo-1600-otterlo-219x150.png 219w, https://justobjects.nl/wp-content/uploads/2015/05/opentopo-1600-otterlo-150x103.png 150w" sizes="(max-width: 472px) 100vw, 472px" />][4]

Now we get to even more visible results. <a href="https://www.linkedin.com/in/janwillemvanaalst" target="_blank">Jan-Willem van Aalst</a> is a Dutch mapmaker who has combined &#8220;the best of&#8221; several Dutch open datasets and OpenStreetMap data into a compelling series of beautiful maps under the name <a href="http://opentopo.nl/" target="_blank">OpenTopo</a>. His main tool is [QGIS][5]. You can see results on <a href="http://opentopo.nl/" target="_blank">his website</a>. But the story does not stop there. Thanks to the work of Frank Steggink who has processed raw Dutch elevation data (AHN2) into GeoTIFFs, Jan-Willem is also producing a very detailed (up to 0.625 m/px about 1:5000 scale) hillshade-map of our entire country.

[<img loading="lazy" class=" size-full wp-image-574 aligncenter" src="uploads/2015/05/relief-struct-500x300-1600.jpg" alt="relief-struct-500x300-1600" width="500" height="301" srcset="https://justobjects.nl/wp-content/uploads/2015/05/relief-struct-500x300-1600.jpg 500w, https://justobjects.nl/wp-content/uploads/2015/05/relief-struct-500x300-1600-300x181.jpg 300w, https://justobjects.nl/wp-content/uploads/2015/05/relief-struct-500x300-1600-250x150.jpg 250w, https://justobjects.nl/wp-content/uploads/2015/05/relief-struct-500x300-1600-150x90.jpg 150w" sizes="(max-width: 500px) 100vw, 500px" />][6]

In addition OpenTopo topography has been overlayed on the free Dutch areal imagery from PDOK tiles. Who needs Google Maps ;)?

[<img loading="lazy" class=" size-full wp-image-575 aligncenter" src="uploads/2015/05/openlufo-500-300.jpg" alt="openlufo-500-300" width="500" height="300" srcset="https://justobjects.nl/wp-content/uploads/2015/05/openlufo-500-300.jpg 500w, https://justobjects.nl/wp-content/uploads/2015/05/openlufo-500-300-300x180.jpg 300w, https://justobjects.nl/wp-content/uploads/2015/05/openlufo-500-300-250x150.jpg 250w, https://justobjects.nl/wp-content/uploads/2015/05/openlufo-500-300-150x90.jpg 150w" sizes="(max-width: 500px) 100vw, 500px" />][7]

**3. Dissemination**

So how are all these fine results shared? The OpenStreetMap database now contains all Dutch Addresses and Buildings and is always [visible on OpenStreetMap][8].

The OpenTopo maps of Jan-Willem are exported as GeoTIFFs via <a href="http;//data.nlextract.nl/opentopo" target="_blank">data.nlextract.nl/opentopo</a>. But many users may need an online map, or may want a standard web/tiling service to integrate maps into their applications or use them in their GIS.

To cater for the latter I have launched the <a href="http://www.map5.nl" target="_blank">Map5.nl platform</a>: to provide Dutch topography as standard web-services. Using a geo-stack built with <a href="http://mapserver.org" target="_blank">MapServer</a> and <a href="http://mapproxy.org" target="_blank">MapProxy</a>, the <a href="http://www.map5.nl/kaarten.html" target="_blank">OpenTopo and several other Dutch topomaps</a>, also historical, are now available in most of the common web mapping protocols: WMTS, TMS, Google/OSM tiling and even WMS.

[<img loading="lazy" class="aligncenter wp-image-578 size-full" src="uploads/2015/05/map5.nl_.png" alt="map5.nl" width="640" height="410" srcset="https://justobjects.nl/wp-content/uploads/2015/05/map5.nl_.png 640w, https://justobjects.nl/wp-content/uploads/2015/05/map5.nl_-300x192.png 300w, https://justobjects.nl/wp-content/uploads/2015/05/map5.nl_-234x150.png 234w, https://justobjects.nl/wp-content/uploads/2015/05/map5.nl_-150x96.png 150w" sizes="(max-width: 640px) 100vw, 640px" />][9]

I have been thinking hard how to offer these services with respect to payment. Similar to what Andy Allan with <a href="http://www.thunderforest.com" target="_blank">www.thunderforest.com</a> provides for OSM maps, Map5.nl offers a free and a paid service.  Part of the subscription fees will flow back into the OpenTopo development.

[<img loading="lazy" class=" size-full wp-image-579 aligncenter" src="uploads/2015/05/nltopo.png" alt="nltopo" width="640" height="410" srcset="https://justobjects.nl/wp-content/uploads/2015/05/nltopo.png 640w, https://justobjects.nl/wp-content/uploads/2015/05/nltopo-300x192.png 300w, https://justobjects.nl/wp-content/uploads/2015/05/nltopo-234x150.png 234w, https://justobjects.nl/wp-content/uploads/2015/05/nltopo-150x96.png 150w" sizes="(max-width: 640px) 100vw, 640px" />][10]

The software and data behind the map5 services are still free. But to develop and maintain such a service and infrastructure has imminent costs. I hope that organizations within the Netherlands find the map5 services useful and are willing to pay the relatively small yearly fee to expose these maps on their websites publicly. The free service has some small advertisements now and then. After some stable amount of subscriptions these may also go away. You can view the current maps on the <a href="http://app.map5.nl/nltopo/" target="_blank">NLTopo App</a>, which should work on most current (HTML5) mobiles/tablets.

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