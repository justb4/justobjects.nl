---
title: OpenStreetMap Tiles for Dutch Projection EPSG:28992
author: Just van den Broecke
type: post
date: 2010-03-17T11:11:25+00:00
excerpt: A practical howto for rendering map tiles in other projections using the OpenStreetMap rendering tool chain with Mapnik. As an example the Dutch projection EPSG:28992 is used.
url: /openstreetmap-tiles-for-dutch-projection-epsg28992/
categories:
  - osgeo
  - Projects
  - Software
tags:
  - epgs:28992
  - gdal
  - mapnik
  - osm
  - proj
  - tilecache

---
[<img loading="lazy" class="alignleft wp-image-262 size-thumbnail" src="uploads/2010/03/osm-rdtiles-150x150.jpg" alt="osm-rdtiles" width="150" height="150" />][1]This article documents how to generate [OpenStreetMap (OSM)][2] tiles for the [Dutch RD (&#8220;Rijksdriehoeksmeting&#8221;) projection][3] also known as [EPSG:28992][4]. The steps described below can be used for other projections as well. I assume you are familiar with the OpenStreetMap (OSM) project. If not, there is ample information on the web, for example the [OSM Wiki][5]. What makes OSM very attractive is not just [the shared mapmaking][6] and an [unrestrictive license][7] on the resulting map(data), but a toolchain, that allows you to [generate/render your own maps !][8].

In addition, [OSM within The Netherlands][9] is very detailed since [Automotive Navigation Data (AND)][10] has donated a complete road dataset for The Netherlands in 2007 to the OSM project. OSM maps are usually rendered as 256&#215;256 tiles in a [Spherical Mercator projection][11] with the (unofficial) code EPSG:900913, a.k.a. the &#8220;Google Projection&#8221;. Spherical Mercator has an official designation of [EPSG:3785][12] but you will mostly find EPSG:900913. Most countries however use local map-projections, mainly for better accuracy and calculations. Most Dutch mapping applications use the aforementioned [Dutch RD projection, EPSG:28992][3]. Generating OSM tiles for EPSG:28992 requires some extra steps and has some gotchas you need to be aware of.

Below, I will not describe the setup of the entire toolchain needed to [generate OSM map tiles with Mapnik][13], but just the steps that are specific to our goal: generate OSM map tiles for extent of The Netherlands with the projection EPSG:28992. These steps were done on [Ubuntu Linux][14] 9.04 (Jaunty). So let&#8217;s take the seven steps!

**Step 1: download OSM data**  
Since we only plan to generate tiles for The Netherlands, plus the fact that the projection EPSG:28992 will not even work around the world, we need only an extract for The Netherlands. I have downloaded this extract from  
`http://hypercube.telascience.org/planet/planet-nl-latest.osm.gz`,  
but at the time of this writing this file was not present. Best is to go to <http://wiki.openstreetmap.org/wiki/Planet.osm> to find a suitable download server. Unpack `planet-nl-latest.osm.gz`. The resulting XML file `planet-nl-latest.osm` is around 4.5 GB.

**Step 2: import OSM data in PostGIS**  
Use [osm2pgsql][15] to import the Planet XML file into the PostgreSQL/PostGIS database. Since the standard version from the Ubuntu repository gave errors I have built a custom version of `osm2pgsql` from SVN (rev. 20274) using these steps:

<pre>sudo apt-get install build-essential libxml2-dev libgeos-dev 
                                       libpq-dev libbz2-dev proj
 mkdir /opt/osm/osm2pgsql
 cd /opt/osm/osm2pgsql
 svn export 
    http://svn.openstreetmap.org/applications/utils/export/osm2pgsql 
                                                       svn-20274
 sed -i 's/-g -O2/-O2 -march=native -fomit-frame-pointer/' Makefile
 make
 make install
</pre>

Import the OSM file with this command line:

<pre>osm2pgsql --slim -c -E EPSG:4326 -d georzlab -U postgres -W -H localhost
      -S /opt/osm/osm2pgsql/svn-20274/default.style
          /path/to/planet-nl-latest.osm
</pre>

Note the use of EPSG:4326 (standard lon/lat projection) to store data in the DB. Maybe I could have used the default EPSG:900913. The  
`--slim` option was needed to prevent errors.

**Step 3: install Mapnik**  
An install of [Mapnik][16], the map tile renderer, version 0.7.0 from <http://svn.mapnik.org/tags/release-0.7.0> was done. Installing Mapnik itself involves many steps. These are described in many places, such as [here][17] and for Ubuntu at <http://trac.mapnik.org/wiki/UbuntuInstallation>. Best is to have a Mapnik version as recent as possible.

**Step 4: download and extract World Boundary files**  
This is a standard step in the Mapnik rendering process for OSM. Specific in our case is that we will extract only the area of The Netherlands from the World Boundary shape files. This is not just for efficiency purposes but required, _**otherwise rendering boundaries/geonames will silently fail (see below)**_. Two steps are required here: 1) extract/clip the Netherlands&#8217; bounding box and 2) reproject extracted data to EPSG:28992. Thanks to the wonderful geo-library [GDAL/OGR][18] and the command `ogr2ogr` for vector data manipulations, this can be done in a script as follows:

<pre>#!/bin/bash

# location of shape files
cd /var/kademo/data/osm/world_boundaries

#
# Extract NL area to Dutch RD (EPSG:28992)
# get extent in EPSG:900913 from PostGIS:
#    select ST_Extent(ST_Transform(way,900913)) from planet_osm_line;
#
extent="311523.765594493 6555476.44574815 822461.515529216 7160903.43417988"
srs=28992
echo "Extract NL for EPSG:${srs}"
/bin/rm `/bin/ls *${srs}*`
ogr2ogr -f "ESRI Shapefile" -s_srs EPSG:900913 -t_srs EPSG:${srs} 
               -spat ${extent}  builtup_area_${srs}.shp builtup_area.shp
ogr2ogr -f "ESRI Shapefile" -s_srs EPSG:900913 -t_srs EPSG:${srs} 
               -spat ${extent}  processed_p_${srs}.shp processed_p.shp
ogr2ogr -f "ESRI Shapefile" -s_srs EPSG:900913 -t_srs EPSG:${srs}  
               -spat ${extent}  shoreline_300_${srs}.shp shoreline_300.shp

</pre>

The extent in EPSG:900913 can be obtained from the data in PostGIS with the [psql][19] command  
`select ST_Extent(ST_Transform(way,900913)) from planet_osm_line;`.

This extra step came about after great help from the very active [Dutch OSM mailing list][20]. You can read the relevant thread [here][21]. It became clear that the clip/reproject step was necessary. The reason is most probably the Mapnik bug <http://trac.mapnik.org/ticket/308>.

Also make sure that you have the proper settings for EPSG:28992 in PROJ&#8217;s EPSG file, usually located in `/usr/share/proj/epsg` and make sure that this setting is actually used by `ogr2ogr`. Older versions of GDAL may use their own PROJ settings in their .csv files. The [PROJ/PostGIS/GDAL issues around EPSG:28992][22] deserve a blog-post by themselves. At this moment even [http://spatialreference.org/ref/epsg/28992][23] publishes wrong PROJ values. The issue mainly deals with the `+towgs84` parameter, needed for reprojections, not being present.

**Step 5: install and configure OSM Mapnik tools**  
This step involves changing the OSM-specific Python-scripts and the Mapnik XML configuration (&#8220;The Mapnik Map File&#8221;) for invoking Mapnik.

I installed SVN rev. 20274 with the command `<br />
svn export http://svn.openstreetmap.org/applications/rendering/mapnik` and ran  
`generate_xml.py` to generate a basic configuration.

The main step is making changes to the Mapnik map file `osm.xml` and its included files in `inc/*.xml.inc`. Below is relevant info.

We need to determine the extent for our tiling scheme. This is in general different from the extent of the dataset. It is the same extent that you will need in your tiling server like [TileCache][24] and your web client like [OpenLayers][25]. There is unfortunately no Dutch standard for this extent. I have used the following values

<pre>EPSG:28992 (RD)       -65200.96,    242799.04  375200.96,   683200.96
 EPSG:4326 (WGS84)     2.307,	       50.134         8.752,	       54.087
</pre>

Change extent in `datasource-settings.xml.inc`:

<pre>2.307,50.134,8.752,54.087
</pre>

Since our PostGIS data is in EPSG:4326 change `inc/settings.xml.inc`:

<pre>&lt; !ENTITY osm2pgsql_projection "&srs4326;"&gt;
</pre>

Edit `inc/entities.xml.inc` and add new XML entity for the [Proj][26] definition for EPSG:28992.

<pre>&lt; !ENTITY srs28992 "+proj=sterea
          +lat_0=52.15616055555555 +lon_0=5.38763888888889
          +k=0.9999079 +x_0=155000 +y_0=463000
          +ellps=bessel 
          +towgs84=565.237,50.0087,465.658,-0.406857,0.350733,-1.87035,4.0812
          +units=m +no_defs"&gt;
</pre>

See also [here][27] for the right &#8220;Proj&#8221; definition. The only change required in `osm.xml` is:

<pre>&lt;Map bgcolor="#b5d0d0" srs="&srs28992;" minimum_version="0.6.1"&gt;
</pre>

There is no need to change Layer elements in `osm.xml` since they keep the projection from the entity `osm2pgsql_projection`.

In `inc/layer-shapefiles.xml.inc` change the names/projections to those of the extracted/reprojected shape files in Step 4. I have used XML entities as follows:

<pre>&lt;layer name="world" status="on" srs="&srs;"&gt;
     &lt;stylename&gt;world&lt;/stylename&gt;
    &lt;datasource&gt;
       &lt;parameter name="type"&gt;shape&lt;/parameter&gt;
       &lt;parameter name="file"&gt;&world_boundaries;/shoreline_300_&projection;&lt;/parameter&gt;
    &lt;/datasource&gt;
&lt;/layer&gt;
</pre>

With `&srs;` being EPSG:28992 and `&projection;` 28992.

**Step 6: Generate Test Tile**  
The moment of truth ! We are going to generate a single map image to test all of our settings.  
I made a copy of the Python file `generate_image.py` and modifed this file as follows:

<pre>if __name__ == "__main__":
    try:
        mapfile = os.environ['MAPNIK_MAP_FILE']
    except KeyError:
        mapfile = "osm.xml"
    map_uri = "/path/to/output/file.png"

    # Map image bbox
    ll = (4, 52.3, 5, 52.5)
    
    # zoomlevel
    z = 10
    imgx = 50 * z
    imgy = 50 * z

    m = mapnik.Map(imgx,imgy)
    mapnik.load_map(m,mapfile)
    prj = mapnik.Projection("
     +proj=sterea +lat_0=52.15616055555555 
     +lon_0=5.38763888888889 
     +k=0.9999079 +x_0=155000 +y_0=463000  
     +ellps=bessel 
     +towgs84=565.237,50.0087,465.658,-0.406857,0.350733,-1.87035,4.0812 
     +units=m +no_defs")
    c0 = prj.forward(mapnik.Coord(ll[0],ll[1]))
    c1 = prj.forward(mapnik.Coord(ll[2],ll[3]))
    if hasattr(mapnik,'mapnik_version') and mapnik.mapnik_version() &gt;= 800:
        bbox = mapnik.Box2d(c0.x,c0.y,c1.x,c1.y)
    else:
        bbox = mapnik.Envelope(c0.x,c0.y,c1.x,c1.y)
    m.zoom_to_box(bbox)
    im = mapnik.Image(imgx,imgy)
    mapnik.render(m, im)
    view = im.view(0,0,imgx,imgy) # x,y,width,height
    view.save(map_uri,'png')

</pre>

It was here that many of the issues solved above emerged. Below is the image of the first attempt with a silent failure resulting in the World boundary shapefiles being ignored.

![][28] 

After using extract/clip (Step 4) the resulting image became as follows.

![][29] 

This looked much better. Now the final step is generating all tiles for The Netherlands. Normally this can be done with the OSM script `generate_tiles.py`, but this script is specific for the Google projection and should be rewritten for EPSG:28992 and the extent used above. For the time being I have used [TileCache][24] to render and serve the tiles. This is the final step.

**Step 7: render tiles with TileCache**  
Here I used a standard [TileCache][24] installation with the following configuration.

<pre>[osm_28992]
type=Mapnik
mapfile=/path/to/osm.xml
spherical_mercator=false
resolutions=860.160,430.080,215.040,107.520,53.760,26.880,13.440,6.720,3.360,
                     1.680,0.840,0.420,0.210,0.105,0.0525
metatile=yes
bbox=-65200.96, 242799.04, 375200.96, 683200.96
srs=EPSG:28992
</pre>

Note that the bbox is the same as the extent in the Mapnik mapfile. Together with these specific resolutions the resulting zoom-levels will approach natural map scales used in The Netherlands like 1:25000. Tiles will be generated during requests. One can also explicitly generate tiles using the standard TileCache script `tilecache_seed.py`. I used:

<pre>su -s /bin/bash -c "tilecache_seed.py osm_28992 0 12" www-data
</pre>

This will take quite some time also dependent on your TileCache installation (CGI/FastCGI). IMO it will be better to rewrite OSM `generate_tiles.py`. Below is a resulting excerpt from generated tiles.

![][30] 

Somehow the map looks somewhat more busy than the standard OSM &#8220;Slippy Map&#8221;. This may be due to settings in `osm.xml` with respect to scales and showing/hiding layers.

**Finally**

I hope the above info is useful not just for those that need to generate tiles in Dutch projection but also for other projections. For example for an [INSPIRE][31] project I have generated tiles in ETRS89 (EPSG:4258) with some slight modifications to the Mapnik config and TileCache config. Some further work could include more automation within the OSM Mapnik scripts/config in particular `generate_tiles.py`. Also, being able to use these tiles in [GeoWebCache][32] would be very useful.

 [1]: uploads/2010/03/osm-rdtiles.jpg
 [2]: http://www.openstreetmap.org
 [3]: http://www.rdnap.nl/
 [4]: http://spatialreference.org/ref/epsg/28992
 [5]: http://wiki.openstreetmap.org
 [6]: http://wiki.openstreetmap.org/wiki/Map_Making_Overview
 [7]: http://wiki.openstreetmap.org/wiki/OpenStreetMap_License
 [8]: http://wiki.openstreetmap.org/wiki/Renderers
 [9]: http://www.openstreetmap.nl
 [10]: http://www.and.com/
 [11]: http://docs.openlayers.org/library/spherical_mercator.html
 [12]: http://spatialreference.org/ref/epsg/3785
 [13]: http://wiki.openstreetmap.org/wiki/Mapnik
 [14]: http://www.ubuntu.com/
 [15]: http://wiki.openstreetmap.org/wiki/Osm2pgsql
 [16]: http://mapnik.org
 [17]: http://wiki.openstreetmap.org/wiki/Mapnik/Installation
 [18]: http://gdal.org
 [19]: http://www.postgresql.org/docs/8.4/static/app-psql.html
 [20]: http://www.mail-archive.com/talk-nl@openstreetmap.org/info.html
 [21]: http://www.mail-archive.com/talk-nl@openstreetmap.org/msg09240.html
 [22]: http://bit.ly/9G5fAq
 [23]: http://spatialreference.org/ref/epsg/28992/
 [24]: http://tilecache.org
 [25]: http://openlayers.org
 [26]: http://trac.osgeo.org/proj
 [27]: http://spatialreference.org/ref/sr-org/6781/mapnik
 [28]: http://www.justobjects.org/assets/media/osm-28992-no-shapes.png
 [29]: http://www.justobjects.org/assets/media/osm-28992-ok.png
 [30]: http://www.justobjects.org/assets/media/osm-28992-detail.png
 [31]: http://inspire.jrc.ec.europa.eu/
 [32]: http://geowebcache.org