---
title: Moving PostGIS tables from the public schema to a new schema
author: Just van den Broecke
type: post
date: 2013-02-01T16:40:38+00:00
url: /moving-postgis-tables-from-the-public-schema-to-a-new-schema/
featured_image: uploads/2013/02/Logo_square_postgis-150x150.png
categories:
  - osgeo
  - Software
tags:
  - PostGIS

---
Update 30 nov 2013: [code is now as a GIST on GitHub][6], also with function to move single table.

Update 19 feb 2014: **_not yet tested with PostGIS v2.0 and up, so beware (or let me know if that works)!_**

Update 4 june 2015: **_tested with PostgreSQL 9.3.4 and PostGIS v2.1: all ok!! _**

Using [PostgreSQL Schema&#8217;s][1] when using [PostGIS][2] is very useful. Instead of the default _public_ schema where PostGIS and its meta-tables (_geometry_columns_ and _spatial\_ref\_sys_) are installed one can use an explicit schema. One main reason, at least for me, is that PostgreSQL Schema&#8217;s allow me to make data dumps of the Schema (via [pg_dump][3])  and restore these dumps in another database, even on another system. When using the default _public _schema a dump would also include PostGIS functions and metatables. This is problematic to restore on another system or higher PostgreSQL/PostGIS version. So I recommend always to use Schema&#8217;s.

But what if your tables are already in the _public_ schema? This was the case in some of my older projects like [GeoSkating][4] which has tables in PostgreSQL 8.2 in the _public_ schema. With some hacking and [surfing][5] on the web, I constructed an SQL function that would move my tables from the _public S_chema to any other Schema and update the PostGIS metatables (and leave these in the _public _Schema). See the function _postgis\_schema\_move_() below.

```
-- Function to move tables to schema
CREATE OR REPLACE FUNCTION
       public.postgis_schema_move(old_schema varchar(32),
         new_schema varchar(32)) RETURNS void AS $$
DECLARE
    row record;
BEGIN
    FOR row IN SELECT tablename FROM pg_tables
            WHERE schemaname = old_schema and tablename != 'spatial_ref_sys'
              AND tablename != 'geometry_columns'
    LOOP
        EXECUTE 'ALTER TABLE ' || quote_ident(old_schema) || '.'
                 || quote_ident(row.tablename) ||
                    ' SET SCHEMA ' || new_schema || ';';
        EXECUTE 'UPDATE public.geometry_columns
                 SET f_table_schema = ' || quote_literal(new_schema) ||
                  ' WHERE f_table_schema = ' || quote_literal(old_schema) ||'
                    AND f_table_name = ' || quote_literal(row.tablename) || ';';
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Example: Move from public to schema app
SELECT public.postgis_schema_move('public', 'app');</pre>
```

The SQL function _postgis\_schema\_move()_ takes two string arguments: the _old_schema_ and _new_schema_, the old (usually _&#8216;public&#8217;_) and  new schema names. The new schema needs to be created first. Also moving back from a new schema to the _public_ schema works.

 [1]: http://www.postgresql.org/docs/9.2/static/ddl-schemas.html
 [2]: http://postgis.org/
 [3]: http://www.postgresql.org/docs/9.2/static/app-pgdump.html
 [4]: http://geoskating.com
 [5]: http://blog.coreycoogan.com/2010/12/22/how-to-move-postgresql-tables-to-a-different-schema/
 [6]: https://gist.github.com/justb4/7719180
