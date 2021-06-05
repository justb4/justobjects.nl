---
title: 3D Geospatial – Free and Open Source Software v0
author: Just van den Broecke
type: post
date: 2015-01-28T11:52:34+00:00
excerpt: 'These are notes I keep within Evernote as part of the 3D Geospatial Notebook whose public link is: https://www.evernote.com/pub/justb4ever/3d-geospatial. This is an experiment using Zapier to sync Evernote to Wordpress.'
url: /3d-geospatial-foss-v0/
featured_image: uploads/2015/01/tangram-150x90.png
categories:
  - osgeo
  - Software
tags:
  - 3D
  - 3DPS
  - Cesium
  - D3JS
  - FOSS
  - FOSS4G
  - gdal
  - GeoSpatial
  - ogc
  - OpenLayers
  - OSgeo
  - OSLandia
  - PostGIS
  - ThreeJS

---
This is my list of FOSS products for 3D Geospatial with a focus on web technology/WebGL and Open Standards. These are notes I keep within Evernote as part of the 3D Geospatial Notebook whose public link is: <https://www.evernote.com/pub/justb4ever/3d-geospatial>. This is also the first experiment to auto sync Evernote to WordPress using Zapier, so beware of any glitches in formatting! I am sure I have missed many other great products. Let me know!

### OSLandia

OSLandia from Paris, France  is one of the most active companies contributing to 3D Geospatial FOSS.
<http://www.oslandia.com/>


<http://www.oslandia.com/postgis-3d-foss4g-video-and-workshop-en.html>


&#8211; The latest PostGIS and QGIS 3D enhancements presented at [FOSS4G][1] by Oslandia &#8211; GIS goes 3D : an OpenSource stack &#8211; Olivier Courtin &#8211; FOSS4G 2014

<http://vimeo.com/106846660>



### Cesium

&#8211; General

_&#8220;Cesium is a JavaScript library for creating 3D globes and 2D maps in a web browser without a plugin. It uses WebGL for hardware-accelerated graphics, and is cross-platform, cross-browser, and tuned for dynamic-data visualization. Cesium is open source under the Apache 2.0 license. It is free for commercial and non-commercial use.&#8221;_

![ ](/uploads/2015/01/cesium.png)

<http://cesiumjs.org/>  
<http://cesiumjs.org/presentations/Rendering%20the%20Whole%20Wide%20World%20on%20the%20World%20Wide%20Web.pdf> great presentation


&#8211; Cesium Terrain Service Preparation  
<https://github.com/giohappy/gdal2cesium>  
<https://github.com/kaktus40/Cesium-GeoserverTerrainProvider>


&#8211; Creating 3D terrains with Cesium &#8211; Bjørn Sandvik  
<http://blog.thematicmapping.org/2014/10/3d-terrains-with-cesium.html>


&#8211; Migrating from Google Earth to Cesium  
_This is a guest post by Greg Angevine, Founder of [Cube Cities Inc][2]. His company has used the Google Earth plugin for years and has recently built impressive work with Cesium (like [this][3])_  
<http://cesiumjs.org/2015/01/27/Migrating-from-Earth-to-Cesium/>


&#8211; Cesium and OpenLayers3  
Cesium has a real focus on (OGC) standards and integrating with software implementing OGC standards. I heard that the Cesium-folks are even proposing additions to OGC 3D standards (CZML? or the very compact terrain tiling using quantized mesh?). That would be great in concert with/as payload for the upcoming 3DPS (3D Portrayal Service) standard.

![ ](/uploads/2015/01/cesium-ol3.png)

<http://openlayers.org/ol3-cesium/>


&#8211; My Cesium experiments with Dutch OpenTopo tiles and Top10NL-3D Vector

![ ](/uploads/2015/01/cesium-just.png)

<http://app.nlextract.nl/3d/>


&#8211; My Cesium experiments with Cesium-OpenLayers3 Integration using Dutch Topo Top10NL-3D Vector

![ ](/uploads/2015/01/cesium-ol3-just.png)

<http://app.nlextract.nl/3d/>



### Tangram

From the folks from [MapZen][4] who make much more cool stuff: _&#8220;Tangram is a library for rendering 2D & 3D maps with WebGL, using GeoJSON/TopoJSON or binary vector tiles.&#8221;_

![ ](/uploads/2015/01/tangram.png)

<https://github.com/tangrams/tangram>  
<https://mapzen.com/tangram> (demo)


### D3JS
&#8211; General

![ ](/uploads/2015/01/d3js.png)

_&#8220; **D3.js** is a JavaScript library for manipulating documents based on data. **D3** helps you bring data to life using HTML, SVG and CSS. D3’s emphasis on web standards gives you the full capabilities of modern browsers without tying yourself to a proprietary framework, combining powerful visualization components and a data-driven approach to DOM manipulation.&#8221;_  
<http://d3js.org/> &#8211;


&#8211; Kind of 3D with D3 &#8211; Maps for the Web  
<http://www.web-maps.com/gisblog/?p=1370>


&#8211; Creating Charts and Legends for 3D Atlas Maps &#8211; A Mashup of D3.js, osgEarth, and the Chromium Embedded Framework — Raimu  
<http://vimeo.com/106234276>


### PostGIS

PostGIS has many 3D facilities. Check these out.

&#8211; Lidar/Pointclouds in PostGIS:
<https://github.com/pgpointcloud/pointcloud>  
<http://workshops.boundlessgeo.com/tutorial-lidar/> (tutorial)  
<http://s3.cleverelephant.ca/foss4gna2013-pointcloud.pdf> (paul ramsey slides)  
<http://boundlessgeo.com/2013/11/manage-lidar-postgis/>


&#8211; TIN Support  
<https://smathermather.wordpress.com/2013/12/18/2-5d-tins-in-postgis/> and  
<https://github.com/smathermather/postgis-etc/blob/master/3D/AsTin.sql> &#8211; create TINs with [ST_DelaunayTriangles][5]  
<http://www.oslandia.com/full-spatial-database-power-in-2-lines-en.html>  
also check: GRASS: <http://grass.osgeo.org/grass70/manuals/addons/v.delaunay3d.html>


&#8211; X3D Generation  
<http://postgis.net/docs/ST_AsX3D.html>


&#8211; 3ddb for PostGIS (CityGML)  
<http://www.3dcitydb.org/>  
<https://github.com/3dcitydb> GitHub  
<http://www.3dcitydb.org/3dcitydb/fileadmin/downloaddata/3dcitydb-v2_0_6-postgis-tutorial.pdf>


&#8211; A New Dimension To PostGIS : 3D &#8211; [Olivier Courtin][6] (Oslandia) with [Hugo Mercier][7] (Oslandia)  
<http://2013.foss4g.org/conf/programme/presentations/7/index.html>  
<http://www.slideshare.net/SimeonNedkov/postgis-3d-implementation>  
<https://www.youtube.com/watch?v=tQbE6B8JaHI>


&#8211; PostGIS and CGAL
CGAL <https://www.cgal.org/> and <https://smathermather.wordpress.com/2013/12/05/postgis-with-sfcgal-videos-how-did-i-miss-these-videos/>  
SFCGAL <http://www.sfcgal.org/> &#8220; _SFCGAL_ is a C++ wrapper library around _[CGAL][8] with the aim of supporting ISO 19107:2013 and [OGC Simple Features Access 1.2][9] for 3D operations.&#8221;_


&#8211; Other PostGIS 3D Stuff  
_&#8220;This post explains how to setup a powerful spatial data store (PostGIS) with a wide range of features (SFCGAL, PgRouting, PostgreSQL PointCloud, PDAL)&#8220;_  
<http://www.oslandia.com/full-spatial-database-power-in-2-lines-en.html>

<http://postgis3d.blogspot.nl/> (Camp2Camp &#8211; 2007 &#8211; by Mathieu ..?)


### XNavigator

_&#8220;XNavigator is an interactive 3D viewer and integrated client for exploring virtual city and landscape models. Instead of defining its own proprietary communication protocols, open OGC standards are used. The Open Geospatial Consortium (OGC) defines standards for accessing spatial information over the internet.  The main 3D content is downloaded from a Web 3D Service (W3DS)._

_Additional OGC services which can be accessed include:_  
_- Web Map Service (WMS)_  
_- Open Location Services (OpenLS) including Route Service, Directory Service, and Geocoder_  
_- Catalog Service for Web (CSW) ebRIM profile_  
_- Web Feature Service (WFS) serving GML3 and CityGML content &#8220;_

<http://xnavigator.sourceforge.net/doku.php>


### ThreeJS

_&#8220;The aim of the project is to create a lightweight 3D library with a very low level of complexity — in other words, for dummies. The library provides \<canvas\>, \<svg\>, CSS3D and WebGL renderers.&#8221;_

![ ](/uploads/2015/01/threejs.png)

<http://threejs.org>


### W3DS

W3DS (Web 3D Service) is a portrayal service for 3D scenes. Early OGC discussion documents. Now superseded by the 3DPS, the 3D Portrayal Service, now (jan 2015) out for public comment in OGC. This is an early W3DS implementation in GeoServer that started from the dissertation work by Nuno Miguel Carvalho Oliveira (professor: Jorge Gustavo Rocha) at the University of Minho (Portugal).

<http://mei.di.uminho.pt/sites/default/files/dissertacoes//eeum_di_dissertacao_pg18391.pdf> &#8211; Dissertation  
<https://github.com/geoserver/geoserver/tree/master/src/community/w3ds> &#8211; GeoServer community module  
<http://osgeo-org.1560.x6.nabble.com/W3DS-Implementation-up-and-running-td4665127.html> &#8211; email on GeoServer list


### QGIS/Horao
By OSLandia

_&#8220;A simple viewer built around OpenSceneGraph … designed to listen to commands on its standard input. &#8230; The other piece is a Python plugin that is used to connect QGIS signals to the viewer (in another process) to allow loading of QGIS layers with 3D geometries.&#8221;_

![ ](/uploads/2015/01/horao.png)

<https://github.com/Oslandia/horao>  
<http://www.openscenegraph.org/>


### Cuardo
Again By OSLandia, watch these guys!  
_&#8220; Cuardo is an OpenSource WebGL 3D data viewer, focusing on urban data analysis and visualization … a 3D GIS web framework based on Three.js and WebGL, oriented toward urban visualization.&#8220;_

![ ](/uploads/2015/01/cuardo.png)

<https://github.com/Oslandia/cuardo>
<http://www.oslandia.com/oslandia-releases-cuardo-3d-gis-viewer-en.html>


### Suggestions from Readers
After the first version I got quite some suggestions. Thanks!

&#8211; Glob3Mobile &#8211; [@DiegoGomezDeck][10]  
_&#8220; G3M is a framework developed and designed to:_  
_- Develop mobile maps apps in 2D, 2,5D and 3D_  
_- Work with real time data_  
_- Integrate any kind of data (format,size)_  
_- Be integrated on any legacy system_  
_- High performance mobile native development_  
_- Multi Touch screens_  
_- Face the problem of the mobile performance as an integrated problem between server & client_

_Works on iOS, Android devices and HTML5 environments. &#8220;_

<http://www.glob3mobile.com/>

[1]: http://2013.foss4g.org/
[2]: http://cubecities.com/
[3]: https://twitter.com/CesiumJS/status/552845347484364800
[4]: http://mapzen.com
[5]: http://postgis.net/docs/ST_DelaunayTriangles.html
[6]: http://2013.foss4g.org/conf/programme/people/250/index.html
[7]: http://2013.foss4g.org/conf/programme/people/139/index.html
[8]: http://www.cgal.org
[9]: http://www.opengeospatial.org/standards/sfa
[10]: https://twitter.com/DiegoGomezDeck
