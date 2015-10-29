
#query for broader narrower relationships - 1 level per time
#change filter values to go up or down


construct 
{?s1 <http://www.w3.org/2004/02/skos/core#narrower> ?s2 .
?s2 <http://www.w3.org/2004/02/skos/core#broader> ?s1 .} 
where 
{
?s1 <http://www.w3.org/2004/02/skos/core#prefLabel> ?o1 
. 
?s2  <http://www.w3.org/2004/02/skos/core#prefLabel> ?o2 
filter(strlen(?o2)=2 && substr(str(?o2),1,1)=str(?o1)). }

#exhaustive query - makes full connections of dataset

construct 
{?s1 <http://www.w3.org/2004/02/skos/core#narrower> ?s2 .
?s2 <http://www.w3.org/2004/02/skos/core#broader> ?s1 .} 
where 
{
?s1 <http://www.w3.org/2004/02/skos/core#prefLabel> ?o1 
. 
?s2  <http://www.w3.org/2004/02/skos/core#prefLabel> ?o2 
filter(strlen(?o2)=(strlen(?o1)+1) && substr(str(?o2),1,strlen(?o1))=str(?o1)). }
limit 100
