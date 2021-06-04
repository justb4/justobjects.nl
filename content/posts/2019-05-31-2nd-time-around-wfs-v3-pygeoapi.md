---
title: Second Time Around – WFS v3 and pygeoapi
author: Just van den Broecke
type: post
date: 2019-05-31T23:33:35+00:00
url: /2nd-time-around-wfs-v3-pygeoapi/
featured_image: uploads/2019/05/image-150x85.png
categories:
  - General
  - osgeo
  - Projects
  - Software
tags:
  - ogc
  - OSgeo
  - python
  - wfs

---
TLDR;

  * tired of the OGC WFS/GML/INSPIRE complexity mess
  * new spirit from [WFS v3 standard][1] and OGC REST API movement
  * title of this blog refers (YouTube): [Shalamar, The Second Time Around][2].
  * [pygeoapi][3] implements OGC REST APIs in Python
  * I joined [pygeoapi][3]
  * [pygeoapi][3] can unlock/proxy existing WFS v1,v2 and any OGR Source!

About 10 years ago, working on my first serious geospatial contract at [Dutch Kadaster][4], I was asked to investigate an emerging [OGC][5] standard called &#8220;WFS&#8221;, [Web Feature Service][6]. Providing a matrix of client-server interoperability was one of the expected outcomes. That is: which WFS-clients will happily fetch data from WFS server-products. I don&#8217;t have the actual outcome anymore, but I can recall: it was a very empty table: there were a few WFS server-implementations at the time: GeoServer, MapServer and deegree and some WFS clients, both Open Source and proprietary. In my recollection, only OpenLayers would interwork with the above three WFS servers. The rest had various interworking issues: around [EPSG][7]-encoding (three possible encodings!) and other vague GML issues. In short, it was a mess: remember, all we wanted to exchange were flat, table-like [Simple Features:][8] records with attributes and a single geometry (Point, Line, Polygon).

Later on, things became even worse: multiple WFS and GML versions. And not to mention [GML Application Schemas][9] like for [INSPIRE][10]. Plenty of work for WFS/GML experts, which I was considered one, but I felt cynical at some point. From my background as a software engineer at [AT&T/Lucent/Bell Labs][11], where I developed embedded software for the public [5ESS telephone exchange][12], **_over-engineering was considered bad practice_**.

Also from the perspective of the emerging [Agile movement][13]: **_&#8220;make the simplest thing that could possibly work&#8221;_**, this WFS/GML &#8216;beast&#8217; seemed untamable, driven by theoreticians who modeled the geospatial world from behind UML tools like [Enterprise Architect][14]. I attended numerous meetings between Dutch government organizations that had WFS/GML interworking problems. At some point I gave up: the intellectual challenges (and contracts!) were alluring, but the (geospatial) world wouldn&#8217;t progress like this. Though I used WFS and GML in many of my apps, I had a love-hate relationship with them, as a rule-of-thumb only the lowest denominator, WFS v1 and GLM2 had the most chances to interwork.

Until&#8230;back to the title of this blog. I grew up in the 70-s/80-s, so want to introduce this song. I hope the YouTube video below is embedded ok. Otherwise check out [this link from Shalamar, The Second Time Around][2].

{{< youtube xz4YQZ01Q_A >}}

Fast forward to 2019: we live in an API-world: REST, [Swagger][15], OpenApi. OGC became wiser: both in process and technology. Folks from the OSGeo Community, I must mention [Chris Holmes][16] here, advocated/pushed for a more collaborative/development-like standardization process, e.g. using GitHub over Word documents. A landmark OGC/W3C study called [&#8220;Spatial Data on the Web Best Practices&#8221;][17] recommended a more web-friendly approach.

Fast-fast forward, the above issues resulted in a brand new [WFS version 3 standard][1] under development: using both GitHub and the latest REST (Open)API technologies. Forget about WFS v1 and v2, GML v.whatever, and OWS in general with their **_tired GetCapabilities_**, this is a new road taken. Kudos to <a rel="noreferrer noopener" aria-label=" (opens in a new tab)" href="https://medium.com/@cholmes" target="_blank">Chris Holmes</a>, he words this better than me in this [Medium Article on WFS3][18].

So yes, what about this **_Second Time Around?_** Well I got attracted to WFS again (&#8220;in love&#8221; is not really appropriate for technology IMHO), for two reasons:

  1. the [WFS spec][1] and the folks/energy around it
  2. Open Source implementation of this standard in Python: [pygeoapi][3]

Python IMHO makes much much sense within the Open Source geospatial domain. For similar reasons as described above, like over-engineering (and Oracle!), I abandoned Java about 8 years ago.

So I joined the [pygeoapi][3] project. Not out of any commercial interest, but mainly out of an developer&#8217;s itch: this is useful, let&#8217;s see how this works out, a now small, but great community, several from my country, to work with.

About [pygeoapi][3]: currently the project is focused on WFS v3, but in general we attempt to implement multiple OGC REST APIs. Also, the project provides a plugin architecture: via **_Providers_**, where data can be fetched from any backend: remote services or local files. Check out our [demo server][19] which is updated constantly via the [pygeoapi GitHub repo][20] and [DockerHub][21].

![ ](/uploads/2019/05/image.png)
<!--
<figure class="wp-block-image">
<img loading="lazy" width="1024" height="578" src="https://justobjects.nl/wp-content/uploads/2019/05/image-1024x578.png" alt="" class="wp-image-886" srcset="https://justobjects.nl/wp-content/uploads/2019/05/image-1024x578.png 1024w, https://justobjects.nl/wp-content/uploads/2019/05/image-300x169.png 300w, https://justobjects.nl/wp-content/uploads/2019/05/image-768x433.png 768w, https://justobjects.nl/wp-content/uploads/2019/05/image-150x85.png 150w, https://justobjects.nl/wp-content/uploads/2019/05/image.png 1200w" sizes="(max-width: 1024px) 100vw, 1024px" /> </figure>
-->

Diving a bit deeper, one of my first contributions to this project was to add an [OGRProvider][22] that would fetch from any [GDAL/OGR Vector source][23], in particular a backend WFS. Partly from a vision: **_&#8220;Let&#8217;s free all those tired WFS-es out there&#8221;_**, but also practically: the Python GDAL/OGR bindings are so powerful, performant and reusable, saving lots of development time over developing specific Providers for GeoJSON, GeoPackage, SpatialLite, PostGIS, and even ESRI Shapefiles and FeatureServers. In theory, any OGR (Vector) Source can now be exposed via WFS v3 in [pygeoapi][3].

There&#8217;s lots of movement around WFS v3 and OGC REST APIs in general, where both standards makers and implementors interact. Like the [OGC API Hackathon][24] in June 2019, London (sold out now!). If you ever abandoned WFS v1/v2 it is time to reconcile now!

 [1]: https://github.com/opengeospatial/WFS_FES
 [2]: https://www.youtube.com/watch?v=xz4YQZ01Q_A
 [3]: https://pygeoapi.io/
 [4]: https://www.kadaster.nl/
 [5]: http://www.opengeospatial.org/
 [6]: https://en.wikipedia.org/wiki/Web_Feature_Service
 [7]: https://epsg.io/
 [8]: https://www.opengeospatial.org/standards/sfa
 [9]: https://en.wikipedia.org/wiki/Geography_Markup_Language
 [10]: http://inspire.ec.europa.eu/applicationschema
 [11]: https://en.wikipedia.org/wiki/Bell_Labs
 [12]: https://en.wikipedia.org/wiki/5ESS_Switching_System
 [13]: https://agilemanifesto.org/
 [14]: https://sparxsystems.com/products/ea/
 [15]: https://swagger.io/
 [16]: https://medium.com/@cholmes
 [17]: https://www.w3.org/TR/sdw-bp/
 [18]: https://medium.com/@cholmes/wfs-3-0-get-excited-yes-8e904fdbcc0
 [19]: https://demo.pygeoapi.io/
 [20]: https://github.com/geopython/pygeoapi
 [21]: https://cloud.docker.com/u/geopython/repository/docker/geopython/pygeoapi/
 [22]: https://github.com/geopython/pygeoapi/blob/master/pygeoapi/provider/ogr.py
 [23]: https://gdal.org/drivers/vector/index.html
 [24]: https://www.opengeospatial.org/OGCAPI_Hack2019
