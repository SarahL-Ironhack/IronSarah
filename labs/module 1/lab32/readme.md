LAB 32 EXPLANATIONS

1. Upload data on Python
2. Check infos
3. Drop the columns "Department" since all was filled with 78, so not interesting to keep since it has no added value 
4. Count the number of empty values thanks to isnull sum
5. Replace empty values: all were replaced manually because they all belonged to already existing clients, so with reliable data to enter (no need to guess or put a default value). 
Error message on Jupyter but the change has still been done. 
6. Harmonizing all the categorical data for futur encoding: example Student/student/etudiant => all to Student , same for HR/hr etc. 
7. sort values from categorical data to make sur there are no oversights
8. Drop 4 rows that looked like outliers : 3 birthyears after 2010 (less than 10 years old), and one amout en 2M which is way more than the others. 
9. Encode all categorical data and drop columns that are not encoded 

10. 
