# justobjects.nl
justobjects.nl website

## Migration from WP
Links

* https://gohugo.io/tools/migrations/#wordpress
* https://ma.ttias.be/step-by-step-guide-migrating-wordpress-to-hugo/

Followed latter steps:

* backup WP and MySQL
* ssh ftpju011@wh-shell.xs4all.nl
  
* install the SchumacherFM/wordpress-to-hugo-exporter plugin. 
* https://github.com/SchumacherFM/wordpress-to-hugo-exporter/releases v2.0.0 
* Go to your WordPress, Plugins > Add New
* Pick Upload Plugin and choose the ZIP file you just downloaded
* Activate the plugin after installation
* Once the plugin is installed, you can try to go to Tools > Export to Hugo. That page might take a while to load.
  
If that works, you’ll be presented with a ZIP file that contains:
  
  All your posts & pages
  All your uploaded files (/wp-content/*)

* zip file 116 MB ! project/justobjects/www/justobjects.nl/archive/hugo-export.zip
* in project/justobjects/www/justobjects.nl/git$ hugo new site site
* unzip archive/hugo-export.zip
* cp -r hugo-export/ ../git/site/content/
* $ git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
* $ echo 'theme = "ananke"' >> config.toml
* $ hugo server -D
