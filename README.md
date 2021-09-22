# justobjects.nl
justobjects.nl website. 
This site was migrated from Wordpress on xs4all.nl to Hugo in GitHub in 2021. 
Some glitches still present!

## Migration from WP
Links

* https://gohugo.io/tools/migrations/#wordpress
* https://ma.ttias.be/step-by-step-guide-migrating-wordpress-to-hugo/

Followed latter steps:

* backup WP and MySQL 
* install the SchumacherFM/wordpress-to-hugo-exporter plugin. 
* https://github.com/SchumacherFM/wordpress-to-hugo-exporter/releases v2.0.0 
* Go to your WordPress, Plugins > Add New
* Pick Upload Plugin and choose the ZIP file you just downloaded
* Activate the plugin after installation
* Once the plugin is installed, you can try to go to Tools > Export to Hugo. That page might take a while to load.
  
If that works, you’ll be presented with a ZIP file that contains:
  
  All your posts & pages
  All your uploaded files (/wp-content/*)

* zip file 116 MB ! hugo-export.zip
* in project/justobjects/www/justobjects.nl/git$ hugo new site site
* unzip archive/hugo-export.zip
* cp -r hugo-export/ ../git/site/content/
* $ git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
* $ echo 'theme = "ananke"' >> config.toml
* $ hugo server -D

Then added the [Hugo Clarity Theme](https://github.com/chipzoller/hugo-clarity).

From here the great [peter-govind](https://github.com/peter-govind) did further tweaks and stuff
to finally get a Hugo site!

Added GitHub Workflows, hosting on GitHub. 

Now maintaining the site is a breeze!
