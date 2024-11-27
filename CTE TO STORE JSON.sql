
--Select Detail from [dbo].[SeenClientAnswers] FOR JSON AUTO
--Select * from [dbo].[SeenClientAnswers] FOR JSON PATH;

----CREATE TABLE TO STORE JSON VALUE  
Create table Logs (
    Id bigint primary key identity,
    DetailJSON nvarchar(max)
		CHECK(ISJSON(DetailJSON) =1)
);

---USE CTE OPERATOR TO STORE RESPECTIVE COLUMN DATA INTO JSON
WITH CTE as 
(
Select Id, SeenClientAnswerMasterId, SeenClientAnswerChildId,
DetailJSON =
(
Select Id, Detail from [dbo].[SeenClientAnswers] FOR JSON AUTO
)
from [dbo].[SeenClientAnswers]
)

Select * from CTE where DetailJSON IS NOT NULL

