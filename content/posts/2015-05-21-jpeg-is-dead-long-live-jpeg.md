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
TL;DR: see [this GitHub issue][6] for summary (Dutch but the pictures there and Figure 1 tell the story).

![Figure 1. Image encoding-comparison for MapProxy-tiles](/uploads/2015/05/opentopo-png-vs-jpeg.png)

Somewhere around 1995, building my first website, it was already quite a feat to embed images. Non-aware of image-formats I played with (animated!) GIF and JPEG. Naively image-editing I noticed that my JPEGs became worse and worse after each save&#8230;I learned quickly about lossless and lossy encodings back then.  Later on came PNG. When I entered the geospatial domain there appeared to be a common convention that JPEG was to be used for arial/satellite images and PNG for rasterized vector renderings. So the years went by and all geo-folks, including me, followed that rule.

Recently I developed and launched [Map5.nl][3]: a cloud service for topographic maps mostly made with Dutch Open Geo-data. See my previous post [Tales from the Topographic Lowlands][1] how this service evolved.  After quite some research I finally settled on an Open Source geo-stack with [GDAL][2], [MapServer][7] and [MapProxy][8] on [Ubuntu][9]. For raster-map serving this appeared to be a golden combination.  The full stack, including pre-processing of TIFF-files (and some PNGs) is depicted below. The arrows denote the flow of data.

![Figure 2. Map5.nl dataflow for Raster data serving](/uploads/2015/05/geostack11.png)

In a later post I will dive more into the details of this architecture. For now I should explicitly mention the work of [Jan-Willem van Aalst][10], who designed the [OpenTopo-related maps][11] provided on [Map5.nl][3] using [QGIS][12].

But this post is about JPEG and how/why I found it needs revival in the context of raster-data preparation and serving. I explicitly mention &#8216;preparation&#8217; as JPEG was applied at two steps within the stack shown in Figure 2.

**JPEG Step 1 &#8211; Encoding in GeoTIFF**

Within the [NLExtract project][13] I was already preprocessing historical maps from PNG (with world files) to GeoTIFF. At some point I found out that GeoTIFF, as a container-image format, supports multiple  image-encodings. Using JPEG encoding it appeared that the resulting GeoTIFF files were much smaller (about 50%)  without hardly any loss in image quality. For the OpenTopo layers, I devised [this shell-script][14] to create GeoTIFFs ready to be served by any WMS-server. Without going into details of the script, this line, using [gdal_translate][15], does the actual JPEG-encoding:

```
gdal_translate -b 1 -b 2 -b 3 -of GTiff  
 -co TILED=YES  
 -co PROFILE=Geotiff -co COMPRESS=JPEG  
 -co JPEG_QUALITY=95  
 -co PHOTOMETRIC=YCBCR -co BLOCKXSIZE=512 -co BLOCKYSIZE=512  
 -a\_srs EPSG:28992 $src\_tif $dst_tif
```

Later on, I happily noticed, that others, like the great [Paul Ramsey also advertised JPEG encoding in GeoTIFF][16]. So JPEG lived up here.

**JPEG Step 2 &#8211; Encoding in WMS and Tiles**

Still within the rest of the geo-stack used for actual map serving with the MapServer/MapProxy combo I was still obeying the old rule to use PNG for serving non-arial/satellite images. I struggled and tested endless variations in configuration settings for PNG. My goal was to serve small tiles with just enough quality blazingly fast.  Now PNG has many options, but broadly put one has to make a choice between PNG24 (24 bits) or PNG8 (8 bits, 256 colors). The latter uses a colormap encoding which for the rich color variations of the OpenTopo and coloured hillshading layers had quite noticeable degraded image quality. PNG24 on the other hand rendered great tiled images but with the penalty of significant tile-sizes. A [Catch-22 situation][17] &#8230; Enter JPEG. Configuring MapProxy to serve JPEG-tiles gave much better results but needed some tweaking:

  * use at least faktor 90 JPEG-compression (also in MapServer)
  * disable meta-tiling and buffering, i.e. request 256&#215;256 JPEG maps from the MapServer source

So some excerpts from the MapProxy config:

```
opentopo_file_cache:
  grids: [geonovum_grid, opentopo_extent_grid]
  sources: [opentopo_wms]
  format: image/jpeg
  meta_buffer: 0
  meta_size: [1,1]

 opentopo_wms:
  type: wms
  req:
    url: http://ms.HOST_URL/go?
    layers: opentopo
    format: image/jpeg
    transparent: false
  coverage:
    bbox: [10000.000,299995.559,279997.956,625000.000]
    srs: 'EPSG:28992'
```

This gave optimal results. JPEG tiles were around 4.5 times as small as PNG24. See the results in Figure 1 above. For the [Hillshading layer][4] the differences were striking especially when zoomed-in. See Figure 3 below.

![Figure 3. Tiles and filesizes for different image encodings. Click image for full picture.](/uploads/2015/05/relief_struct-png-vs-jpeg.png)

So my choice was to settle for JPEG for the topographic and hillshading maps. You can browse all Map5.nl layers in the <a href="http://app.map5.nl/nltopo/" target="_blank">NLTopo App</a>.

So yes, JPEG seems the most optimal for these type of map-layers, but am I missing something? Some proponed:  _&#8220;Yes, but JPEG has no transparency nor alpha-channel&#8221;_. Hmm, true, but does this matter in most modern web-clients like [OpenLayers][18] or [Leaflet][19]? From what I observed, JPEG-layers will happily obey opacity-settings in these web-clients. For example, Figure 4 below shows the national Dutch Topographic map overlayed with the Map5.nl hillshading layer.

![Figure 4 &#8211; Dutch 1:25000 raster map transparently overlayed with Map5.nl JPEG hillshading layer](/uploads/2015/05/kadaster-top25-relief-struct.jpg)

So what to conclude? Basically the title of this post should say it. Further I would again like to acknowledge Jan-Willem van Aalst for his outstanding work on OpenTopo maps and Frank Steggink for making the basic hillshading map from the free Dutch Lidar- pointcloud-data ([AHN2][5]). And further the developers of MapServer and MapProxy, what an awesome combo. Even without pre-tiling maps are served blazingly fast! I am really fond of the Hillshading map. The Netherlands, known to be &#8220;flatland&#8221;, can now reveal also its past. See for example figure 5 below, a [Roman Fort][20] from about 2000 years ago!

{{< a-img data-href="http://app.map5.nl/nltopo/#rd/relief_struct/12/175799.7/477431.2" data-src="/uploads/2015/05/relief_struct_speuld_romfort.png" data-caption="Figure 5 &#8211; Contours from a Roman Fort near Speuld">}}

 [1]: https://justobjects.nl/tales-from-topographic-lowlands/
 [2]: http://gdal.org
 [3]: https://map5.nl
 [4]: http://app.map5.nl/nltopo/?base_layer=relief_struct
 [5]: http://www.ahn.nl
 [6]: https://github.com/map5nl/map5/issues/10
 [7]: http://mapserver.org
 [8]: http://mapproxy.org
 [9]: http://www.ubuntu.com
 [10]: https://www.linkedin.com/in/janwillemvanaalst
 [11]: http://opentopo.nl
 [12]: http://qgis.org
 [13]: http://www.nlextract.nl
 [14]: https://github.com/opengeogroep/NLExtract/blob/master/opentopo/bin/topotrans.sh
 [15]: http://www.gdal.org/gdal_translate.html
 [16]: http://blog.cleverelephant.ca/2015/02/geotiff-compression-for-dummies.html
 [17]: http://en.wikipedia.org/wiki/Catch-22_%28logic%29
 [18]: http://openlayers.org
 [19]: http://leaflet.org
 [20]: http://app.map5.nl/nltopo/#rd/relief_struct/12/175799.7/477431.2
