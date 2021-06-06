---
title: 'MIDP 2  on Mac OS X is here !'
author: Just van den Broecke
type: post
date: 2005-03-11T21:21:08+00:00
excerpt: Finally we can develop/test and deploy J2ME MIDP 2.x apps on Mac OS X
url: /midp-2-on-mac-os-x-is-here/
categories:
  - Mobile
  - Software

---
{{< a-img data-href="javascript:return false;" data-src="/uploads/2005/03/bluetooth.gif" data-class="float_left" >}}
Since Mac OS X is already my preferred platform for Java development, I was very pleased to experience that J2ME development for MIDP 2.0 has finally become reality. I can now develop, compile, verify, package, run, debug and deploy MIDP 2.0 MIDlets from within my Java IDE ([IntelliJ IDEA][2]). All thanks to [Michael Powers mpowerplayer][3]. Best way to start is to go to [developer.mpowerplayer.com][4] and download the SDK. But there is more.

The [Mpowerplayer][3] offers the tools familiar to J2ME developers: MIDP2.0 jars, the preverify tool and a MIDP2.0 emulator. Additionally, if your Mac has [Bluetooth][5] support, you can quickly deploy your MIDLet using the OS X [Bluetooth File Exchange][6]. To automate deployment I wrote a one-line script `btsend.sh` that is called directly from within [Ant][7]:

```
#!/bin/sh

/usr/bin/open -a "/Applications/Utilities/Bluetooth File Exchange.app" $1
```

and then from within Ant  

```
<target name="deploy">
  <exec executable="${basedir}/btsend.sh">
    <arg line="${myproject.jar}"/>
  </exec>
</target>
```

The only manual action is to select your mobile device from the Bluetooth File Exchange list of devices. On my Nokia 6600 phone I receive an incoming message and the installer is run.

{{< a-img data-href="javascript:return false;" data-src="/uploads/2005/03/gps-earthmate.png" data-class="float_left" >}}
If you are developing Bluetooth-based MIDlets using [the JSR-82 Bluetooth API][9] you can additionally download, evaluate and acquire the [Avetana JSR-82 implementation for OS X][10]. This allows you to fully test Bluetooth-based J2ME apps from within your IDE on Mac OS X. For example, I was able to connect and test to the [Delorme Blue Logger GPS][11]  

 [2]: http://www.jetbrains.com
 [3]: http://www.mpowerplayer.com
 [4]: http://developer.mpowerplayer.com
 [5]: http://www.bluetooth.org
 [6]: http://www.apple.com/bluetooth/
 [7]: http://ant.apache.org
 [9]: http://www.jcp.org/en/jsr/detail?id=82
 [10]: http://www.avetana-gmbh.de/avetana-gmbh/produkte/jsr82.eng.xml
 [11]: http://www.delorme.com/bluelogger
