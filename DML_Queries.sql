--- QUERIES on DB BAODIENTU

USE BAODIENTU
GO

-- 1. Truy vấn dữ liệu trên một bảng
-- Danh sách các bài báo đã được đăng
SELECT * FROM dbo.ARTICLE WHERE Art_Status = 1
GO

-- 2. Truy vấn có sử dụng Order by
-- Danh sách các bài báo đã được đăng theo thứ tự A-Z của tiêu đề (Art_Title)
SELECT * FROM dbo.ARTICLE WHERE Art_Status = 1 
ORDER BY Art_Title ASC
GO

-- 3. Truy vấn dữ liệu từ nhiều bảng sử dụng Inner join
-- Danh sách các bài báo bao gồm tiêu đề, tóm tắt, chuyên mục, tên phóng viên, thời gian đăng bài
SELECT Art_Title, Art_Sum, Genre_Name, Rept_Name, CONVERT(DATE, PB.Public_Time) Post_Date
FROM dbo.ARTICLE AR
	INNER JOIN dbo.REPORTER RP ON RP.Rept_ID = AR.Rept_ID
	INNER JOIN dbo.GENRE GR ON GR.Genre_ID = AR.Genre_ID
	INNER JOIN dbo.PUBLICATION PB ON PB.Art_ID = AR.Art_ID
WHERE Art_Status = 1 
GO

-- 4. Truy vấn thống kê sử dụng Group by và Having
-- Thống kê số lượng bài báo đã đăng của từng chuyên mục
SELECT Genre_Name, COUNT(*) Post_Qt FROM dbo.GENRE GR
	JOIN dbo.ARTICLE AR ON AR.Genre_ID = GR.Genre_ID
GROUP BY GR.Genre_ID, Genre_Name, Art_Status
HAVING Art_Status = 1
GO 

-- 5. Truy vấn sử dụng truy vấn con
-- Danh sách cái bài báo đã đăng có số comment > 1
SELECT Art_ID, Art_Title FROM dbo.ARTICLE AR
WHERE 1 < (
	SELECT COUNT(*) FROM dbo.COMMENT CM
	WHERE CM.Art_ID = AR.Art_id)
	AND Art_Status = 1
GO 

-- 6. Truy vấn sử dụng toán tử Like và các so sánh xâu ký tự.
-- Danh sách các bài báo đã đăng của các tác giả họ 'TRAN'
SELECT Art_Title, Art_Sum, Rept_Name 
FROM dbo.ARTICLE AR
	JOIN dbo.REPORTER RP ON RP.Rept_ID = AR.Rept_ID
WHERE Rept_Name LIKE 'TRAN%' AND AR.Art_Status = 1
ORDER BY Rept_Name ASC
GO 

-- 7.  Truy vấn liên quan tới điều kiện về thời gian
-- Danh sách bài đã submit từ ngày 26/07/2021 đến 20/08/2021 yêu cầu duyệt nhưng chưa được xử lý 
SELECT PB.Art_ID, Art_Title, PB.Request_Time FROM  dbo.PUBLICATION PB
	JOIN dbo.ARTICLE AR ON AR.Art_ID = PB.Art_ID
WHERE Edt_ID IS NULL 
	AND Request_Time >= '20210726'
	AND Request_Time <= '20210810'
GO 

-- 8. Truy vấn sử dụng Self join, Outer join
-- Danh sách tất cả các bài viết đã submit yêu cầu duyệt nhưng chưa được xử lý, bao gồm:
-- thông tin chỉnh sửa, biên tập viên chỉnh sửa
SELECT AR.Art_ID, Edt_Name, Edit_Time, Edit_Detail 
FROM dbo.ARTICLE AR  
	LEFT JOIN dbo.EDITION ED ON ED.Art_ID = AR.Art_ID
	LEFT JOIN dbo.EDITOR ET ON ET.Edt_ID = ED.Edt_ID
WHERE EXISTS (
	SELECT * FROM dbo.PUBLICATION PB 
	WHERE AR.Art_ID = PB.Art_ID AND PB.Edt_ID IS NULL)
GO 

-- 9. Truy vấn sử dụng With.
-- Hiển thị chủ đề đã đăng có nhiều comment nhất
WITH temp(Genre_Name, Cmt_Number) AS (
	SELECT Genre_Name, COUNT(*) FROM dbo.COMMENT 
		JOIN dbo.ARTICLE AR ON AR.Art_ID = COMMENT.Art_ID
		JOIN dbo.GENRE GR ON GR.Genre_ID = AR.Genre_ID
	WHERE AR.Art_Status = 1
	GROUP BY AR.Genre_ID, GR.Genre_Name)
SELECT * FROM temp
WHERE Cmt_Number = (SELECT MAX(Cmt_Number) FROM temp) 
GO 

-- 10. Truy vấn sử dụng function (hàm) đã viết trong bước trước
-- Danh sách Reporter và các Privilege chủ đề (genre), không bao gồm Reporter bị Suspended hoặc Void
-- Sử dụng hàm fc_CHK_Suspended(@Rept_ID) kiểm tra Reporter có bị Suspended hay ko
SELECT RP.Rept_ID, Rept_Name, Priv_Detail 
FROM dbo.REPORTER RP
	JOIN dbo.PRIVILEGE PR
	ON RP.Rept_ID = PR.Rept_ID 
	JOIN dbo.PRIVTYPE TP
	ON TP.Priv_ID = PR.Priv_ID 
WHERE (SELECT dbo.fc_CHK_Suspended(RP.Rept_ID)) = 0 
	AND PR.Priv_ID <> 3 
	AND  PR.Priv_ID <> 1 -- No need to show Active, only show Genre type
GO

















BEGIN TRAN
EXEC dbo.sp_Add_Priv @Rept_ID = 1,     -- int
                     @Priv_ID = 2,     -- int
                     @Edt_ID = 2,      -- int
                     @Add_Reason = N'test' -- nvarchar(100)

SELECT RP.Rept_ID, Rept_Name, PR.Priv_ID, Priv_Detail 
FROM dbo.REPORTER RP
	JOIN dbo.PRIVILEGE PR
	ON RP.Rept_ID = PR.Rept_ID 
	JOIN dbo.PRIVTYPE TP
	ON TP.Priv_ID = PR.Priv_ID 

SELECT * FROM dbo.GENRE
ROLLBACK TRAN


SELECT * FROM dbo.ARTICLE
SELECT * FROM dbo.DELETION
SELECT * FROM dbo.PUBLICATION

--DELETE FROM dbo.ARTICLE
--DBCC CHECKIDENT ('ARTICLE', RESEED, 0)

SELECT Art_ID, Art_Title, Genre_Name FROM dbo.ARTICLE JOIN dbo.GENRE
ON GENRE.Genre_ID = ARTICLE.Genre_ID