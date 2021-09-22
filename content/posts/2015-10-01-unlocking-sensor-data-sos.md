---
title: Unlocking Sensor Data – I’ll send an SOS to the world
author: Just van den Broecke
type: post
date: 2015-10-01T00:42:56+00:00
url: /unlocking-sensor-data-sos/
featured_image: uploads/2015/10/Message-in-a-bottle-150x125.jpg
categories:
  - General
  - osgeo
  - Projects
  - Software
tags:
  - FOSS4G
  - geonovum
  - GeoSpatial
  - iot
  - ogc
  - OSgeo
  - SensorThings
  - SOS
  - standards
  - SWE

---
Revealing: the title refers, for the younger readers, to a great 1979-hit by The Police as expanded below. To be played at the loudest possible volume. If you don&#8217;t see anything here below try the YouTube link directly:

{{< youtube MbXWrmQW-OE >}}

One of the main aspects that glues the OSGeo-world together are OGC-standards: WMS, WFS, WMTS, WCS and WPS are, at least for most insiders, not hollow acronyms. But who knows about and uses SOS? SOS stands for _&#8220;Sensor Observation Service&#8221;_, [an OGC standard][1] within the elaborate framework of the [OGC SensorWeb Enablement][2].  SOS provides a standard to publish (SOS-T) and request time-based (meta-) data, mostly from &#8220;Sensors&#8221;. Its convention is similar to WMS/WFS (GetCapabilities, DescribeSensor, GetObservation etc). Think of weather or air quality measurements over time.

The Internet of [Things (IoT)][3]  is now gaining a strong momentum: _&#8220;The Internet of Things (IoT) is the network of physical objects or &#8220;things&#8221; embedded_ _with electronics, software, sensors, and network connectivity, which enables these  objects to collect and exchange data. The Internet of Things allows objects to be sensed and controlled remotely across existing network infrastructure, creating opportunities for more direct integration between the physical world and computer-based systems, and resulting in improved efficiency, accuracy and economic benefit Each thing is uniquely identifiable through its embedded computing system but is able to interoperate within the existing Internet infrastructure. Experts estimate that the IoT will consist of almost 50 billion  objects by 2020.&#8221; ([from Wikipedia][3])._

So how will SOS and the generic [OGC SensorWeb Enablement][2] will fit into this force? I really don&#8217;t know. For many of the OGC-standards like WMS, there are multiple implementations. For SOS  I know about just two: the [52 North SOS][4], and the [IstSOS][5].  Both of these are powerful with their own strengths and limitations.

I have worked successfully with the [52 North SOS][4] within a [Dutch project on Air Quality][6]. All details are in [this online document.][7] In essence we are (still) publishing and emitting Dutch National Air Quality data via a SOS server. At the same time, via GeoServer, using WMS-Time [via this web-client][8]. On the way I found that the OGC-SOS Standard is complex and quite cumbersome in its usage. 52 North has provided [a custom REST interface][9] that appeals to be more usable. But SOS with its inner talk of &#8220;Procedures&#8221; and &#8220;Offerings&#8221; remains a Hot Potato.

{{< a-img data-href="http://sensors.geonovum.nl/heronviewer/" data-src="/uploads/2015/10/heron-viewer-o3-ts.jpg" >}}

So the broader question is more about the OGC SOS standard and the related [OGC SensorWeb Enablement][2]  : how we as an OSGeo-community think it should evolve within the expanding world of the IoT? My opinion is that we need to strive for more ease-of-use. SOS-as-standard is an academic challenge. A window to the future may be the OGC-effort initiated by Steve Liang: the SensorThings API not only provides a simplification from the original  [OGC SensorWeb Enablement][2] but also a modern way of community-based cooperation of standards making via GtiHub: [http://ogc-iot.github.io/ogc-iot-api][10]. Time will tell, a message in a bottle will also eventually arrive.

 [1]: http://www.opengeospatial.org/standards/sos
 [2]: http://www.opengeospatial.org/projects/groups/sensorwebdwg
 [3]: https://en.wikipedia.org/wiki/Internet_of_Things
 [4]: http://52north.org/communities/sensorweb/sos/
 [5]: http://istsos.org/
 [6]: http://sensors.geonovum.nl/
 [7]: http://sospilot.readthedocs.org/en/latest/
 [8]: http://sensors.geonovum.nl/heronviewer/
 [9]: http://sensorweb.demo.52north.org/sensorwebclient-webapp-stable/api-doc/
 [10]: http://ogc-iot.github.io/ogc-iot-api/
