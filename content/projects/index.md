---
title: Projects
author: Just van den Broecke
type: page
date: 2014-06-23T09:25:31+00:00
featured_image: uploads/2011/09/colorado-hiking-672x202.jpg

---
Just has initiated and participates in a number of Open Source projects, sometimes as part of research or interest, other times out of a need to develop a tool. Below is an overview of the main projects. Each project has its own project page. The most recent and active projects start from the top.

# Smart Emission

See the [Smart Emission website][6].

### Goal

Provide a complete Open Source platform to harvest, transform/calibrate (ETL), unlock (via OGC standards) and visualize environmental (Air Quality, Noise) sensor data.

### Comment

This project started in 2015 as an assignment from [Geonovum][1] for the [Smart Emission Nijmegen project][2] and is now (2018) progressing with adding [EU JRC AirSensEUR][3] sensor devices and hosting within [PDOK, the Dutch National GDI][4].

# GeoHealthCheck

See [GeoHealthCheck.org][10]

### Goal

GeoHealthCheck is a Python application to support monitoring OGC Web Services uptime and availability. Why? Because standard monitoring tools will not catch the subtleties of errors in OGC services. Just imagine WMS errors written in the returned image. There you are&#8230;

### Comment

This project was started by the great [Tom Kralidis][5]. I started joining the [GeoHealthCheck project on GitHub][7]  in 2016 with some patches (PRs), from there providing more substantial contributions.

# NLExtract

See [nlextract.nl][11].

### Goal

Develop an Open Source toolkit to extract, transform (ETL) and visualize Dutch open geo-datasets from their source (GML) data. Datasets are mainly those from the Dutch Key Registries (&#8220;Basisregistraties&#8221;) like Addresses and Buildings (BAG) and Topography (BGT and BRT/Top10NL).

### Comment

This project proceeded on an initial development of [BAGExtract+ from the Dutch Ministry of Intrastructure and Environment][12]. The project is done under the flag of the [OpenGeoGroep][13].

# Heron Mapping Client

See [heron-mc.org][14].

### Goal

Develop components/widgets for building advanced geo web-clients using the [GeoExt framework][15]. This project is hosted at [code.google.com/p/geoext-viewer][16].

### Comment

This project was initally co-developed with [Geodan][17], in particular to build a viewer within the [ESDIN][18] best practices for [INSPIRE][19].

# Stetl &#8211; Streaming ETL

See [stetl.org][20].

### Goal

Provide an ETL framework in Python geared at transforming complex/rich GML like INSPIRE and GML datasets, for example the national Dutch toposet (TOP10NL). Specify all ETL processing steps via a text configuration file (no programming). Integrate and use existing ETL-tools like GDAL/OGR, XSLT and PostGIS natively from within Python. Integrate with the [deegree WFS server][21] and a possible foundation framework for [nlextract.nl][22].

### Comment

This project came out of several iterations for ETL within the [inspire-foss.org][23] project. Basically

# INSPIRE-FOSS &#8211; Free and Open Source for INSPIRE

See [inspire-foss.org][23].

### Goal

Develop components for transformation and web services (WMS, WFS, CSW) that comply with the pan-European [INSPIRE directive][19] using Free and Open Source for Geospatial (FOSS4G). This project is hosted at [code.google.com/p/inspire-foss][24].

### Comment

This project was started as part of work on INSPIRE for the [Dutch Land Registry (Kadaster)][25], further propagated with [deegree][21]-developers from [lat/lon GmbH][26].

# GeoSkating

See <http://www.geoskating.com> and the [Google Group (Dutch)][27]

### Goal

Generate interactive, multimedial skate-maps through GPS and mobile phones. Upcoming is an Android application.

### Comment

One of my dearest projects. Involves a whole range of Java-technologies (J2ME, J2EE). See also a [Dutch newspaper (Volkskrant) article][28]

# GeoTracing

See <www.geotracing.com>.

### Goal

Create a generic platform for remote tracklogging and real-time tracing through GPS with mobile phones. See also GeoTracing example applications: <http://www.geoskating.com>, <http://www.geosailing.com> and [a geodrawing game][29].

# Pushlets

See <www.pushlets.com>.

### Goal

A HTTP-based public/subscribe framework. Event push to browser clients without using client-side Java. Pushlets are told to be the first (1999) implementation for the principles of COMET (see [ajaxian.com][30]).

### Comment

This project seems to attract many developers since a publication in [JavaWorld March, 2000][31].

# KeyWorx

See the [KeyWorx homepage][32]. This project ran until 2007.

### Goal

Develop a multi-user/multi-service/multi-channel application platform.

### Comment

KeyWorx was developed at [Waag Society][33] in Amsterdam.

# XBook

See [www.justobjects.org/xbook][34].

### Goal

Develop a toolset to generate HTML documentation from XML as a lightweight alternative to DocBook.

### Comment

This site has been written and generated using XBook&#8230;

# CowCatcher

See <http://www.justobjects.org/cowcatcher> and [SourceForge][9]

### Goals

Develop a toolset to generate HTML course materials from XML and provide content for Java training materials as a reusable repository of modules and lessons.

### Comment

This project has helped us to quickly assemble materials and provide [training][8] to our clients. There is a lot of free stuff like complete online Java courses, so check it out.

 [1]: http://www.geonovum.nl
 [2]: http://smartemission.ruhosting.nl/
 [3]: http://www.airsenseur.org/
 [4]: https://www.pdok.nl/
 [5]: http://www.kralidis.ca/
 [6]: http://data.smartemission.nl/
 [7]: https://github.com/geopython/GeoHealthCheck
 [8]: /jo/training
 [9]: http://sourceforge.net/projects/cowcatcher
 [10]: http://geohealthcheck.org
 [12]: http://bag.vrom.nl/de_bag_gebruiken/bag_extract__
 [13]: http://opengeogroep.nl/
 [14]: http://heron-mc.org/
 [15]: http://geoext.org/
 [16]: http://code.google.com/p/geoext-viewer
 [17]: http://www.geodan.nl/
 [18]: http://www.esdin.eu/
 [19]: http://inspire.jrc.ec.europa.eu/
 [20]: http://stetl.org/
 [21]: http://deegree.org/
 [22]: http://nlextract.nl/
 [23]: http://inspire-foss.org/
 [24]: http://code.google.com/p/inspire-foss
 [25]: http://www.kadaster.nl/
 [26]: http://www.lat-lon.de/
 [27]: http://groups.google.com/group/geoskating
 [28]: http://tinyurl.com/lugzyl
 [29]: http://www.n8spel.nl/
 [30]: http://ajaxian.com/archives/comet-a-new-approach-to-ajax-applications
 [31]: http://www.javaworld.com/jw-03-2000/jw-03-pushlet.html
 [32]: http://www.keyworx.org/
 [33]: http://www.waag.org/
 [34]: http://www.justobjects.org/xbook
