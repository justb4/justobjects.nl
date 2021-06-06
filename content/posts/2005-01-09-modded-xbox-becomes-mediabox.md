---
title: Modded XBOX becomes MediaBox
author: Just van den Broecke
type: post
date: 2005-01-09T20:23:58+00:00
url: /modded-xbox-becomes-mediabox/
featured_image: uploads/2005/01/xbox-150x93.jpg
categories:
  - MediaTech

---
{{< a-img data-href="javascript:return false;" data-src="/uploads/2005/01/xbox.jpg" data-class="float_left" >}}
I acquired an [Xbox][2] at [Dixons][3] for EUR 199,99 (ok, leave the 1 ct to Bill I said at the counter). Sometime later I had an almost complete home entertainment center/multimedia jukebox playing all my audio files (mp3, wav, ogg,..) , shoutcast streams, video files (mpg, avi, divx, and even quicktime) and photo slideshows (with background music) with a remote control on the TV-set in the living room from my Linux server in the attic. Plus offcourse I can play regular audio/mp3/video CDs and **region-free** DVDs.  

My original topic [LinuxMMBox][4] is now sort of obsolete, except maybe for the PVR option, but the [Dreamix Project][5] is even working on Xbox PVR.

The Xbox out of the box is boring: you can play games, audio CDs and DVDs ([with remote control][6]) bound to your region. I acquired the [remote control][6] as well. Now comes the fun part: [the Xbox can be modified][7] into basically a regular PC (not bad for EUR 200!) with multimedia capabilities and networking (network card is built-in).

### The Xbox is a PC
Although the XBox is a games console (and Microsoft have tried hard to hide the fact) it is essentially a standard computer. It has all the same major hardware components but costs less than a similar specification PC &#8211; the clearest differences lie only in the packaging and the software. The most important piece of software is a small bit of code that runs as soon as the machine turns on called the BIOS. This BIOS program is held in a memory chip soldered directly onto the board.

On startup the Xbox runs the Bios which tells it to look for a disc in the DVD drive. If one is found, the BIOS ensures it is either a Microsoft certified game or an audio CD. Assuming the disc is ok, the CD plays and all is well&#8230; (if you buy a [DVD dongle][6] you can also play DVDs of your own region).

However, if the drive is empty or any other type of disc is found, it runs its own mini-OS known as the dashboard which lets you set the clock and look at save games but very little else. Now, imagine for a moment you can alter the XBox&#8217;s BIOS to let you play backups of your XBox games, DivX movies, MP3s, any region DVDs (without the dongle), play any arcade/SNES/megadrive/atari/etc games, play online without XBox Live and much MUCH more.

Put simply, you can! You need to replace the BIOS with something that is less picky about what it can run. Fortunately these BIOSes have been written for you, you just need to get them into your XBOX&#8230;

### My Setup
With my Xbox having been modded, my software setup is simple: as a &#8220;dashboard&#8221; (the program that starts when you power up the Xbox) I use the [XBox Media Player (XBMP)][8],  
a simple and very easy-to-use media player. XBMP can play everything: audio (mp3, wav..), video (DivX, mpeg, QuickTime etc), images (JPEG,..) in slideshows (also with audio playing in the background!). Even Shoutcast channels (internet radio) can be played.

I keep all my media files on my Linux server. I use Samba shares and [Apache::MP3][9] to play my MP3s anywhere. Now as not having to copy all my files to the Xbox, I run the [ccxstream server][10] on my Linux server, such that these files can be accessed from the Xbox. The concept of ccxtream is similar  
to that of Samba. A regular cronjob extracts all top-Shoutcast channels.

### Adding PVR
The XBox itself cannot do PVR (Personal Video Recording) but I am planning a setup using [EyeTV from ElGato][11] on my Mac and saving the recordings on my Linux server, who in turn can serve them out to the Xbox as it does already. This setup is similar to [an article written by Jon][12].

Another option is to use an open-source digital video jukebox (PVR, DVR) based on Linux like [Freevo][13], or [MythTV][14]

### Links
Try out these links. They give you ample info on how to get things done. Tip: try the Tutorials first on <http://www.xbox-scene.com>

<http://www.xbox-scene.com> &#8211; the main Xbox site to consult  
<http://www.xboxmediaplayer.de> &#8211; the Xbox Media Player (XBMP) and streaming servers (ccxstream)  
<http://dreamix.sourceforge.net> &#8211; Dreamix Project  
<http://freevo.sourceforge.net> &#8211; Freevo Project  
<http://www.delgul.demon.nl/xbox/> &#8211; HOWTO on getting Xebian, Freevo and the xbox remote running

 [1]: uploads/2005/01/xbox.jpg
 [2]: http://www.xbox.com
 [3]: http://www.dixons.nl
 [4]: index.php?p=1
 [5]: http://dreamix.sourceforge.net
 [6]: http://www.xbox.com/system/DVD+Movie+Playback+Kit.htm
 [7]: http://www.xbox-scene.com/articles/beginnersguide.php
 [8]: http://www.xboxmediaplayer.de
 [9]: http://www.apachemp3.com/
 [10]: http://www.xboxmediaplayer.de/
 [11]: http://www.elgato.com
 [12]: http://www.jonsthoughtsoneverything.com/archives/000009.php
 [13]: http://freevo.sourceforge.net
 [14]: http://www.mythtv.org
