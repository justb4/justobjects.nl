---
title: Projects
author: Just van den Broecke
type: page
date: 2023-05-15T09:25:31+00:00
featured_image: uploads/2011/09/colorado-hiking-672x202.jpg

---
Just has initiated and participates in a number of Open Source projects, sometimes 
as part of research or interest, other times out of a need to develop a tool.
To see what he is working on today, best is to visit his [GitHub Profile](https://github.com/justb4).

Below is an overview of the main projects. Each project has its own project page. 
The most recent and active projects start from the top. Warning: some links are stale.

# map5topo

map5topo is a new (2023) topographic digital map covering The Netherlands plus parts of bordering countries. 
The map5topo project started in April 2022 and is ongoing since.

See the [map5.nl website](https://map5.nl) 
and the [map5topo Newsletters #5 and later](https://us10.campaign-archive.com/home/?u=dc76804d91aeb81849bd5071c&id=53b2ade233) (sorry in Dutch).
Technical documentation the [map5topo website](https://map5topo.nl) 

Presentations (most recent first):

* **_"map5topo - A New&Fresh Topographic Map of The Netherlands" - [MaptimeAMS - Mapping the Future - October 12, 2023](https://www.meetup.com/maptime-ams/events/296554603)_** - [\[PDF Slides\]](https://files.justobjects.nl/presentation/maptime-2023/map5topo-maptime-2023.pdf).
* **_"map5topo - een nieuwe, frisse topokaart van Nederland" - [FOSS4GNL Middelburg - September 14, 2023](https://foss4g.nl)_** - [\[PDF Slides\]](https://files.justobjects.nl/presentation/foss4gnl-2023/map5topo-foss4gnl-2023.pdf).
* **_"map5topo - a New Topographic Map of The Netherlands" - [Geomob Barcelona - November 22, 2022](https://thegeomob.com/post/nov-22nd-2022-geomobbcn-details)_** - [\[PDF Slides\]](https://files.justobjects.nl/presentation/geomob-bcn-2022/map5topo.pdf).
* **_"Introducing map5topo - a new Topographic Map of The Netherlands" - Information Sessions - Oktober 5+6, 2022 - Online_** - [\[PDF Slides\]](https://files.justobjects.nl/presentation/map5topo-2022/221005-info-session.pdf).

### Goal

Develop a (the best!) topographic map of The Netherlands using both OpenStreetMap and Dutch Open Data in a "best-of" approach.
For Dutch Open Data using sources from Dutch Kadaster/PDOK: BAG, BRK, BRT, BGT, height data from AHN (hillshading and contour-lines),
road info from NWB (Rijkswaterstaat).

Map design by [Niene Boeijen](https://nieneb.nl/).

### Comment

This project was started in 2022 and is ongoing. 
Several of the projects mentioned below are used, in particular NLExtract for ETL.
This will become an Open Source project once the code and data ETL has been cleaned-up.

# Wegue

See the [Wegue website](https://meggsimum.github.io/wegue) 
and [GitHub project](https://github.com/meggsimum/wegue).

### Goal

Provide a Geo Viewer framework using the [VueJS JavaScript framework](https://vuejs.org/) combined with OpenLayers.
Essential is to be able to create a dedicated geo-viewer via configuration, i.e. without coding.

### Comment

This project was started by [Christian 'meggsimum' Mayer](https://meggsimum.de/). 
I joined around 2019, adding Docker support and some components. 

# pygeoapi

See the [pygeoapi website](https://pygeoapi.io)

### Goal

Provide a complete implementation, in Python, for all of 
the recent [OGC REST APIs](https://ogcapi.ogc.org/).

### Comment

This project was started by [Tom Kralidis][5]. 
Joined this project in 2019, see the motivation 
in [this blog post](https://justobjects.nl/2nd-time-around-wfs-v3-pygeoapi/). 
Now core developer and PSC member. Contributed a.o. the GDAL/OGR Driver, the logo and
the [pygeoapi demo website](https://demo.pygeoapi.io).

# Smart Emission

See the [Smart Emission website][6].

### Goal

Provide a complete Open Source platform to harvest, transform/calibrate (ETL), 
unlock (via OGC standards) and visualize environmental (Air Quality, Noise) sensor data.

### Comment

This project started in 2015 as an assignment 
from [Geonovum][1] for the [Smart Emission Nijmegen project][2] 
and is now (2018) progressing with adding [EU JRC AirSensEUR][3] 
sensor devices and hosting within [PDOK, the Dutch National GDI][4].

# GeoHealthCheck

See [GeoHealthCheck.org][10]

### Goal

GeoHealthCheck is a Python application to support monitoring OGC Web Services uptime and availability. Why? Because standard monitoring tools will not catch the subtleties of errors in OGC services. Just imagine WMS errors written in the returned image. There you are&#8230;

### Comment

This project was started by the great [Tom Kralidis][5]. I started joining the [GeoHealthCheck project on GitHub][7]  in 2016 with some patches (PRs), from there providing more substantial contributions.

# NLExtract

See [nlextract.nl][11].

### Goal

Develop an Open Source toolkit to extract, transform (ETL) and visualize Dutch open geo-datasets from their source (GML) data. Datasets are mainly those from the Dutch Key Registries (&#8220;Basisregistraties&#8221;) like Addresses and Buildings (BAG) and Topography (BGT and BRT/Top10NL).

### Comment

This project proceeded on an initial development of [BAGExtract+ from the Dutch Ministry of Intrastructure and Environment][12]. The project is done under the flag of the [OpenGeoGroep][13].

# Heron Mapping Client

See [heron-mc.org][14].

### Goal

Develop components/widgets for building advanced geo web-clients using the [GeoExt framework][15]. This project is hosted at [code.google.com/p/geoext-viewer][16].

### Comment

This project was initally co-developed with [Geodan][17], in particular to build a viewer within the [ESDIN][18] best practices for [INSPIRE][19].

# Stetl &#8211; Streaming ETL

See [stetl.org][20].

### Goal

Provide an ETL framework in Python geared at transforming complex/rich GML like INSPIRE and GML datasets, for example the national Dutch toposet (TOP10NL). Specify all ETL processing steps via a text configuration file (no programming). Integrate and use existing ETL-tools like GDAL/OGR, XSLT and PostGIS natively from within Python. Integrate with the [deegree WFS server][21] and a possible foundation framework for [nlextract.nl][22].

### Comment

This project came out of several iterations for ETL within the [inspire-foss.org][23] project. Basically

# INSPIRE-FOSS &#8211; Free and Open Source for INSPIRE

See [inspire-foss.org][23].

### Goal

Develop components for transformation and web services (WMS, WFS, CSW) that comply with the pan-European [INSPIRE directive][19] using Free and Open Source for Geospatial (FOSS4G). This project is hosted at [code.google.com/p/inspire-foss][24].

### Comment

This project was started as part of work on INSPIRE for the [Dutch Land Registry (Kadaster)][25], further propagated with [deegree][21]-developers from [lat/lon GmbH][26].

# GeoSkating

See <https://www.geoskating.com> and the [Google Group (Dutch)][27]

### Goal

Generate interactive, multimedial skate-maps through GPS and mobile phones. Upcoming is an Android application.

### Comment

One of my dearest projects. Involves a whole range of Java-technologies (J2ME, J2EE). See also a [Dutch newspaper (Volkskrant) article][28]

# GeoTracing

See <www.geotracing.com>.

### Goal

Create a generic platform for remote tracklogging and real-time tracing through GPS with mobile phones. See also GeoTracing example applications: <https://www.geoskating.com>, <https://www.geosailing.com> and [a geodrawing game][29].

# Pushlets

See <www.pushlets.com>.

### Goal

A HTTP-based public/subscribe framework. Event push to browser clients without using client-side Java. Pushlets are told to be the first (1999) implementation for the principles of COMET (see [ajaxian.com][30]).

### Comment

This project seems to attract many developers since a publication in [JavaWorld March, 2000][31].

# KeyWorx

See the [KeyWorx homepage][32]. This project ran until 2007.

### Goal

Develop a multi-user/multi-service/multi-channel application platform.

### Comment

KeyWorx was developed at [Waag Society][33] in Amsterdam.

# XBook

See [www.justobjects.org/xbook][34].

### Goal

Develop a toolset to generate HTML documentation from XML as a lightweight alternative to DocBook.

### Comment

This site has been written and generated using XBook&#8230;

# CowCatcher

See <https://www.justobjects.org/cowcatcher> and [SourceForge][9]

### Goals

Develop a toolset to generate HTML course materials from XML and provide content for Java training materials as a reusable repository of modules and lessons.

### Comment

This project has helped us to quickly assemble materials and provide [training][8] to our clients. There is a lot of free stuff like complete online Java courses, so check it out.

 [1]: https://geonovum.nl
 [2]: https://smartemission.ruhosting.nl/
 [3]: https://www.airsenseur.org/
 [4]: https://www.pdok.nl/
 [5]: https://www.kralidis.ca/
 [6]: https://data.smartemission.nl/
 [7]: https://github.com/geopython/GeoHealthCheck
 [8]: https://files.justobjects.nl/jo/training
 [9]: https://sourceforge.net/projects/cowcatcher
 [10]: https://geohealthcheck.org
 [12]: https://bag.vrom.nl/de_bag_gebruiken/bag_extract__
 [13]: https://opengeogroep.nl/
 [14]: https://heron-mc.org/
 [15]: https://geoext.org/
 [16]: https://code.google.com/p/geoext-viewer
 [17]: https://www.geodan.nl/
 [18]: https://www.esdin.eu/
 [19]: https://inspire.jrc.ec.europa.eu/
 [20]: https://stetl.org/
 [21]: https://deegree.org/
 [22]: https://nlextract.nl/
 [23]: https://inspire-foss.org/
 [24]: https://code.google.com/p/inspire-foss
 [25]: https://www.kadaster.nl/
 [26]: https://www.lat-lon.de/
 [27]: https://groups.google.com/group/geoskating
 [28]: https://tinyurl.com/lugzyl
 [29]: https://www.n8spel.nl/
 [30]: https://ajaxian.com/archives/comet-a-new-approach-to-ajax-applications
 [31]: https://www.javaworld.com/jw-03-2000/jw-03-pushlet.html
 [32]: https://www.keyworx.org/
 [33]: https://www.waag.org/
 [34]: https://www.justobjects.org/xbook
