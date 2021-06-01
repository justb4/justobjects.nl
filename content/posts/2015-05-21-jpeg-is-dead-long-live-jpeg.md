---
title: JPEG is Dead, Long Live JPEG!
author: Just van den Broecke
type: post
date: 2015-05-21T23:31:46+00:00
url: /jpeg-is-dead-long-live-jpeg/
featured_image: uploads/2015/05/relief_struct-png-vs-jpeg-147x150.png
categories:
  - osgeo
  - Projects
  - Software
tags:
  - gdal
  - GeoSpatial
  - GIS
  - JPEG
  - Map5.nl
  - MapProxy
  - MapServer
  - NLExtract
  - OpenTopo
  - OSgeo

---
TL;DR: see <a href="https://github.com/map5nl/map5/issues/10" target="_blank">this GitHub issue</a> for summary (Dutch but the pictures there and Figure 1 tell the story).

<div id="attachment_595" style="width: 573px" class="wp-caption aligncenter">
  <a href="uploads/2015/05/opentopo-png-vs-jpeg.png"><img aria-describedby="caption-attachment-595" loading="lazy" class="  wp-image-595" src="uploads/2015/05/opentopo-png-vs-jpeg.png" alt="opentopo-png-vs-jpeg" width="563" height="575" srcset="https://justobjects.nl/wp-content/uploads/2015/05/opentopo-png-vs-jpeg.png 784w, https://justobjects.nl/wp-content/uploads/2015/05/opentopo-png-vs-jpeg-294x300.png 294w, https://justobjects.nl/wp-content/uploads/2015/05/opentopo-png-vs-jpeg-147x150.png 147w" sizes="(max-width: 563px) 100vw, 563px" /></a>
  
  <p id="caption-attachment-595" class="wp-caption-text">
    Figure 1. Image encoding-comparison for MapProxy-tiles
  </p>
</div>

Somewhere around 1995, building my first website, it was already quite a feat to embed images. Non-aware of image-formats I played with (animated!) GIF and JPEG. Naively image-editing I noticed that my JPEGs became worse and worse after each save&#8230;I learned quickly about lossless and lossy encodings back then.  Later on came PNG. When I entered the geospatial domain there appeared to be a common convention that JPEG was to be used for arial/satellite images and PNG for rasterized vector renderings. So the years went by and all geo-folks, including me, followed that rule.

Recently I developed and launched <a href="http://www.map5.nl" target="_blank">Map5.nl</a>: a cloud service for topographic maps mostly made with Dutch Open Geo-data. See my previous post [Tales from the Topographic Lowlands][1] how this service evolved.  After quite some research I finally settled on an Open Source geo-stack with <a href="http://gdal.org" target="_blank">GDAL</a>, <a href="http://mapserver.org" target="_blank">MapServer</a> and <a href="http://mapproxy.org" target="_blank">MapProxy</a> on <a href="http://www.ubuntu.com" target="_blank">Ubuntu</a>. For raster-map serving this appeared to be a golden combination.  The full stack, including pre-processing of TIFF-files (and some PNGs) is depicted below. The arrows denote the flow of data.

[<img loading="lazy" class="  aligncenter wp-image-594" src="uploads/2015/05/geostack11.png" alt="geostack1" width="196" height="432" srcset="https://justobjects.nl/wp-content/uploads/2015/05/geostack11.png 290w, https://justobjects.nl/wp-content/uploads/2015/05/geostack11-136x300.png 136w, https://justobjects.nl/wp-content/uploads/2015/05/geostack11-68x150.png 68w" sizes="(max-width: 196px) 100vw, 196px" />][2]

<p style="text-align: center;">
  <em><strong>Figure 2. Map5.nl dataflow for Raster data serving</strong></em>
</p>

In a later post I will dive more into the details of this architecture. For now I should explicitly mention the work of <a href="https://www.linkedin.com/in/janwillemvanaalst" target="_blank">Jan-Willem van Aalst</a>, who designed the <a href="http://opentopo.nl" target="_blank">OpenTopo-related maps</a> provided on [Map5.nl][3] using <a href="http://qgis.org" target="_blank">QGIS</a>.

But this post is about JPEG and how/why I found it needs revival in the context of raster-data preparation and serving. I explicitly mention &#8216;preparation&#8217; as JPEG was applied at two steps within the stack shown in Figure 2.

**JPEG Step 1 &#8211; Encoding in GeoTIFF**

Within the <a href="http://www.nlextract.nl" target="_blank">NLExtract project</a> I was already preprocessing historical maps from PNG (with world files) to GeoTIFF. At some point I found out that GeoTIFF, as a container-image format, supports multiple  image-encodings. Using JPEG encoding it appeared that the resulting GeoTIFF files were much smaller (about 50%)  without hardly any loss in image quality. For the OpenTopo layers, I devised <a href="https://github.com/opengeogroep/NLExtract/blob/master/opentopo/bin/topotrans.sh" target="_blank">this shell-script </a> to create GeoTIFFs ready to be served by any WMS-server. Without going into details of the script, this line, using <a href="http://www.gdal.org/gdal_translate.html" target="_blank">gdal_translate</a>, does the actual JPEG-encoding:

> gdal_translate -b 1 -b 2 -b 3 -of GTiff  
> -co TILED=YES  
> -co PROFILE=Geotiff -co COMPRESS=JPEG  
> -co JPEG_QUALITY=95  
> -co PHOTOMETRIC=YCBCR -co BLOCKXSIZE=512 -co BLOCKYSIZE=512  
> -a\_srs EPSG:28992 $src\_tif $dst_tif

Later on, I happily noticed, that others, like the great <a href="http://blog.cleverelephant.ca/2015/02/geotiff-compression-for-dummies.html" target="_blank">Paul Ramsey also advertised JPEG encoding in GeoTIFF</a>. So JPEG lived up here.

**JPEG Step 2 &#8211; Encoding in WMS and Tiles**

Still within the rest of the geo-stack used for actual map serving with the MapServer/MapProxy combo I was still obeying the old rule to use PNG for serving non-arial/satellite images. I struggled and tested endless variations in configuration settings for PNG. My goal was to serve small tiles with just enough quality blazingly fast.  Now PNG has many options, but broadly put one has to make a choice between PNG24 (24 bits) or PNG8 (8 bits, 256 colors). The latter uses a colormap encoding which for the rich color variations of the OpenTopo and coloured hillshading layers had quite noticeable degraded image quality. PNG24 on the other hand rendered great tiled images but with the penalty of significant tile-sizes. A <a href="http://en.wikipedia.org/wiki/Catch-22_%28logic%29" target="_blank">Catch-22 situation</a>&#8230; Enter JPEG. Configuring MapProxy to serve JPEG-tiles gave much better results but needed some tweaking:

  * use at least faktor 90 JPEG-compression (also in MapServer)
  * disable meta-tiling and buffering, i.e. request 256&#215;256 JPEG maps from the MapServer source

So some excerpts from the MapProxy config:

> <pre>opentopo_file_cache:
  grids: [geonovum_grid, opentopo_extent_grid]
  sources: [opentopo_wms]
  format: image/jpeg
  meta_buffer: 0
  meta_size: [1,1]</pre>
> 
> <pre>opentopo_wms:
  type: wms
  req:
    url: http://ms.HOST_URL/go?
    layers: opentopo
    format: image/jpeg
    transparent: false
  coverage:
    bbox: [10000.000,299995.559,279997.956,625000.000]
    srs: 'EPSG:28992'</pre>

This gave optimal results. JPEG tiles were around 4.5 times as small as PNG24. See the results in Figure 1 above. For the [Hillshading layer][4] the differences were striking especially when zoomed-in. See Figure 3 below.

<div id="attachment_598" style="width: 646px" class="wp-caption aligncenter">
  <a href="uploads/2015/05/relief_struct-png-vs-jpeg.png"><img aria-describedby="caption-attachment-598" loading="lazy" class="wp-image-598" src="uploads/2015/05/relief_struct-png-vs-jpeg.png" alt="relief_struct-png-vs-jpeg" width="636" height="649" srcset="https://justobjects.nl/wp-content/uploads/2015/05/relief_struct-png-vs-jpeg.png 784w, https://justobjects.nl/wp-content/uploads/2015/05/relief_struct-png-vs-jpeg-294x300.png 294w, https://justobjects.nl/wp-content/uploads/2015/05/relief_struct-png-vs-jpeg-147x150.png 147w" sizes="(max-width: 636px) 100vw, 636px" /></a>
  
  <p id="caption-attachment-598" class="wp-caption-text">
    Figure 3. Tiles and filesizes for different image encodings. Click image for full picture.
  </p>
</div>

So my choice was to settle for JPEG for the topographic and hillshading maps. You can browse all Map5.nl layers in the <a href="http://app.map5.nl/nltopo/" target="_blank">NLTopo App</a>.

So yes, JPEG seems the most optimal for these type of map-layers, but am I missing something? Some proponed:  _&#8220;Yes, but JPEG has no transparency nor alpha-channel&#8221;_. Hmm, true, but does this matter in most modern web-clients like <a href="http://openlayers.org" target="_blank">OpenLayers</a> or <a href="http://leaflet.org" target="_blank">Leaflet</a>? From what I observed, JPEG-layers will happily obey opacity-settings in these web-clients. For example, Figure 4 below shows the national Dutch Topographic map overlayed with the Map5.nl hillshading layer.

<div id="attachment_600" style="width: 510px" class="wp-caption aligncenter">
  <a href="uploads/2015/05/kadaster-top25-relief-struct.jpg"><img aria-describedby="caption-attachment-600" loading="lazy" class="wp-image-600 size-full" src="uploads/2015/05/kadaster-top25-relief-struct.jpg" alt="kadaster-top25-relief-struct" width="500" height="300" srcset="https://justobjects.nl/wp-content/uploads/2015/05/kadaster-top25-relief-struct.jpg 500w, https://justobjects.nl/wp-content/uploads/2015/05/kadaster-top25-relief-struct-300x180.jpg 300w, https://justobjects.nl/wp-content/uploads/2015/05/kadaster-top25-relief-struct-250x150.jpg 250w, https://justobjects.nl/wp-content/uploads/2015/05/kadaster-top25-relief-struct-150x90.jpg 150w" sizes="(max-width: 500px) 100vw, 500px" /></a>
  
  <p id="caption-attachment-600" class="wp-caption-text">
    Figure 4 &#8211; Dutch 1:25000 raster map transparently overlayed with Map5.nl JPEG hillshading layer
  </p>
</div>

So what to conclude? Basically the title of this post should say it. Further I would again like to acknowledge Jan-Willem van Aalst for his outstanding work on OpenTopo maps and Frank Steggink for making the basic hillshading map from the free Dutch Lidar- pointcloud-data ([AHN2][5]). And further the developers of MapServer and MapProxy, what an awesome combo. Even without pre-tiling maps are served blazingly fast! I am really fond of the Hillshading map. The Netherlands, known to be &#8220;flatland&#8221;, can now reveal also its past. See for example figure 5 below, a <a href="http://app.map5.nl/nltopo/#rd/relief_struct/12/175799.7/477431.2" target="_blank">Roman Fort</a> from about 2000 years ago!

<div id="attachment_601" style="width: 670px" class="wp-caption aligncenter">
  <a href="http://app.map5.nl/nltopo/#rd/relief_struct/12/175799.7/477431.2"><img aria-describedby="caption-attachment-601" loading="lazy" class="wp-image-601 size-full" src="uploads/2015/05/relief_struct_speuld_romfort.png" alt="Figure 5 - Contours from a Roman Fort near Speuld" width="660" height="606" srcset="https://justobjects.nl/wp-content/uploads/2015/05/relief_struct_speuld_romfort.png 660w, https://justobjects.nl/wp-content/uploads/2015/05/relief_struct_speuld_romfort-300x275.png 300w, https://justobjects.nl/wp-content/uploads/2015/05/relief_struct_speuld_romfort-163x150.png 163w, https://justobjects.nl/wp-content/uploads/2015/05/relief_struct_speuld_romfort-150x138.png 150w" sizes="(max-width: 660px) 100vw, 660px" /></a>
  
  <p id="caption-attachment-601" class="wp-caption-text">
    Figure 5 &#8211; Contours from a Roman Fort near Speuld
  </p>
</div>

&nbsp;

&nbsp;

 [1]: http://justobjects.nl/tales-from-topographic-lowlands/
 [2]: uploads/2015/05/geostack11.png
 [3]: http://www.map5.nl
 [4]: http://app.map5.nl/nltopo/?base_layer=relief_struct
 [5]: http://www.ahn.nl