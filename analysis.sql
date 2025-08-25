-- In this section, we dive into different analyses on the dataset to find useful insights for a better perception of students' behaviour in this institution.


SELECT COUNT(student_id) FROM ai_used;
-- WE have 500 students


SELECT grade, COUNT(student_id) AS number_of_students,
			  COUNT ( CASE WHEN uses_ai_for_study = 'Yes' then 1  END) AS students_using_ai,
			  ROUND( (COUNT ( CASE WHEN uses_ai_for_study = 'Yes' then 1  END):: NUMERIC/
			  COUNT(student_id))*100,2) AS percent_of_using_ai
FROM ai_used 
GROUP BY grade
ORDER BY grade  
-- It gives us insight into how many students we have in each grade and how many of them are using AI
-- Also, we know that most of the students use AI these days, especially in the 8th grade in our institution.



SELECT  field,
		SUM(CASE uses_ai_for_Study WHEN 'Yes' then 1 END) AS num_stu_using_ai
FROM ai_used
GROUP BY field
-- It shows how many students use AI tools in each field, which we realize that students
-- In mathematics, students use AI tools the most.



SELECT  grade,
		field,
		COUNT(field) AS number_of_stu,
		SUM(COUNT(field)) OVER (PARTITION BY grade) AS num_of_stu_in_grade,
		ROUND((COUNT(field)::NUMERIC /SUM(COUNT(field)) OVER (PARTITION BY grade))*100,2) AS percent_of_stu_in_grade
FROM ai_used
GROUP BY grade,field
ORDER BY grade
-- It shows the number of students in each field by grade and the percentage of them in each field.
-- It's obvious that most of the students in our institution study Math, and the least is Humanities.



SELECT  most_used_device,
		COUNT(most_used_device) :: NUMERIC	AS number_of_students,
		SUM( CASE uses_ai_for_study WHEN 'Yes' THEN 1 END) AS students_using_ai,
		ROUND((COUNT(most_used_device) :: NUMERIC/500)*100,2) AS percent_using_device_by_students
FROM ai_used
GROUP BY most_used_device
ORDER BY COUNT(most_used_device) :: NUMERIC DESC
-- 1. It shows that more than half of the students use Mobile for using AI tools and also doing their
-- homework since it's easier to use and carry. 
-- 2. Also, it shows us a comparison between the number of students using AI by each device



BEGIN;

UPDATE ai_used
	SET uses_ai_for_study = CASE
		WHEN uses_ai_for_study = 'TRUE' THEN 'Yes'
		WHEN uses_ai_for_study = 'FALSE' THEN 'No'
	END;

SELECT * FROM ai_used

ROLLBACK;



SELECT  grade, 
		SUM(CASE uses_ai_for_study WHEN 'Yes' THEN 1 END) AS stu_using_ai,
		SUM(CASE uses_chatgpt WHEN 'Yes' THEN 1 END ) AS stu_using_chatgpt,
		SUM(CASE uses_gemini WHEN 'Yes' THEN 1 END ) AS stu_using_gemini,
		SUM(CASE uses_grammarly WHEN 'Yes' THEN 1 END ) AS stu_using_grammarly,
		SUM(CASE uses_quillbot WHEN 'Yes' THEN 1 END ) AS stu_using_quillbot,
		SUM(CASE uses_notion_ai WHEN 'Yes' THEN 1 END ) AS stu_using_notion_ai,
		SUM(CASE uses_phind WHEN 'Yes' THEN 1 END ) AS stu_using_phind,
		SUM(CASE uses_edu_chat WHEN 'Yes' THEN 1 END ) AS stu_using_edu_chat,
		
		( CASE GREATEST(		
		SUM(CASE uses_chatgpt WHEN 'Yes' THEN 1 END ),
		SUM(CASE uses_gemini WHEN 'Yes' THEN 1 END ),
		SUM(CASE uses_grammarly WHEN 'Yes' THEN 1 END ),
		SUM(CASE uses_quillbot WHEN 'Yes' THEN 1 END ),
		SUM(CASE uses_notion_ai WHEN 'Yes' THEN 1 END ),
		SUM(CASE uses_phind WHEN 'Yes' THEN 1 END ),
		SUM(CASE uses_edu_chat WHEN 'Yes' THEN 1 END )		
		)
		WHEN SUM(CASE uses_chatgpt WHEN 'Yes' THEN 1 END ) THEN 'chatgpt' 
		WHEN SUM(CASE uses_gemini WHEN 'Yes' THEN 1 END ) THEN 'gemini' 
		WHEN SUM(CASE uses_grammarly WHEN 'Yes' THEN 1 END ) THEN 'grammarly'
		WHEN SUM(CASE uses_quillbot WHEN 'Yes' THEN 1 END ) THEN 'quillbot' 
		WHEN SUM(CASE uses_notion_ai WHEN 'Yes' THEN 1 END ) THEN 'notion_ai'
		WHEN SUM(CASE uses_phind WHEN 'Yes' THEN 1 END ) THEN 'phind'
		WHEN SUM(CASE uses_edu_chat WHEN 'Yes' THEN 1 END ) THEN 'edu_chat'
		END  ) AS the_most_used_tool
FROM ai_used
GROUP BY grade
ORDER BY 1
-- 1. It shows how many students use which one of the AI tools in every grade.
-- 2. It also shows which AI tools are the most useful ones among students in each grade



SELECT  ROUND(AVG(usefulness_chatgpt),2) AS chatgpt_rate,
		ROUND(AVG(usefulness_gemini),2) AS gemini_rate,
		ROUND(AVG(usefulness_grammarly),2) AS grammarly_rate,
		ROUND(AVG(usefulness_quillbot),2) AS quillbot_rate,
		ROUND(AVG(usefulness_notion_ai),2) AS notion_ai_rate,
		ROUND(AVG(usefulness_phind),2) AS phind_rate,
		ROUND(AVG(usefulness_edu_chat),2) AS edu_chat_rate,
		ROUND(AVG(usefulness_other),2) AS other_rate
FROM ai_used
-- It shows that ChatGPT and notion_ai are the most useful AI tools among the students.
-- On the other hand, Phind is the least useful AI tool.

