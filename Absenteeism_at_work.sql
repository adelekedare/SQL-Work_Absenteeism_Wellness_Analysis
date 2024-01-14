--- Optimmized Query---

SELECT
        a.ID,
        c.Reason,
        Month_of_absence,
        Body_mass_index,
    CASE
        WHEN Body_mass_index  < 18.5 THEN 'Underweight'
        WHEN Body_mass_index BETWEEN 18.5 and 25 THEN 'Healthy weight'
        WHEN Body_mass_index BETWEEN 25 and 30 THEN 'Overweight'
        WHEN Body_mass_index  > 18.5 THEN 'Obese'
        ELSE 'Unknown'
    END 
        AS 'BMI_Category',    
    CASE
        WHEN Month_of_absence IN (12,1,2) THEN 'Winter'
        WHEN Month_of_absence IN (3,4,5) THEN 'Spring'
        WHEN Month_of_absence IN (6,7,8) THEN 'Summer'
        WHEN Month_of_absence IN (9,10,11) THEN 'Fall'
        ELSE 'Unknown'
    END 
        AS 'Season_Names',
Day_of_the_week,
Transportation_expense,
Pet,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours,
Distance_from_Residence_to_Work,
Seasons,
Service_time,
Hit_target,
Disciplinary_failure,
Education,
son,
Social_drinker,
CASE
            WHEN Social_drinker = 0 THEN 'Non-Drinker'
            WHEN Social_drinker = 1 THEN 'Drinker'
            ELSE 'Unknown'
    END 
            AS 'Drinker_category',
Social_smoker,
    CASE
             WHEN Social_smoker = 0 THEN 'Non-smoker'
            WHEN Social_smoker = 1 THEN 'Smoker'
            ELSE 'Unknown'
    END 
            AS 'Smoker_category',
Height,
Weight
from Absenteeism_at_work a
left JOIN compensation b 
ON a.ID = b.ID
left JOIN Reasons c 
ON a.Reason_for_absence = c.Number;



