---
title: Dances with the GeoPython Tribe
author: Just van den Broecke
type: post
date: 2016-07-13T23:06:10+00:00
url: /dances-with-the-geopython-tribe/
featured_image: uploads/2016/07/gp0-150x131.jpg
categories:
  - osgeo
  - Software
tags:
  - basel
  - Cesium
  - FOSS
  - FOSS4G
  - gdal
  - geodjango
  - geonode
  - geop
  - GeoSpatial
  - GIS
  - grass
  - OSgeo
  - python
  - stetl

---
During June 21-24, 2016 I attended the very first [GeoPython Conference in Basel Switzerland][1]. This event was organized by the [Institute of Geomatics Engineering of the FHNW &#8211; University of Applied Sciences and Arts Northwestern Switzerland][2] and [PyBasel][3], the local Python User Group Northwestern Switzerland. In particular I should mention key-organizer  [Martin Christen][4] from FHNW. He and his team made this into a such a great event that GeoPython 2017 is already planned. About 130 people attended, most from Europe, but also from other continents.  For a TL;DR the conference website [www.geopython.net][5]  provides you all the details: not just the program, but also the &#8220;post-processing&#8221;: slides, photo&#8217;s ([on Flickr][6]) etc.  The conference also included time and resources (room, food, beverages) for code-sprints. One of the outcomes of the conference-survey was to establish a public GeoPython mailing list at python.org. Details: to subscribe, send mail to:  <u>[GeoPython-subscribe@python.org][28] </u>with the keyword &#8220;subscribe&#8221; in the subject, or use the web-interface: <https://mail.python.org/mm3/mailman3/lists/geopython.python.org/>.

{{< a-img data-href="http://www.geopython.net/" data-src="/uploads/2016/07/gp1-right.jpg" data-class="float_right" >}}

So why a dedicated GeoPython conference? IMHO Python makes more and more  sense for Open Source geospatial development. Not just for custom geo-scripting or glueing with e.g. [GDAL][7], or for developing plugins for [QGIS][8] and [GRASS][9], but more and more as a mature framework language for geospatial processing and  OGC services. The projects [PyWPS][10] and [PyCSW][11] are an example of the latter. To access OGC services from Python clients there is [OWSLib][12]. Upcoming geospatial CMS frameworks like [GeoNode][13] and the very recent  [Boundless Exchange][14], powered by GeoNode, show that Python has the potential to become &#8220;the new Java&#8221; within the Open Source geospatial world.

Did I say &#8220;Java&#8221;? Ok: did almost 20 years of Java, from the very first JDK somewhere in 95/96 (Applets!), through [Sun vs Microsoft over Java][15], from the heaviness of [J2EE/EJB][16]s, to the lighter weighings of [Spring][17], the settling of Java as a backend/server technology. Sidestep: &#8220;Java&#8221; seems to be a central keyword in my family&#8217;s ancestry: [my great-great grandfather was one of the first people in the world to drink a cup of Java][18] and also was one of the first to set foot on the Indonesian island of Java, being on the same ship with [Jan Pieterszoon Coen][19]. My grandfather lived for 20 years in [Malang][20] (East Java), working as a civil (Delft) engineer. But I am diverting. The colonial period was by times a violent (by the Dutch) episode in Dutch history, not to be proud of.

<a href="http://www.geopython.net/" target="_blank"><img loading="lazy" class="alignleft wp-image-667 size-medium" src="uploads/2016/07/gp2-300x280.jpg" alt="gp2" width="300" height="280" srcset="https://justobjects.nl/wp-content/uploads/2016/07/gp2-300x280.jpg 300w, https://justobjects.nl/wp-content/uploads/2016/07/gp2-161x150.jpg 161w, https://justobjects.nl/wp-content/uploads/2016/07/gp2-150x140.jpg 150w, https://justobjects.nl/wp-content/uploads/2016/07/gp2.jpg 578w" sizes="(max-width: 300px) 100vw, 300px" /></a>

&nbsp;

But times they are a-changing, technologies are evolving. I am happy these days to develop in Python (and JavaScript for the web-frontend). Like moving from C/C++ to Java back then, and now from Java to Python, what appeals to me: shortened development times, lesser lines of code  to debug and maintain, ease of deployment, a central repository ([PyPi][21]) , an independent, vibrant community and possibly more.  But again I am diverting, there are great and stable geo-products in Java like [GeoServer][22] I use daily. Diversity in programming languages is good. Someone ([Jody Garnett][23]?) posted somewhere about the C-tribe and Java-tribe within the Open Source geospatial world, but can&#8217;t find the reference. Back to the subject of this post!

&nbsp;

&nbsp;

Like said, the organizing team has done a great job postprocessing the event, to be found via [www.geopython.net][1] so listing all talks/workshops will not add value here. My overall feeling was that this conference, like the very first [FOSS4G in Lausanne][24] I attended in 2006, was the beginning of a global community. Above all this was also an event where folks with a shared interest met and conversed. Often at conferences one learns and shares the most during breaks and social gatherings. In short: I learned a lot, being a relative newcomer in the geospatial Python community: GeoNode, GeoDjango, Python with Grass, and much more. For example I learned about some general Python technologies like the  [Jupyter Notebook][25] that many presenters used. I found that many (like me) are using [Flask][26] for simple Python webapps/REST APIs. Flask expresses one of features I like about Python: minimalism.

I am grateful to the organizing team that I could [present Stetl][27] in the last session on the last day, since I submitted past the deadline. Luckily the room was still filled, though the cold beer was tempting just ahead. Mind: during the conference there was a heatwave, above 30 degrees C each day, yes in Switzerland. But all in all this was a very cool conference! Hope to see you at GeoPython 2017!

&nbsp;

&nbsp;

###

<div>
</div>

<div>
</div>

 [1]: http://www.geopython.net/
 [2]: http://www.fhnw.ch/habg/ivgi/
 [3]: http://www.meetup.com/PyBasel-Basel-Python-Meetup/
 [4]: https://www.linkedin.com/in/martinchristen
 [5]: http://www.geopython.net
 [6]: https://www.flickr.com/photos/144781014@N02/sets/72157667869241134/
 [7]: http://gdal.org
 [8]: http://docs.qgis.org/testing/en/docs/pyqgis_developer_cookbook/plugins.html
 [9]: https://grass.osgeo.org/
 [10]: http://pywps.org
 [11]: http://pycsw.org
 [12]: http://geopython.github.io/OWSLib/
 [13]: http://geonode.org
 [14]: http://boundlessgeo.com/exchange/
 [15]: https://en.wikipedia.org/wiki/Microsoft_Java_Virtual_Machine
 [16]: https://en.wikipedia.org/wiki/Enterprise_JavaBeans
 [17]: https://en.wikipedia.org/wiki/Spring_Framework
 [18]: https://en.wikipedia.org/wiki/Pieter_van_den_Broecke
 [19]: https://nl.wikipedia.org/wiki/Jan_Pieterszoon_Coen
 [20]: https://en.wikipedia.org/wiki/Malang
 [21]: https://pypi.python.org/pypi
 [22]: http://geoserver.org
 [23]: https://www.linkedin.com/in/jodygarnett
 [24]: http://2006.foss4g.org/
 [25]: http://jupyter.org/
 [26]: http://flask.pocoo.org/
 [27]: http://www.slideshare.net/justb4/geospatial-etl-with-stetl-geopython-2016
 [28]: mailto:GeoPython-subscribe@python.org
