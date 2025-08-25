CREATE TABLE ai_used (
	
	student_id SERIAL PRIMARY KEY,
	age SMALLINT NOT NULL,
	grade VARCHAR(10) NOT NULL,
	field VARCHAR(20) NOT NULL,
	uses_ai_for_study VARCHAR(20),
	most_used_device VARCHAR(20),
	uses_chatgpt VARCHAR(20),
	uses_gemini VARCHAR(20),
	uses_grammarly VARCHAR(20),
	uses_quillbot VARCHAR(20),
	uses_notion_ai VARCHAR(20),
	uses_phind VARCHAR(20),
	uses_edu_chat VARCHAR(20),
	uses_other VARCHAR(20),
	usefulness_chatgpt SMALLINT,
	usefulness_gemini SMALLINT,
	usefulness_grammarly SMALLINT,
	usefulness_quillbot SMALLINT,
	usefulness_notion_ai SMALLINT,
	usefulness_phind SMALLINT,
	usefulness_edu_chat SMALLINT,
	usefulness_other SMALLINT

)

SELECT * FROM ai_used;
