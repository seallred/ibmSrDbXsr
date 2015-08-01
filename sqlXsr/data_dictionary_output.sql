select remarks from SYSIBM.SYSCOLUMNS where length(remarks) > 0

h3. XSR.PMR_ADV_ROUTE_SET
----
Defines a route set that can be comprised of a set of rules with different criteria.  Used for routing production service requests.

select 'h3. ' concat
   rtrim(tabschema) concat
   '.' concat
   tabname concat
   '; ' concat
   remarks
from syscat.tables
 where length(remarks) > 0
   and tabschema = 'XSR';

select * from syscat.tables

SELECT 'SELECT ''' CONCAT
tabname CONCAT
''', COUNT(*) FROM ' CONCAT
RTRIM(tabschema) CONCAT
'.' CONCAT
tabname CONCAT
';'
FROM syscat.tables
WHERE tabschema = 'SYSCAT'
AND tabname LIKE 'N%'
ORDER BY tabschema
,tabname;
