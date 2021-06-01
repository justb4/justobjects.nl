---
title: 3D Geospatial – Open Standards – v0
author: Just van den Broecke
type: post
date: 2015-01-29T14:06:51+00:00
excerpt: 'These are notes I keep within Evernote as part of the 3D Geospatial Notebook whose public link is: https://www.evernote.com/pub/justb4ever/3d-geospatial. This is an experiment using Zapier to sync Evernote to Wordpress.'
url: /3d-geospatial-open-standards-v0/
featured_image: uploads/2015/01/standards-150x145.jpg
categories:
  - osgeo
  - Software
tags:
  - 3D
  - 3DPS
  - BIM
  - Cesium
  - COLLADA
  - FOSS4G
  - GeoSpatial
  - GIS
  - ogc
  - OSgeo
  - X3D

---
This is my evolving overview of 3D Geospatial Open Standards with a focus on web technology: services, HTML5, WebGL. These are notes I keep within <a href="http://evernote.com" target="_blank">Evernote</a> as part of the 3D Geospatial Notebook whose public link is: <https://www.evernote.com/pub/justb4ever/3d-geospatial>. For sure, resources are missing, let me know. These notes are synced from Evernote using <a href="http://zapier.com" target="_blank">Zapier</a>, so formatting is a bit messy, sorry for that, though I completely revised this blog on jan 30, 2015.

The presentations by <a href="https://twitter.com/emmanuel_belo" target="_blank">Emanuel Belo </a>(<a href="http://www.camptocamp.com/en/" target="_blank">Camp2Camp</a>, links below) are an excellent start to get a global overview. He mentions the following categories of 3D standards and their organizations:

_**Geo: OGC**_

  * 3D Portrayal Services (Proposals: WVS WMS-Like & W3DS WFS-Like) (Just: Now 3DPS)
  * KML – XML/COLLADA
  * CityGML &#8211; representation, storage, and exchange
  * CZML (AGI/Cesium) ?

 _**Geo: OSGeo**_

  * TMS (Cesium Terrain Server z.B)

&nbsp;

_**Web: Web3d**_

  *  X3D &#8211; Extensible 3D Graphics

 _**Graphics: Khronos Group**_

  * COLLADA – eXchange / interoperability
  * glTF – graphic language Transmission Format

&nbsp;

_**Other**_

  * TopoJSON

In the short time I am spending within the 3D domain I think another categorization could be 3D Web Services Standards and 3D Content/Format Standards. A lot of focus is usually on the latter. Within 3D Content/Format Standards my view is that there are the sub-categories based on stages within a 3D rendering pipeline, i.e. from raw source data like CityGML up to 3D-scene encodings like COLLADA and glTF. I see &#8220;Terrain&#8221; as a separate content category with encodings like height maps and TINs.

I think/hope that 3D Web Services will gain importance: services to request Content in various encodings plus Terrain data. Techniques like tiling (TMS/WMTS) are already very common within the geospatial world. With the latest developments in vector-tiling I see much potential, especially for terrain and textures (raster) draped on a terrain. Streaming as in video streaming, is not common within the geospatial world but may become of use especially in HTML5 apps (via web sockets?).

**General**  
The following presentations by Emanuel Belo from Camp2Camp hit the nail on the head. The content lives up to the title.  
Two versions available, video and slides from FOSS4G 2013, Nottingham (missed that unfortunately) and a later 2014 version.

<a href="https://www.youtube.com/watch?v=9CgU0zs8DlU" target="_blank">https://www.youtube.com/watch?v=9CgU0zs8DlU</a> 3D Web Services And Models For The Web: Where Do We Stand? Belo FOSS4G13  
<a href="http://www.slideshare.net/camptocamp/3-d-web-services-and-models-for-the-web" target="_blank">http://www.slideshare.net/camptocamp/3-d-web-services-and-models-for-the-web</a> Belo &#8211; ditto slides [1]  
<a href="http://www.geospatialworldforum.org/2014/presentation/geo3d/Emmanuel%20Belo%20M.pdf" target="_blank">http://www.geospatialworldforum.org/2014/presentation/geo3d/Emmanuel%20Belo%20M.pdf</a> Belo &#8211; ditto 2014 version slides

**Open Geospatial Consortium &#8211; OGC**  
For open geospatial standards the Open Geospatial Consortium, OGC, is the first standards body to look at. Their standards  
are often aligned with corresponding ISO standards and more recently OGC started collaborating more closely with W3C.

At least two Standards Working Groups (WSGs) are dedicated to 3D. The more established  
3D Information Management (3DIM, CityGML!)) and the probably lesser known 3D Portrayal SWG.

It should be noted and credited that most of the OGC 3D standards came out of the German GDI-DE project <a href="http://www.gdi-3d.de" target="_blank">http://www.gdi-3d.de</a>.  
At this moment (jan 2015) two main OGC standards are of importance for 3D: CityGML and the draft standard for 3D Portrayal web services: 3DPS.

_**OGC &#8211; 3D Information Modeling &#8211; CityGML**_  
_&#8220;CityGML is a common information model and XML-based encoding for the representation, storage, and exchange of virtual 3D city and landscape models. CityGML provides a standard model and mechanism for describing 3D objects with respect to their geometry, topology, semantics and appearance, and defines five different levels of detail. Included are also generalization hierarchies between thematic classes, aggregations, relations between objects, and spatial properties. CityGML is highly scalable and datasets can include different urban entities supporting the general trend toward modeling not only individual buildings but also whole sites, districts, cities, regions, and countries.&#8221;_  
<a href="http://www.citygml.org" target="_blank">http://www.citygml.org</a>

SWG: <a href="http://www.opengeospatial.org/projects/groups/3dimwg" target="_blank">http://www.opengeospatial.org/projects/groups/3dimwg</a> &#8211; 3D Information Management (3DIM) Domain Working Group  
CityGML: <a href="http://www.opengeospatial.org/standards/citygml" target="_blank">http://www.opengeospatial.org/standards/citygml</a>

OGC candidate 3D Standards | GeoConnexion  
<a href="http://www.geoconnexion.com/articles/ogc-candidate-3d-standards" target="_blank">http://www.geoconnexion.com/articles/ogc-candidate-3d-standards</a>  
<a href="http://www.w3ds.org/doku.php" target="_blank">http://www.w3ds.org/doku.php</a>

_**OGC &#8211; 3D Web Services &#8211; 3D Portrayal**_

SWG: <a href="http://www.opengeospatial.org/projects/groups/3dpswg" target="_blank">http://www.opengeospatial.org/projects/groups/3dpswg</a> &#8211; 3D Portrayal SWG.  
Note the W3DS, WVS, WTS and WPVS are now all obsolete since they have been merged into a single web service standard: the 3D Portrayal Service (3DPS).

A draft version 1.0.0 is now (january 2015) out for public comment within OGC:  
<a href="http://www.opengeospatial.org/standards/requests/130" target="_blank">http://www.opengeospatial.org/standards/requests/130</a>

_&#8220;The 3D portrayal standard (3DPS) is an OGC service implementation specification targeting the delivery of 3D portrayals in an interoperable fashion. … When client and server(s) involved share a common set of capabilities, it becomes possible to view and analyze 3D geoinformation from diverse sources in a combined manner. …. The 3DPS combines the essential parts of the suggested W3DS and WVS into one common interface.”_ and

_“ The Open Geospatial Consortium (OGC) and the Web3D Consortium have both been working to address the need for interoperability, as well as the content challenges of volume, access speed, and diversity of devices. The Web3D Consortium has focused on open standards for real-time 3D visualization, including streaming, and their members developed a Geospatial Component extension for X3D. The OGC has focused on developing a service interface to provide interoperable access to 3D geospatial data servers. In 2012, a group of OGC members, building on work done in both organizations, completed the 3D Portrayal Interoperability Experiment (3DPIE) to develop and evaluate best practices for 3D portrayal services.&#8221;_

_&#8220;The candidate OGC 3D Portrayal Service Standard is designed to support both client and server side rendering. For client-side rendering, the client requests a 3D model from the server. The server extracts the requested model from the 3D geodata server and generates a 3D scene graph including geometry and textures. Depending on the server’s capabilities, data formats such as X3D, KML and COLLADA can be used to retrieve the scene graph. The rendering of the scene is done on the client side. In a web client, X3DOM and/or XML3D can be used to integrate the scene into an immersive HTML5 experience. However, there are no fixed format requirements, opening the service for other technologies such as JSON-based glTF. For server side rendering, the client passes the requested content and view parameters to the server. The server then generates layered image depictions of the 3D environment for display on the client. In either scenario, the client’s user can query and navigate through the 3D content.&#8221;_

Link to 3DPS v1.0.0 for public review on jan 29, 2015:

Public comment request: <a href="http://www.opengeospatial.org/standards/requests/130" target="_blank">http://www.opengeospatial.org/standards/requests/130</a>  
Direct download 3DPS 1.0.0 draft: <a href="https://portal.opengeospatial.org/files/61884" target="_blank">https://portal.opengeospatial.org/files/61884</a>

For history reasons some notes kept on W3DS and WVS below.

_A **Web 3D Service (W3DS)** is a portrayal service for three-dimensional geodata such as landscape models, city models, textured building models, vegetation objects, and streetfurniture. Geodata is delivered as scenes that are comprised of display elements, optimized for efficient real time rendering at high frame rates. 3D Scenes can be __interactively displayed and explored by internet browsers with 3D plug-ins, or loaded__into virtual globe applications._

_The **Web View Service (WVS)** is a portrayal service for three-dimensional geodata suchas landscape models, city models, vegetation models, or transportation infrastructure_

 _models. A WVS server mainly provides 2D image representing a 3D view on a scene_  
 _constructed from 3D geodata that is integrated and visualized by the WVS server. In_  
 _addition to these color images of a 3D scene, a WVS server can advertise and deliver_  
 _complementary image layers that include geometrical or thematic information: e.g., depth_  
 _layers, surface normal data, or object id information._

_**OGC &#8211; 3D Portrayal Interoperability Experiment (3DPIE)**_  
The OGC …. _&#8220;3D Portrayal Interoperability Experiment (IE) successfully tested and demonstrated different mechanisms for the portrayal, delivery, and exploitation of 3D geodata based on open standards-based formats and services. &#8230;approaches for service-based 3D portrayal based on thedrafts for the candidate standards for 3D portrayal, Web 3D Service (W3DS) and WebView Service (WVS).&#8221;_

Page: <a href="http://www.opengeospatial.org/projects/initiatives/3dpie" target="_blank">http://www.opengeospatial.org/projects/initiatives/3dpie</a>  
Report <a href="https://portal.opengeospatial.org/files/?artifact_id=49068" target="_blank">https://portal.opengeospatial.org/files/?artifact_id=49068</a>

NB this ultimately lead to the development of the 3D Portrayal Standard which merged W3DS and WVS.

**Open Source Geospatial Foundation &#8211; OSGeo**  
Although <a href="http://osgeo.org" target="_blank">OSGeo.org</a> is not a standards body, for years the Tiled Map Service TMS spec is intensively used, probably more than its OGC-counterpart WMTS&#8230;  
<a href="http://wiki.osgeo.org/wiki/Tile_Map_Service_Specification" target="_blank">http://wiki.osgeo.org/wiki/Tile_Map_Service_Specification</a>

TMS is finding its use in the 3D landscape not just for tiles containing 2D raster maps to be draped over a terrain, but also more and more as a container for height and (compressed) vector tiles. This is an important development, see e.g. Cesium Terrain Server and its two format-encodings for terrain-tiles:  
<a href="https://github.com/AnalyticalGraphicsInc/cesium/wiki/Cesium-Terrain-Server" target="_blank">https://github.com/AnalyticalGraphicsInc/cesium/wiki/Cesium-Terrain-Server</a>

**X3D &#8211; Web3D**  
_&#8220;Extensible 3D (X3D) Graphics and Humanoid Animation (H-Anim) include a coordinated set of steadily evolving ISO standards. &#8220;_

<a href="http://www.web3d.org/standards" target="_blank">http://www.web3d.org/standards</a> (mostly X3D, equiv with ISO/IEC 19775 (architecture and  
abstract capabilities), 19776 (encodings), and 19777 (API)))

**X3DOM**  
_&#8220;X3DOM is an adaption of the X3D standard to (X)HTML, ensuring declarative 3D can_  
 _be used inside standards-compliant browser. It aims to support a large browser base and_  
 _decent X3D feature coverage, while working towards a common declarative 3D standard_  
 _in the Declarative 3D community WG at the W3C. The reference implementation is_  
 _maintained by Fraunhofer IGD and available under the open-source license MIT.&#8221;_  
<a href="http://www.x3dom.org/" target="_blank">http://www.x3dom.org/</a> &#8211;

**WebGL**  
<a href="https://www.khronos.org/webgl/" target="_blank">https://www.khronos.org/webgl/</a>  
_&#8220;WebGL is a standard for programming in 3D with the browser as platform. The final_  
 _specification of the standard was published in 2010 and is defined by the Khronos Group,_  
 _a consortium which is also in charge of Open GL, Open CL and OpenGL ES (embedded_  
 _systems). WebGL provide a context into HTML5 canvas that is 3D Computer Graphics_  
 _capable without plug-in.&#8221;_

**Cesium**  
Although <a href="http://cesiumjs.org" target="_blank">CesiumJS</a> is mainly a client JavaScript framework based on WebGL and Dojo,  some very useful standards are originating from the project.

<a href="http://cesiumjs.org/data-and-assets/terrain/formats/quantized-mesh-1.0.html" target="_blank">http://cesiumjs.org/data-and-assets/terrain/formats/quantized-mesh-1.0.html</a> quantized mesh via TMS &#8211; for terrain services based on TINs.

<a href="https://github.com/AnalyticalGraphicsInc/cesium/wiki/CZML-Guide" target="_blank">https://github.com/AnalyticalGraphicsInc/cesium/wiki/CZML-Guide</a> &#8211; CZML is a JSON schema for describing a time-dynamic graphical scene

NEW (august 2015) _**&#8220;3D Tiles&#8221;**_ : <a href="https://cesiumjs.org/2015/08/10/Introducing-3D-Tiles" target="_blank">https://cesiumjs.org/2015/08/10/Introducing-3D-Tiles</a>. _&#8220;3D Tiles are an [open specification][1] for streaming massive heterogeneous 3D geospatial datasets&#8230;.3D Tiles define a spatial data structure and a set of tile formats designed for 3D and optimized for streaming and rendering. Tiles for 3D models use [glTF][2], the WebGL runtime asset format developed by Khronos, which the Cesium team heavily contributes to&#8230;.&#8221; _

**Collada**  
_&#8220;COLLADA™ defines an XML-based schema to make it easy to transport 3D assets between applications &#8211; enabling diverse 3D authoring and content processing tools to be combined into a production pipeline. The intermediate language provides comprehensive encoding of visual scenes including: geometry, shaders and effects, physics, animation, kinematics, and even multiple version representations of the same asset.COLLADA FX enables leading 3D authoring tools to work effectively together to create shader and effects applications and assets to be authored and packaged using OpenGL® Shading Language, Cg, CgFX, and DirectX® FX.&#8221;_

<a href="https://www.khronos.org/collada/" target="_blank">https://www.khronos.org/collada/</a>

**KML**  
Originally from Keyhole/Google, but since years an OGC Standard. May embed Collada.

_&#8220;Keyhole Markup Language (KML) is an XML notation for expressing geographic annotation and visualization within Internet-based, two-dimensional maps and three-dimensional Earth browsers. KML was developed for use with Google Earth, which was originally named Keyhole Earth Viewer. It was created by Keyhole, Inc, which was acquired by Google in 2004. KML became an international standard of the Open Geospatial Consortium in 2008.\[1\]\[2\] Google Earth was the first program able to view and graphically edit KML files. &#8220;_  
Source: <a href="http://en.wikipedia.org/wiki/Keyhole_Markup_Language" target="_blank">http://en.wikipedia.org/wiki/Keyhole_Markup_Language</a>

OGC Standard: <a href="http://www.opengeospatial.org/standards/kml" target="_blank">http://www.opengeospatial.org/standards/kml</a>

_**3D in KML:**_  
<a href="https://developers.google.com/kml/documentation/models" target="_blank">https://developers.google.com/kml/documentation/models</a>  
<a href="http://blog.thematicmapping.org/2008/04/proportional-3d-collada-objects-in-kml.html" target="_blank">http://blog.thematicmapping.org/2008/04/proportional-3d-collada-objects-in-kml.html</a>  
<a href="http://blog.thematicmapping.org/2008/04/drawing-3d-bars-in-kml.html" target="_blank">http://blog.thematicmapping.org/2008/04/drawing-3d-bars-in-kml.html</a>

**glTF**  
Final stage OpenGL Transmission Format to enable rapid delivery and loading of 3D content by WebGL, OpenGL, and OpenGL ES APIs.

_&#8220;The &#8220;glTF&#8221; project aims to define a final stage OpenGL Transmission Format to enable rapid delivery and loading of 3D content by WebGL, OpenGL, and OpenGL ES APIs. glTF together with COLLADA comprise a standards-based content pipeline for rich 3D web and mobile applications. glTF Specification is a work-in-progress from the COLLADA Working Group; it is not an official Khronos-ratified specification yet. It is incomplete and subject to change. The draft specification and related converters and loaders are available on github.&#8221;_

<a href="https://www.khronos.org/" target="_blank">https://www.khronos.org/</a>  
<a href="https://www.khronos.org/gltf/" target="_blank">https://www.khronos.org/gltf/</a>

**TopoJSON**

_&#8220;TopoJSON is an extension of GeoJSON that encodes topology. Rather than representing geometries discretely, geometries in TopoJSON files are stitched together from shared line segments called arcs. TopoJSON eliminates redundancy, offering much more compact representations of geometry than with GeoJSON; typical TopoJSON files are 80% smaller than their GeoJSON equivalents. In addition, TopoJSON facilitates applications that use topology, such as topology-preserving shape simplification, automatic map coloring, and cartograms.&#8221;_ (i.e. compact TIN-representations!).  
<a href="https://github.com/mbostock/topojson" target="_blank">https://github.com/mbostock/topojson</a>

**Germany: SIG 3D**  
Germany-based 3D interest group. Started already very early (2002) with 3D geospatial and has a long history. Many useful resources for both standards and implementations can be found via their websites.

_&#8220;Three-dimensional models of cities and regions play an important role in major applications of architecture, urban planning, surveying, mobile telecommunication or facility management. In the environmental sector 3D city models enable the simulation of noise and exhaust emissions as well as predictions on city climate change affecting a city. Concerning disaster situations like floods, 3D landscape models can help to analyse the affected areas and buildings.&#8221;_

_&#8220;Since the beginning of 2010 SIG 3D is part of the German Spatial Data Infrastructure (GDI-DE) and coordinates this context the national and international network of 3D activities.&#8221;_

<a href="http://www.sig3d.org/" target="_blank">http://www.sig3d.org/</a>  
Several standards like OGC CityGML W3DS, later 3DPS had their origins here.

**The Netherlands: Doorbraak 3D (Breakthrough 3D)**  
3D initiative within The Netherlands as a follow-up on earlier successful 3D projects like the 3D-Pilot:  
<a href="http://www.geonovum.nl/documenten/rapport-eindrapportages-3d-pilot-nl-eerste-fase" target="_blank">http://www.geonovum.nl/documenten/rapport-eindrapportages-3d-pilot-nl-eerste-fase</a>

As a follow-up (2011) of the 3D-Pilot the public standard CityGML-IMGeo was developed. Basically this standardizes detailed smallscale/detailed topography using and extending CityGML. <a href="http://www.geonovum.nl/wegwijzer/standaarden/gegevenscatalogus-imgeo-versie-211" target="_blank">http://www.geonovum.nl/wegwijzer/standaarden/gegevenscatalogus-imgeo-versie-211</a>

History of 3D geo in The Netherlands: <a href="http://www.geonovum.nl/onderwerpen/3d-geo-informatie/historie-3d-geo-informatie-nl" target="_blank">http://www.geonovum.nl/onderwerpen/3d-geo-informatie/historie-3d-geo-informatie-nl</a>

Now (jan 2015) starting up a next phase called &#8220;3D Doorbraak&#8221;, with a recent working conference for establishing the 3D roadmap for The Netherlands: <a href="http://www.geonovum.nl/nieuws/werkconferentie-voor-opstellen-roadmap-3d-doorbraak" target="_blank">http://www.geonovum.nl/nieuws/werkconferentie-voor-opstellen-roadmap-3d-doorbraak</a>  
The choice of standards plays an important part.

See also news items via Twitter (#doorbraak3D): <a href="https://twitter.com/search?q=%23doorbraak3D&src=typd" target="_blank">https://twitter.com/search?q=%23doorbraak3D&src=typd</a>

**BIM &#8211; IFC**

Now that geospatial information is obtaining more detail and moving into 3D, integration with standards within the Building and infrastructure industry is one of the most obvious use-cases. Building Information Modelling or BIM is a huge standardization effort within the Building and infrastructure domain.

Geoff ,&#8221;Between The Poles&#8221;, Zeiss blogs regularly on BIM and Geospatial: <a href="http://geospatial.blogs.com/geospatial/bim/" target="_blank">http://geospatial.blogs.com/geospatial/bim/</a>

_**&#8220;Building information modeling** (**BIM**) is a process involving the generation and management of digital representations of physical and functional characteristics of places. **Building information models** (**BIMs**) are files (often but not always in proprietary formats and containing proprietary data) which can be exchanged or networked to support decision-making about a place. Current BIM software is used by individuals, businesses and government agencies who plan, design, construct, operate and maintain diverse physical infrastructures, such as water, wastewater, electricity, gas, refuse and communication utilities, roads, bridges and ports, houses, apartments, schools and shops, offices, factories, warehouses and prisons.&#8221;_

Source: <a href="http://en.wikipedia.org/wiki/Building_information_modeling" target="_blank">http://en.wikipedia.org/wiki/Building_information_modeling</a>

For information exchange the Industry Foundation Classes are put forward.

&#8220;The _Industry Foundation Classes (IFC) data model is intended to describe building and construction industry data._

_It is a platform neutral, open file format specification that is not controlled by a single vendor or group of vendors. It is an object-based file format with a data model developed bybuildingSMART (formerly the International Alliance for Interoperability, IAI) to facilitate interoperability in the architecture, engineering and construction (AEC) industry, and is a commonly used collaboration format in Building information modeling (BIM) based projects. The IFC model specification is open and available.[1] It is registered by ISO and is an official International Standard ISO 16739:2013.&#8221;_  
Source: <a href="http://en.wikipedia.org/wiki/Industry_Foundation_Classes" target="_blank">http://en.wikipedia.org/wiki/Industry_Foundation_Classes</a>

More:  
<a href="http://www.ifcwiki.org/index.php/Main_Page" target="_blank">http://www.ifcwiki.org/index.php/Main_Page</a>

<div>
</div>

<div>
</div>

&nbsp;

 [1]: https://github.com/AnalyticalGraphicsInc/3d-tiles
 [2]: https://www.khronos.org/gltf