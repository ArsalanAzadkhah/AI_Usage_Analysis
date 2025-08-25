-- In This Section, we focus on Data Cleaning to make our dataset more readable. 

SELECT distinct age, grade FROM ai_used
order by 1;

UPDATE  ai_used
	SET grade = CASE
		WHEN age=14 THEN  8
		WHEN age=15 THEN  9
		WHEN age=16 THEN  10
		WHEN age=17 THEN  11
		WHEN age=18 THEN  12
	END;

ALTER TABLE ai_used
ALTER COLUMN grade TYPE SMALLINT
USING grade :: SMALLINT
-- I changed grade column to Integers for better analysis in future

BEGIN;

UPDATE ai_used
SET uses_ai_for_study = CASE
	WHEN uses_ai_for_study = 'TRUE' THEN 'Yes'
	WHEN uses_ai_for_study = 'FALSE' THEN 'No'
END;

SELECT * FROM ai_used
ORDER BY 1

COMMIT;

-- 

BEGIN;

UPDATE ai_used
SET 
	uses_chatgpt = CASE WHEN uses_chatgpt = 'TRUE' THEN 'Yes' ELSE 'No' END,
	uses_gemini = CASE WHEN uses_gemini = 'TRUE' THEN 'Yes' ELSE 'No' END,
	uses_grammarly = CASE WHEN uses_grammarly = 'TRUE' THEN 'Yes' ELSE 'No' END,
	uses_quillbot = CASE WHEN uses_quillbot = 'TRUE' THEN 'Yes' ELSE 'No' END,
	uses_notion_ai = CASE WHEN uses_notion_ai = 'TRUE' THEN 'Yes' ELSE 'No' END,
	uses_phind = CASE WHEN uses_phind = 'TRUE' THEN 'Yes' ELSE 'No' END,
	uses_edu_chat = CASE WHEN uses_edu_chat = 'TRUE' THEN 'Yes' ELSE 'No' END,
	uses_other = CASE WHEN uses_other = 'TRUE' THEN 'Yes' ELSE 'No' END;

SELECT * FROM ai_used
ORDER BY 1

COMMIT;