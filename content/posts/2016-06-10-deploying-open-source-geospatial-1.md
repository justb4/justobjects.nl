---
title: 'Deploying Open Source Geospatial Software – Part 1: Challenges'
author: Just van den Broecke
type: post
date: 2016-06-10T01:03:36+00:00
url: /deploying-open-source-geospatial-1/
featured_image: uploads/2016/06/deploy-button-150x145.jpg
categories:
  - General
  - osgeo
  - Projects
  - Software
tags:
  - docker
  - FOSS4G
  - gdal
  - GeoSpatial
  - GIS
  - ogc
  - OSgeo
  - packaging

---
My blog has been quiet for some time. As many of us I&#8217;ve been busy doing projects, all involving Open Source Geo (OSGeo) software. Partly development, writing software, I love it, but also more and more in &#8220;what comes next&#8221;: deploying and maintaining &#8220;the application&#8221; with all of its dependencies. For this I have been using several &#8220;deployment strategies&#8221; I would like to share.  To be specific and for a TL;DR : over the years I went through custom compiles/installs, Debian/Ubuntu(GIS) package installation, writing Debian/RPM packages, using Puppet (not yet Chef), and now sitting on the [Docker][1] of the Bay. For many this last sentence may be gibberish, so I will try to sketch some context first. Calling this blog _Part 1_ also hopefully keeps me attached to the subject and writing as I have very good news. But today, &#8216;helas&#8217;, the bad and the ugly.

In terms of architecture I always prefer a &#8220;best-of-breed&#8221; selection of Open Source Geospatial (OSGeo) software components, rather than select a single platform/&#8221;Suite&#8221;. Nothing against Suites, this is a domain where  Open Source Geo providers, are, literally, &#8220;stacking up&#8221; against proprietary GIS providers. [Boundless][2], <a href="http://www.geo-solutions.it/" target="_blank">GeoSolutions</a>, [Geomajas][3], to name a few, have great platforms you should check out.  Because I like to dive deep into open source geospatial technology, trying to contribute where possible, even [writing some myself][4], and having experienced the pros and cons of each individual component, I tend to go for a best fit in a project. For example, for WMS/WFS I may apply [MapServer][5] or [GeoServer][6] or [deegree][7], for web clients [OpenLayers][8] or [Leaflet.][9] As for tiling, well, to be honest, nothing beats [MapProxy][10]. [GDAL][11] , [QGIS][12], [GRASS][13], [GeoNetwork][14] or [pycsw][15], I could go on. I am a huge fan of each of these projects, standing on the shoulders of giants when using their products.  It depends on the project&#8217;s requirements what I choose.

But going for a &#8220;best-of-breed&#8221; architecture, where a selection of Open Source Geospatial components is made, usually extended with custom software and configurations, creates challenges in deployment and maintenance. With the latter I mean: going into production (live) and maintaining the system for an N number of years through modifications and updates. &#8220;Getting it working&#8221; on a single system will often succeed, possibly after a great number of Google searches,  mailing list threads, then finally getting all components and dependencies installed, often by hand. In some cases even recompiling components, moving libraries, setting PATHs etc. At some point &#8220;it all works&#8221; but at the same time we enter the &#8220;don&#8217;t touch it&#8221;  phase. We have an &#8220;upgrading issue&#8221;, but doable on a single system/server.

To worsen this situation: most professional IT-departments employ a multi-step deployment-strategy. There is not just a single system where the application runs, but several systems, each dedicated to, and named after their phase in deployment. For example, governmental projects within The Netherlands often deploy &#8220;OTAP&#8221;. [OTAP][16] (in English [DTAP][17]) stands for Development, Test, Acceptance, Production. These are, often rigorously, separated computing infrastructures (servers, clients). An application with all its dependencies has to be deployed sequentially on/through each of these phases, sometimes called &#8220;pillars&#8221; (Dutch: zuilen). In many cases a direct connection between these systems is blocked by the IT-department.  In the simplest case, we have a Test and Production system. Hence, our carefully handcrafted system will have a major challenge getting from one pillar to the next.  But I am not finished yet, we have the &#8220;tribal thing&#8221; going on in Open Source Geospatial software. Let me expand.

Diversity is good. Also in software. Over the years Open Source Geospatial software has been developed using a plethora of programming languages. Each came with a variety of deployment systems. I am talking about Java, Python, JavaScript/NodeJS, C/C++, and recently Go. These languages usually have some kind of library and deployment technology. Take Java: for server side components we need to have an &#8220;J2EE Container&#8221;, in most cases Tomcat, and deploy _.war_ files (e.g. GeoServer or GeoNetwork). For Python and &#8220;CGI-able&#8221; components like MapServer, we may just need a CGI-server like Apache or Nginx.  Each of these products deploys in its own way, has its own method for maintaining its configuration and managing updates. In Dutch we call this a &#8220;Lappendeken&#8221;. The closest translation I found is a &#8220;patchwork&#8221;, that is to say a diverse deployment and maintenance system. Individual products may provide a &#8220;GUI&#8221; to manage configurations, stored in diverse ways, from single XML/YAML files to even databases. No way to manage these products in a uniform way. For an outsider, or a cynical proprietary GIS-provider, this all could be labeled, as &#8220;Open Source Geospatial (deployment) is a big mess&#8221;.

So dear readers,  sketching this bag of problems, in a positive sense: challenges, how we go from here? As I indicated, there is good news. The answer, my friend, lies in _abstraction. _Abstraction is the way that software technology has always progressed: from machine instructions to assembly and programming languages, through data structures, objects and classes. To components and packages. Coupling and cohesion is another progressing force: maximizing cohesion (do one thing good) and minimizing coupling (reduce dependencies). All in all I have been finding solutions to the above problems using very accessible technologies. In the next two parts I hope to expand on these further as I am picking just two (Deployment Strategies) for now. The first is [Debian Packaging][18] (with some [Puppet][19]), the second is [Docker][20]. In short: what to expect in my next two blogs (Part 2 and Part 3):

  * _**Debian Packaging:**_ writing Debian packages to maintain software and configuration in a multi-step deployment environment
  * _**Docker: **_building/maintaining Docker images but keep control (on host) over their configuration, state and functionality

Also with some telling images, as these are lacking in this post!

 [1]: http://docker.com
 [2]: http://boundlessgeo.com/
 [3]: http://www.geomajas.org
 [4]: https://github.com/justb4
 [5]: http://mapserver.org/
 [6]: http://geoserver.org
 [7]: http://deegree.org
 [8]: http://openlayers.org
 [9]: http://leaflet.org
 [10]: http://MapProxy.org
 [11]: http://gdal.org
 [12]: http://qgis.org
 [13]: http://grass.org
 [14]: http://geonetwork-opensource.org/
 [15]: http://pycsw.org/
 [16]: https://nl.wikipedia.org/wiki/OTAP
 [17]: https://en.wikipedia.org/wiki/Development,_testing,_acceptance_and_production
 [18]: https://wiki.debian.org/Packaging
 [19]: https://puppet.com/
 [20]: https://www.docker.com/