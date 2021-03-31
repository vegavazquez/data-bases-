#1
SELECT * FROM research_db.Institutions WHERE UpdateDate IS NULL;
#2
SELECT DISTINCT e.Name,e.DNI FROM research_db.Employees e JOIN research_db.Samples s ON e.DNI=s.Employees_DNI JOIN research_db.Collections co ON s.Collections_idCollection=co.idCollection WHERE co.idCollection=1;
#3
SELECT DISTINCT  e.Name, e.DNI, e.URL, e.Address FROM research_db.Employees e JOIN 	research_db.ResearchStudies_has_Employees se ON e.DNI= se.Employees_DNI JOIN research_db.ResearchStudies rs ON 	se.ResearchStudies_idResearchStudy=rs.idResearchStudy WHERE StartDate != '2018-01-16';
#4
SELECT * FROM research_db.Employees e LEFT JOIN research_db.ResearchStudies_has_Employees r ON e.DNI= r.Employees_DNI  WHERE r.ParticipationType IS NULL;
#5
SELECT e.Name, e.DNI,e.URL, e.Address  FROM research_db.Employees e JOIN research_db.Employees_has_Institutions ei ON e.DNI=ei.Employees_DNI JOIN research_db.Institutions i ON ei.Institutions_idInstitution=i.idInstitution WHERE i.idInstitution=1 AND (ei.EndDate > sysdate() OR EndDate IS NULL);
#6
SELECT  rs.Name FROM research_db.ResearchStudies rs JOIN research_db.ResearchStudies_has_Employees re ON rs.idResearchStudy=re.ResearchStudies_idResearchStudy JOIN research_db.Employees e ON re.Employees_DNI= e.DNI 	WHERE 		e.DNI='54569875T' AND EndDate< sysdate();
#7
SELECT e.Name,e.DNI,i.Name FROM research_db.Employees e JOIN research_db.Employees_has_Institutions ei ON e.DNI=ei.Employees_DNI JOIN research_db.Institutions i ON ei.Institutions_idInstitution= i.idInstitution WHERE ei.EndDate>sysdate() 	OR 	ei.EndDate IS NULL;
#8
SELECT c.Acronym,c.Description FROM research_db.Collections c JOIN research_db.ResearchStudies rs ON 	c.idCollection=rs.Collections_idCollection JOIN research_db.Publications p ON rs.idResearchStudy=p.ResearchStudies_idResearchStudy;
#9
SELECT COUNT(s.idSample), c.idCollection FROM research_db.Samples s JOIN research_db.Collections c ON s.Collections_idCollection=c.idCollection  GROUP BY (c.idCollection);
#10
SELECT i.Name,e.DNI,s.idSample FROM research_db.Institutions i  JOIN research_db.Employees_has_Institutions  ei ON i.idInstitution=ei.Institutions_idInstitution JOIN research_db.Employees e ON ei.Employees_DNI=e.DNI JOIN research_db.Samples s ON e.DNI=s.Employees_DNI WHERE EndDate IS NULL OR EndDate> sysdate();
#optional
#Get the name of the diagnosis  obtain from the donors  with ages between 10-20  with each corresponding samples and the employee who took that sample
SELECT di.Name, d.idDonnor, s.idSample,e.Name,e.DNI FROM research_db.Employees e JOIN research_db.Samples s ON 	e.DNI=s.Employees_DNI JOIN research_db.Donnors d ON s.Donnors_idDonnor=d.idDonnor JOIN research_db.Diagnosis di ON d.Diagnosis_idDiagnosis= di.idDiagnosis WHERE 10<d.Age<20 ;









