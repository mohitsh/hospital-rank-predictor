# hospital-rank-predictor
Hospital ranking based on mortality rate.

Data is taken from a US hopital details are mentioned in Hospital_Revised_Flatfiles.pdf file.
The code basically ranks various hospitals of the United States based on the mortality rate, i.e. 
hospital with lowest mortality rate is the best and vice-versa.
Details about hopital name, state name, zip code, city, county etc are given in hospital-data.csv 
Data for different types of mortality rates are is given in outcome-of-care-measure.csv file.

The function takes 3 params: state, outcome and num
where state is the state name, outcome is type of mortality rate you want to base your ranking on, 
num is the ranking you want to know, default value for num is "best" i.e. 1

example:
rankhospital ("LA", "heart attack", 3)

result:
[1] "BATON ROUGE GENERAL MEDICAL CENTER"

rankhospital ("LA", "heart attack", num = "best")

result:
[1] "ST FRANCIS MEDICAL CENTER"

