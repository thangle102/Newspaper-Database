-- INSERT DATA INTO TABLES IF TBL ARE EMPTY
-- Execute all fill DB BAODIENTU tables with demo data
USE BAODIENTU
GO
 
-- GUEST:  ///////////////////////////////////////////////////////////////////////
IF NOT EXISTS(SELECT * FROM dbo.GUEST)
BEGIN 
BEGIN TRAN 
INSERT dbo.GUEST
VALUES
(   N'THANHVIP12',      -- Guest_Name - nvarchar(20)
    '19910210' -- Guest_BD - date
)

INSERT dbo.GUEST
VALUES
(   N'HAPHAM',      -- Guest_Name - nvarchar(20)
    '19890422' -- Guest_BD - date
)

INSERT dbo.GUEST
VALUES
(   N'VINHRAU',      -- Guest_Name - nvarchar(20)
    '19790701' -- Guest_BD - date
)

INSERT dbo.GUEST
VALUES
(   N'HUYNHLAP',      -- Guest_Name - nvarchar(20)
    '19970830' -- Guest_BD - date
)

INSERT dbo.GUEST
VALUES
(   N'TRANGTRAN99',      -- Guest_Name - nvarchar(20)
    '19750314' -- Guest_BD - date
)

INSERT dbo.GUEST
VALUES
(   N'HOAPHAT2',      -- Guest_Name - nvarchar(20)
    '19660101' -- Guest_BD - date
)

INSERT dbo.GUEST
VALUES
(   N'MYTAM',      -- Guest_Name - nvarchar(20)
    '19821212' -- Guest_BD - date
)

INSERT dbo.GUEST
VALUES
(   N'HAIPHUONG',      -- Guest_Name - nvarchar(20)
    '19840417' -- Guest_BD - date
)

INSERT dbo.GUEST
VALUES
(   N'VINH_HAO',      -- Guest_Name - nvarchar(20)
    '19770102' -- Guest_BD - date
)

INSERT dbo.GUEST
VALUES
(   N'BECKHAM',      -- Guest_Name - nvarchar(20)
    '20021112' -- Guest_BD - date
)
COMMIT
END
GO

-- REPORTER:  ///////////////////////////////////////////////////////////////////////
IF NOT EXISTS(SELECT * FROM dbo.REPORTER)
BEGIN 
BEGIN TRAN 
INSERT dbo.REPORTER
VALUES
(   N'NGUYEN VAN NAM', -- Rept_Name - nvarchar(20)
    N'0909009009'  -- Rept_Phone - nvarchar(11)
)

INSERT dbo.REPORTER
VALUES
(   N'TRAN BINH', -- Rept_Name - nvarchar(20)
    N'0397987929'  -- Rept_Phone - nvarchar(11)
)

INSERT dbo.REPORTER
VALUES
(   N'LE LOC', -- Rept_Name - nvarchar(20)
    N'0928649028'  -- Rept_Phone - nvarchar(11)
)

INSERT dbo.REPORTER
VALUES
(   N'TRAN THI NGOC BICH', -- Rept_Name - nvarchar(20)
    N'0987298649'  -- Rept_Phone - nvarchar(11)
)

INSERT dbo.REPORTER
VALUES
(   N'PHAN VAN MINH', -- Rept_Name - nvarchar(20)
    N'0797297308'  -- Rept_Phone - nvarchar(11)
)

INSERT dbo.REPORTER
VALUES
(   N'TRINH VAN LAN', -- Rept_Name - nvarchar(20)
    N'0922797897'  -- Rept_Phone - nvarchar(11)
)

INSERT dbo.REPORTER
VALUES
(   N'VU NHU CAN', -- Rept_Name - nvarchar(20)
    N'0829098018'  -- Rept_Phone - nvarchar(11)
)

INSERT dbo.REPORTER
VALUES
(   N'HOANG THI CAM TU', -- Rept_Name - nvarchar(20)
    N'0678928222'  -- Rept_Phone - nvarchar(11)
)

INSERT dbo.REPORTER
VALUES
(   N'LE VAN LAN', -- Rept_Name - nvarchar(20)
    N'0387777222'  -- Rept_Phone - nvarchar(11)
)

INSERT dbo.REPORTER
VALUES
(   N'TRINH KIM CHI', -- Rept_Name - nvarchar(20)
    N'0552786392'  -- Rept_Phone - nvarchar(11)
)
COMMIT
END
GO


-- EDITOR: ///////////////////////////////////////////////////////////////////////
IF NOT EXISTS(SELECT * FROM dbo.EDITOR)
BEGIN 
BEGIN TRAN 
INSERT dbo.EDITOR
VALUES
(   N'PHAN ANH', -- Edt_Name - nvarchar(20)
    N'0222989989'  -- Edt_Phone - nvarchar(11)
)

INSERT dbo.EDITOR
VALUES
(   N'LAI VAN SAM', -- Edt_Name - nvarchar(20)
    N'0900787666'  -- Edt_Phone - nvarchar(11)
)

INSERT dbo.EDITOR
VALUES
(   N'NGUYEN VAN DUONG', -- Edt_Name - nvarchar(20)
    N'0989267555'  -- Edt_Phone - nvarchar(11)
)

INSERT dbo.EDITOR
VALUES
(   N'PHAM MINH HOANG', -- Edt_Name - nvarchar(20)
    N'0345666888'  -- Edt_Phone - nvarchar(11)
)

INSERT dbo.EDITOR
VALUES
(   N'DINH TIEN DUNG', -- Edt_Name - nvarchar(20)
    N'0365222454'  -- Edt_Phone - nvarchar(11)
)

INSERT dbo.EDITOR
VALUES
(   N'HUYNH THUC NHI', -- Edt_Name - nvarchar(20)
    N'0738222978'  -- Edt_Phone - nvarchar(11)
)

INSERT dbo.EDITOR
VALUES
(   N'NGUYEN DUC THO', -- Edt_Name - nvarchar(20)
    N'0289000177'  -- Edt_Phone - nvarchar(11)
)

INSERT dbo.EDITOR
VALUES
(   N'TRUONG GIA BAO', -- Edt_Name - nvarchar(20)
    N'0122989333'  -- Edt_Phone - nvarchar(11)
)

INSERT dbo.EDITOR
VALUES
(   N'LE THI NGOC HUYEN', -- Edt_Name - nvarchar(20)
    N'0909222167'  -- Edt_Phone - nvarchar(11)
)

INSERT dbo.EDITOR
VALUES
(   N'NGUYEN HOANG HUY', -- Edt_Name - nvarchar(20)
    N'0126555390'  -- Edt_Phone - nvarchar(11)
)
COMMIT
END
GO

-- GENRE:  ///////////////////////////////////////////////////////////////////////
IF NOT EXISTS(SELECT * FROM dbo.GENRE)
BEGIN 
BEGIN TRAN 
INSERT dbo.GENRE
VALUES (1, N'THE THAO') -- Genre_Name - nvarchar(20)

INSERT dbo.GENRE
VALUES (2, N'DU LICH') -- Genre_Name - nvarchar(20)

INSERT dbo.GENRE
VALUES (3, N'VAN HOA - GIAI TRI') -- Genre_Name - nvarchar(20)

INSERT dbo.GENRE
VALUES (4, N'KHOA HOC - CONG NGHE') -- Genre_Name - nvarchar(20)

INSERT dbo.GENRE
VALUES (5, N'CHINH TRI') -- Genre_Name - nvarchar(20)

INSERT dbo.GENRE
VALUES (6, N'GIAO DUC') -- Genre_Name - nvarchar(20)

INSERT dbo.GENRE
VALUES (7, N'KINH TE') -- Genre_Name - nvarchar(20)

INSERT dbo.GENRE
VALUES (8, N'PHAP LUAT') -- Genre_Name - nvarchar(20)
COMMIT
END
GO 

-- PRIVTYPE ///////////////////////////////////////////////////////////////////////
IF NOT EXISTS(SELECT * FROM dbo.PRIVTYPE)
BEGIN 
BEGIN TRAN 
INSERT dbo.PRIVTYPE
VALUES (1, N'Active: read & post') -- Priv_Detail - nvarchar(20) 

INSERT dbo.PRIVTYPE
VALUES (2, N'Suspended: read only') -- Priv_Detail - nvarchar(20)

INSERT dbo.PRIVTYPE
VALUES (3, N'Void: non-read/post') -- Priv_Detail - nvarchar(20)

INSERT dbo.PRIVTYPE
VALUES (4, N'Phap Luat') -- Priv_Detail - nvarchar(20)

INSERT dbo.PRIVTYPE
VALUES (5, N'The Thao/ Du Lich') -- Priv_Detail - nvarchar(20)

INSERT dbo.PRIVTYPE
VALUES (6, N'Giao duc') -- Priv_Detail - nvarchar(20)

INSERT dbo.PRIVTYPE
VALUES (7, N'Van Hoa, Khoa Hoc') -- Priv_Detail - nvarchar(20)

INSERT dbo.PRIVTYPE
VALUES (8, N'Kinh te, Chinh tri') -- Priv_Detail - nvarchar(20)
COMMIT
END
GO 

-- PRIVILEGE: ///////////////////////////////////////////////////////////////////////
-- PRIVCHANGES:///////////////////////////////////////////////////////////////////////
-- add Priv
IF (NOT EXISTS(SELECT * FROM dbo.PRIVILEGE) AND NOT EXISTS(SELECT * FROM dbo.PRIVCHANGES))
BEGIN 
BEGIN TRAN 
EXEC dbo.sp_add_Priv @Rept_ID = 1,     -- int
                     @Priv_ID = 1,     -- int
                     @Edt_ID = 2,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 1,     -- int
                     @Priv_ID = 4,     -- int
                     @Edt_ID = 5,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 1,     -- int
                     @Priv_ID = 6,     -- int
                     @Edt_ID = 8,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 2,     -- int
                     @Priv_ID = 1,     -- int
                     @Edt_ID = 1,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 2,     -- int
                     @Priv_ID = 5,     -- int
                     @Edt_ID = 9,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 2,     -- int
                     @Priv_ID = 7,     -- int
                     @Edt_ID = 7,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)
					 
EXEC dbo.sp_add_Priv @Rept_ID = 2,     -- int
                     @Priv_ID = 8,     -- int
                     @Edt_ID = 8,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 3,     -- int
                     @Priv_ID = 1,     -- int
                     @Edt_ID = 4,      -- int
                     @Add_Reason = N'Set active due qualified' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 3,     -- int
                     @Priv_ID = 5,     -- int
                     @Edt_ID = 4,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 3,     -- int
                     @Priv_ID = 2,     -- int
                     @Edt_ID = 4,      -- int
                     @Add_Reason = N'Suspend due not submit cert' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 4,     -- int
                     @Priv_ID = 1,     -- int
                     @Edt_ID = 6,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 4,     -- int
                     @Priv_ID = 4,     -- int
                     @Edt_ID = 6,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 4,     -- int
                     @Priv_ID = 6,     -- int
                     @Edt_ID = 7,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 4,     -- int
                     @Priv_ID = 7,     -- int
                     @Edt_ID = 10,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 4,     -- int
                     @Priv_ID = 8,     -- int
                     @Edt_ID = 1,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 5,     -- int
                     @Priv_ID = 3,     -- int
                     @Edt_ID = 1,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 7,     -- int
                     @Priv_ID = 1,     -- int
                     @Edt_ID = 5,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)
					 
EXEC dbo.sp_add_Priv @Rept_ID = 7,     -- int
                     @Priv_ID = 6,     -- int
                     @Edt_ID = 6,      -- int
                     @Add_Reason = N'add new priv' -- nvarchar(100)

EXEC dbo.sp_add_Priv @Rept_ID = 7,     -- int
					 @Priv_ID = 3,     -- int
					 @Edt_ID = 8,      -- int
					 @Add_Reason = N'Void due violate policy' -- nvarchar(100)

----------- delete Priv
EXEC dbo.sp_delete_Priv @Rept_ID = 4,     -- int
						@Priv_ID = 8,     -- int
						@Edt_ID = 9,      -- int
						@Delete_Reason = N'delete Genre priv' -- nvarchar(100)

EXEC dbo.sp_delete_Priv @Rept_ID = 2,     -- int
						@Priv_ID = 7,     -- int
						@Edt_ID = 7,      -- int
						@Delete_Reason = N'delete Genre priv' -- nvarchar(100)
						
EXEC dbo.sp_delete_Priv @Rept_ID = 2,     -- int
						@Priv_ID = 8,     -- int
						@Edt_ID = 8,      -- int
						@Delete_Reason = N'delete Genre priv' -- nvarchar(100)
COMMIT
END
GO 


-- ARTICLE: ///////////////////////////////////////////////////////////////////////
IF NOT EXISTS(SELECT * FROM dbo.ARTICLE)
BEGIN 
BEGIN TRAN 
INSERT dbo.ARTICLE
VALUES
(   N'Olympic Tokyo 2020: Thạch Kim Tuấn thất bại ở hạng cân 61kg',  -- Art_Title - nvarchar(100)
    N'Chiều 25/7, đô cử Thạch Kim Tuấn đã thi đấu không thành công ở hạng cân 61kg tại Thế vận hội Tokyo 2020.',  -- Art_Sum - nvarchar(300)
    N'Ở nội dung cử giật, Thạch Kim Tuấn được ban huấn luyện (BHL) đội tuyển cử tạ Việt Nam đăng ký mức tạ ban đầu 128kg. Tuy nhiên, sau đó ở lượt cử đầu tiên, anh đã chỉnh xuống mức 126kg. Phải cần đến 2 lượt thi, Thạch Kim Tuấn mới vượt qua mức tạ 126kg một cách khá vất vả.',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    2,    -- Rept_ID - int
    1     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'Ngắm nhìn vẻ đẹp mê hoặc của hồ Plitvice, Croatia',  -- Art_Title - nvarchar(100)
    N'Bạn đã bao giờ mê mẩn trước một cảnh sắc thiên nhiên nào chưa? Dù đã từng hay chưa từng thì bạn cũng sẽ phải thốt lên đầy kinh ngạc khi ngắm nhìn vẻ đẹp tuyệt mỹ đầy mê hoặc của công viên quốc gia hồ Plitvice ở Croatia.',  -- Art_Sum - nvarchar(300)
    N'Hồ Plitvice là địa danh du lịch nổi tiếng bậc nhất của đất nước Croatia và là một trong số những nơi được UNESCO công nhận di sản thế giới đầu tiên vào năm 1979. Hồ Plitvice nằm trong khu vườn quốc gia lâu đời nhất tại vùng Balkans và lớn nhất của mảnh đất mến khách Croatia với diện tích 300 km2.',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    2,    -- Rept_ID - int
    2     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'Ngắm nhìn vẻ đẹp mê hoặc của hồ Plitvice, Croatia',  -- Art_Title - nvarchar(100)
    N'Bạn đã bao giờ mê mẩn trước một cảnh sắc thiên nhiên nào chưa? Dù đã từng hay chưa từng thì bạn cũng sẽ phải thốt lên đầy kinh ngạc khi ngắm nhìn vẻ đẹp tuyệt mỹ đầy mê hoặc của công viên quốc gia hồ Plitvice ở Croatia.',  -- Art_Sum - nvarchar(300)
    N'Hồ Plitvice là địa danh du lịch nổi tiếng bậc nhất của đất nước Croatia và là một trong số những nơi được UNESCO công nhận di sản thế giới đầu tiên vào năm 1979. Hồ Plitvice nằm trong khu vườn quốc gia lâu đời nhất tại vùng Balkans và lớn nhất của mảnh đất mến khách Croatia với diện tích 300 km2.',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    2,    -- Rept_ID - int
    2     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'Lãnh đạo TPHCM lên tiếng về kỳ thi tuyển sinh vào lớp 10',  -- Art_Title - nvarchar(100)
    N'TPO - Ông Dương Anh Đức, Phó Chủ tịch UBND TPHCM cho rằng, hiện tình hình diễn biến dịch bệnh khá căng thẳng, việc tổ chức tuyển sinh với quy mô lớn có sẽ tạo ra nguy cơ tiềm tàng lây nhiễm dịch bệnh rất là cao.',  -- Art_Sum - nvarchar(300)
    N'Ngày 25/7, tại cuộc họp Ban chỉ đạo phòng chống dịch bệnh COVID-19 trên địa bàn TP, ông Dương Anh Đức, Phó chủ tịch UBND TPHCM đã có thông tin về kỳ tuyển sinh lớp 10 trên địa bàn.',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    1,    -- Rept_ID - int
    6     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'Hậu vụ ám sát Tổng thống Haiti: Tân Thủ tướng ''gặp khó'' khi thống nhất đất nước',  -- Art_Title - nvarchar(100)
    N'Theo các quan sát viên, có khả năng tân Thủ tướng Haiti Ariel Henry không đạt được đồng thuận chính trị trong nước giữa bối cảnh khủng hoảng về tính hợp pháp sau khi Tổng thống Jovenel Moise bị ám sát',  -- Art_Sum - nvarchar(300)
    N'Ông Serge Bellegarde, cựu phiên dịch của Tổ chức các quốc gia châu Mỹ (OAS), nêu rõ: “Tình hình càng thêm bất ổn vì chính phủ thiếu tính hợp pháp”, đồng thời cho hay OAS đã kêu gọi thành lập một chính phủ đoàn kết gồm nhiều lực lượng khác nhau.',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    4,    -- Rept_ID - int
    5     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'Nhận định thị trường phiên giao dịch chứng khoán ngày 26/7: Những cơ hội mới rồi sẽ xuất hiện',  -- Art_Title - nvarchar(100)
    N'Chỉ số vẫn chưa thể thoát khỏi xu hướng điều chỉnh giảm. Tuy nhiên, mặt bằng giá mới đang dần được thiết lập quanh ngưỡng 1.270 điểm với sự phân hóa của nhiều nhóm ngành và cổ phiếu.',  -- Art_Sum - nvarchar(300)
    N'Áp lực bán vẫn thống trị trong tuần vừa qua, đặc biệt là trong 2 phiên đầu và cuối. Xen kẽ giữa các phiên giảm mạnh là những phiên hồi phục, nhưng quan sát chúng ta dễ nhận ra đấy là các phiên hồi phục kỹ thuật, khi biên độ tăng không mạnh và thanh khoản lại sụt mạnh so với các phiên giảm.',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    3,    -- Rept_ID - int
    7     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'Phát hiện virus hơn 15.000 tuổi trong sông băng Tây Tạng tan chảy',  -- Art_Title - nvarchar(100)
    N'Sông băng lớn tan chảy nhanh chóng vì thay đổi khí hậu khiến các nhà khoa học tìm thấy các virus cổ đại tồn tại trong các lõi băng, theo Independent.',  -- Art_Sum - nvarchar(300)
    N'Khi nghiên cứu phân tích lớp băng, các chuyên gia đã tìm thấy mã di truyền của 33 loại virus. 4 trong số những virus này đã từng được phân tích, nhưng ít nhất 28 số còn lại là các chủng hoàn toàn mới.',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    4,    -- Rept_ID - int
    4     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'Những người mẫu cưới nghệ sĩ âm nhạc',  -- Art_Title - nvarchar(100)
    N'Hailey Bieber, Behati Prinsloo... nên duyên với những tên tuổi nổi tiếng trong giới âm nhạc thế giới.',  -- Art_Sum - nvarchar(300)
    N'Hailey Bieber và Justin Bieber gặp nhau lần đầu năm 2009. Năm 2016, cả hai hẹn hò, chia tay rồi tái hợp vào tháng 6/2018. Cặp sao tổ chức lễ cưới cổ tích vào cuối tháng 9/2019. Trong hôn lễ, Hailey diện váy cưới của hãng Off-White được thiết kế bởi Virgil Abloh. Trong khi đó, Justin trông bảnh bao với đồ suit đến từ thương hiệu Celine, do Hedi Slimane thiết kế',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    4,    -- Rept_ID - int
    3     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'Đấu tranh hiệu quả với tội phạm mua bán người',  -- Art_Title - nvarchar(100)
    N'Theo thông tin từ Bộ tư lệnh Bộ đội Biên phòng (BĐBP): 6 tháng đầu năm 2021, hoạt động của tội phạm ma túy và buôn bán người trên các tuyến biên giới diễn biến phức tạp, trọng điểm là tuyến biên giới Việt Nam-Trung Quốc và các tỉnh Tây Nam Bộ.',  -- Art_Sum - nvarchar(300)
    N'Các đơn vị BĐBP đã triển khai gần 50 kế hoạch nghiệp vụ, phát hiện, bắt giữ trên 20 vụ với gần 20 đối tượng phạm tội mua bán người; giải cứu, tiếp nhận trên 30 nạn nhân (tăng 5 vụ, 15 đối tượng, 16 nạn nhân so với cùng kỳ năm trước). Trong đợt cao điểm đấu tranh với tội phạm mua bán người trên toàn tuyến biên giới mới đây, các đơn vị BĐBP đã tổ chức tuyên truyền gần 13.000 buổi với hơn 373.000 lượt người tham gia; tuyên truyền trên các phương tiện thông tin đại chúng hơn 1.000 tin, bài viết, phóng sự về phòng, chống tội phạm; phát tờ rơi, tổ chức cho các hộ dân trên biên giới ký cam kết tham gia đấu tranh, tố giác tội phạm...',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    1,    -- Rept_ID - int
    8     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'Thêm 5 di sản thế giới được UNESCO ghi danh',  -- Art_Title - nvarchar(100)
    N'Ủy ban Di sản Thế giới vừa ghi danh thêm 5 di sản thế giới, bao gồm 1 di sản đa quốc gia tại châu Âu và 4 di sản lần lượt tại các quốc gia Saudi Arabia, Pháp, Đức, Italy.',  -- Art_Sum - nvarchar(300)
    N'Di sản đa quốc gia mới UNESCO được ghi danh là "The Great Spa Towns", gồm 11 thị trấn nằm tại 7 quốc gia châu Âu là Baden bei Wien (Áo); Spa (Bỉ); Františkovy Lázně (Séc); Karlovy Vary (Séc); Mariánské Lázně (Séc); Vichy (Pháp); Bad Ems (Đức); Baden-Baden (Đức); Bad Kissingen (Đức); Montecatini Terme (Italy) và City of Bath (Vương quốc Anh). ',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    2,    -- Rept_ID - int
    2     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'Nhà văn Sơn Tùng và đề tài Bác Hồ',  -- Art_Title - nvarchar(100)
    N'Nhà văn Sơn Tùng khẳng định, bản lĩnh không chỉ trong một mà nhiều cuốn tiểu thuyết đều viết về một người đã trở thành huyền thoại của cả thế giới: Chủ tịch Hồ Chí Minh.',  -- Art_Sum - nvarchar(300)
    N'Dành trọn cuộc đời viết về Bác Hồ, nhà văn Sơn Tùng có hàng loạt tác phẩm như: "Búp sen xanh", “Bông sen vàng”, “Trái tim quả đất”, “Hoa dâm bụt”, “Tấm chân dung Bác Hồ”, “Thầy giáo Nguyễn Tất Thành ở Trường Dục Thanh", "Cuộc chia ly trên bến Nhà Rồng"...',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    4,    -- Rept_ID - int
    3     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'Chuyên gia Đức dự đoán về số phận chính trị của Tổng thống Ukraine Zelensky',  -- Art_Title - nvarchar(100)
    N'Nhà khoa học chính trị Sergienko ông Zelensky có thể sẽ nghĩ về việc từ chức',  -- Art_Sum - nvarchar(300)
    N'Báo Hành động và Lời nói của Nga ngày 24/7 dẫn nhận định của nhà khoa học chính trị người Đức Vladimir Sergienko cho biết, Tổng thống Ukraine Volodymyr Zelensky có thể sẽ bắt đầu nghĩ về một sự từ chức đơn giản khi ông nhận ra số phận của Đức và Hoa Kỳ dành cho mình',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    3,    -- Rept_ID - int
    5     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'CÁyÁDADia',  -- Art_Title - nvarchar(100)
    N'NÁDDSDSDSDAkhoa ',  -- Art_Sum - nvarchar(300)
    N'Báo ASDDSADAD một sự từ chức đơn giình',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    6,    -- Rept_ID - int
    5     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'ChAÁDADSDADDSAD',  -- Art_Title - nvarchar(100)
    N'NÁDADSDADSDSa ',  -- Art_Sum - nvarchar(300)
    N'BáoẤDADSADDASDAD chức đơn giình',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    7,    -- Rept_ID - int
    7     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'ChuyÁDADADSADADSia',  -- Art_Title - nvarchar(100)
    N'NÁDADASDADSa ',  -- Art_Sum - nvarchar(300)
    N'BáoÁDADASDASDASDhức đơn giình',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    8,    -- Rept_ID - int
    5     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'ChÁDADADADSia',  -- Art_Title - nvarchar(100)
    N'NÁDDSADSDa ',  -- Art_Sum - nvarchar(300)
    N'BáÁDADDASDAD giình',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    9,    -- Rept_ID - int
    6     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'ChuẤDADASia',  -- Art_Title - nvarchar(100)
    N'NÁDDADSDASa ',  -- Art_Sum - nvarchar(300)
    N'BáÁDADADADSt sự từ chức đơn giình',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    10,    -- Rept_ID - int
    5     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'ChSADASDÁDADgia',  -- Art_Title - nvarchar(100)
    N'NÁDADSADoa ',  -- Art_Sum - nvarchar(300)
    N'Báo HàÁDDSSSiình',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    2,    -- Rept_ID - int
    8     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'Chuyên gia',  -- Art_Title - nvarchar(100)
    N'Nhà khoa ',  -- Art_Sum - nvarchar(300)
    N'Báo Hành ầu nghĩ về một sự từ chức đơn giình',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    3,    -- Rept_ID - int
    4     -- Genre_ID - int
)

INSERT dbo.ARTICLE
VALUES
(   N'ChDGSDGDGSDGSĐa',  -- Art_Title - nvarchar(100)
    N'NhAÁDADDASDkhoa ',  -- Art_Sum - nvarchar(300)
    N'Báo Hành ÁDADADSDơn giình',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    4,    -- Rept_ID - int
    2     -- Genre_ID - int
)

INSERT dbo.ARTICLE --21
VALUES
(   N'Manulife dẫn đầu bảng xếp hạng Bàn tròn Triệu đô tại Việt Nam',  -- Art_Title - nvarchar(100)
    N'Tính đến 1/7/2021, Manulife Việt Nam đứng vị trí số 1 trên thị trường với kỷ lục 1.669 đại lý trở thành thành viên Bàn tròn Triệu đô, đồng thời duy trì thứ hạng số 12 trong danh sách “Top 100 Công ty hàng đầu” trên toàn cầu. ',  -- Art_Sum - nvarchar(300)
    N'Manulife Việt Nam đã nhận được danh hiệu cao nhất trong Bảng xếp hạng Bàn tròn Triệu đô (MDRT) năm 2021 với thành tích là công ty dẫn đầu tại Việt Nam về số lượng thành viên MDRT. Kết quả này tái khẳng định cam kết của công ty đối với sự chuyên nghiệp hóa và nâng cao trải nghiệm khách hàng.',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    10,    -- Rept_ID - int
    7     -- Genre_ID - int
)

INSERT dbo.ARTICLE --22
VALUES
(   N'Truy tố ông Trần Vĩnh Tuyến - nguyên Phó Chủ tịch UBND TP.HCM',  -- Art_Title - nvarchar(100)
    N'Ông Trần Vĩnh Tuyến (nguyên Phó Chủ tịch UBND TP.HCM) bị truy tố về tội "vi phạm quy định về quản lý, sử dụng tài sản Nhà nước gây thất thoát, lãng phí" xảy ra tại UBND TP.HCM và Tổng công ty Nông nghiệp Sài Gòn (SAGRI).',  -- Art_Sum - nvarchar(300)
    N'Ngày 28/7, Viện KSND tối cao ban hành cáo trạng vụ án "vi phạm quy định về quản lý, sử dụng tài sản gây thất thoát lãng phí", "tham ô tài sản", "thiếu trách nhiệm gây hậu quả nghiêm trọng" và "che giấu tội phạm" xảy ra tại UBND TP.HCM và Tổng Công ty Nông nghiệp Sài Gòn (SAGRI).',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    10,    -- Rept_ID - int
    8     -- Genre_ID - int
)

INSERT dbo.ARTICLE --23
VALUES
(   N'Chưa có đại diện thi Miss Supranational, Việt Nam liệu có đánh mất chuỗi intop từ 2016 - 2019?',  -- Art_Title - nvarchar(100)
    N'Dù đại diện các nước khác đã lên đường đến Ba Lan nhưng Việt Nam vẫn chưa đưa ra được thí sinh tham dự Miss Supranational 2021.',  -- Art_Sum - nvarchar(300)
    N'Hiện tại, cuộc thi Miss Supranational đã bắt đầu rục rịch, hàng loạt đại diện các nước đang bắt đầu bay đến Ba Lan để tham gia những hoạt động đầu tiên.',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    2,    -- Rept_ID - int
    3     -- Genre_ID - int
)

INSERT dbo.ARTICLE --24
VALUES
(   N'MobiFone kết nối đưa công nghệ tới từng hộ kinh doanh',  -- Art_Title - nvarchar(100)
    N'Công nghệ thông tin đã tiếp cận sâu hơn vào đời sống cá nhân của mỗi người, trở thành công cụ đắc lực cho doanh nghiệp.',  -- Art_Sum - nvarchar(300)
    N'Thế hệ 8x và nửa đầu 9x có lẽ đều quen thuộc với hình ảnh các cửa hàng tạp hóa “có đủ mọi thứ trên đời” mà ngày bé, bố mẹ hay nhờ “ra đầu ngõ” mua món này, món kia. Hình ảnh quen thuộc của các cô bán hàng luôn là quyển sổ được ghi chép dài dằng dặc và dày lên vì chi chít chữ, ',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    4,    -- Rept_ID - int
    4     -- Genre_ID - int
)

INSERT dbo.ARTICLE --25
VALUES
(   N'Thùy Linh từ nỗi ám ảnh số 1 đến ghi dấu ấn ở Olympic',  -- Art_Title - nvarchar(100)
    N'Ngay từ khi chưa phải là tay vợt nữ số 1 Việt Nam, Nguyễn Thùy Linh đã đặt mục tiêu tham dự Olympic. Giờ đây, cô có kỳ Thế vận hội đáng nhớ.',  -- Art_Sum - nvarchar(300)
    N'Đứng ở vị trí thứ 49 trên bảng xếp hạng các tay vợt nữ thế giới, Thùy Linh không được đánh giá cao ở Olympic Tokyo. Cô rơi vào bảng đấu mạnh, với sự góp mặt của tay vợt số một thế giới Tai Tzu-ying (Đài Loan, Trung Quốc). Hai đối thủ còn lại là Qi Xuefei (Pháp, hạng 41) và Sabrina Jaquet (hạng 46, Thụy Sĩ).',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    1,    -- Rept_ID - int
    1     -- Genre_ID - int
)

INSERT dbo.ARTICLE --26
VALUES
(   N'Nuôi dưỡng dòng chảy bất tận văn hóa Nga',  -- Art_Title - nvarchar(100)
    N'Vừa qua, trong cuộc Giao lưu thường niên trực tuyến với người dân',  -- Art_Sum - nvarchar(300)
    N'Từ vài tháng qua, theo chỉ đạo của Tổng thống, Chính phủ Nga đang nghiên cứu triển khai dự án phát hành một triệu tấm “Thẻ Pushkin”, nhằm tạo cơ hội và cung cấp tài chính để thanh thiếu niên Nga,',  -- Art_Main - nvarchar(max)
    NULL, -- Art_Status - bit
    6,    -- Rept_ID - int
    2     -- Genre_ID - int
)
COMMIT
END
GO 


-- PHOTO: ///////////////////////////////////////////////////////////////////////
IF NOT EXISTS(SELECT * FROM dbo.PHOTO)
BEGIN 
BEGIN TRAN 
INSERT dbo.PHOTO (Art_ID, Photo_Bitmap)
VALUES
(   1,   -- Art_ID - int
    0x89504E470D0A1A0A00000 -- Photo_Bitmap - varbinary(max)
)

INSERT dbo.PHOTO (Art_ID, Photo_Bitmap)
VALUES
(   1,   -- Art_ID - int
    0x89504E470D0A1A0A00000 -- Photo_Bitmap - varbinary(max)
)

INSERT dbo.PHOTO (Art_ID, Photo_Bitmap)
VALUES
(   2,   -- Art_ID - int
    0x89504E470D0A1A0A00000 -- Photo_Bitmap - varbinary(max)
)

INSERT dbo.PHOTO (Art_ID, Photo_Bitmap)
VALUES
(   4,   -- Art_ID - int
    0x89504E470D0A1A0A00000 -- Photo_Bitmap - varbinary(max)
)

INSERT dbo.PHOTO (Art_ID, Photo_Bitmap)
VALUES
(   4,   -- Art_ID - int
    0x89504E470D0A1A0A00000 -- Photo_Bitmap - varbinary(max)
)

INSERT dbo.PHOTO (Art_ID, Photo_Bitmap)
VALUES
(   4,   -- Art_ID - int
    0x89504E470D0A1A0A00000 -- Photo_Bitmap - varbinary(max)
)

INSERT dbo.PHOTO (Art_ID, Photo_Bitmap)
VALUES
(   5,   -- Art_ID - int
    0x89504E470D0A1A0A00000 -- Photo_Bitmap - varbinary(max)
)

INSERT dbo.PHOTO (Art_ID, Photo_Bitmap)
VALUES
(   6,   -- Art_ID - int
    0x89504E470D0A1A0A00000 -- Photo_Bitmap - varbinary(max)
)

INSERT dbo.PHOTO (Art_ID, Photo_Bitmap)
VALUES
(   6,   -- Art_ID - int
    0x89504E470D0A1A0A00000 -- Photo_Bitmap - varbinary(max)
)

INSERT dbo.PHOTO (Art_ID, Photo_Bitmap)
VALUES
(   8,   -- Art_ID - int
    0x89504E470D0A1A0A00000 -- Photo_Bitmap - varbinary(max)
)

INSERT dbo.PHOTO (Art_ID, Photo_Bitmap)
VALUES
(   9,   -- Art_ID - int
    0x89504E470D0A1A0A00000 -- Photo_Bitmap - varbinary(max)
)

INSERT dbo.PHOTO (Art_ID, Photo_Bitmap)
VALUES
(   9,   -- Art_ID - int
    0x89504E470D0A1A0A00000 -- Photo_Bitmap - varbinary(max)
)

INSERT dbo.PHOTO (Art_ID, Photo_Bitmap)
VALUES
(   11,   -- Art_ID - int
    0x89504E470D0A1A0A00000 -- Photo_Bitmap - varbinary(max)
)
COMMIT
END
GO 


-- COMMENT:///////////////////////////////////////////////////////////////////////
IF NOT EXISTS(SELECT * FROM dbo.COMMENT)
BEGIN 
BEGIN TRAN 
INSERT dbo.COMMENT
VALUES
(   GETUTCDATE(), -- Cmt_Time - datetime
    1,         -- Guest_ID - int
    1,         -- Art_ID - int
    N'Hay qua!'        -- Cmt_Text - nvarchar(100)
)

INSERT dbo.COMMENT
VALUES
(   GETUTCDATE(), -- Cmt_Time - datetime
    1,         -- Guest_ID - int
    6,         -- Art_ID - int
    N'Sợ thật :('        -- Cmt_Text - nvarchar(100)
)

INSERT dbo.COMMENT
VALUES
(   GETUTCDATE(), -- Cmt_Time - datetime
    3,         -- Guest_ID - int
    6,         -- Art_ID - int
    N':))))))'        -- Cmt_Text - nvarchar(100)
)

INSERT dbo.COMMENT
VALUES
(   GETUTCDATE(), -- Cmt_Time - datetime
    4,         -- Guest_ID - int
    1,         -- Art_ID - int
    N'Tiec cho anh ay'        -- Cmt_Text - nvarchar(100)
)

INSERT dbo.COMMENT
VALUES
(   GETUTCDATE(), -- Cmt_Time - datetime
    9,         -- Guest_ID - int
    4,         -- Art_ID - int
    N'That ko troi'        -- Cmt_Text - nvarchar(100)
)

INSERT dbo.COMMENT
VALUES
(   GETUTCDATE(), -- Cmt_Time - datetime
    10,         -- Guest_ID - int
    5,         -- Art_ID - int
    N'Co chính xác không??'        -- Cmt_Text - nvarchar(100)
)

INSERT dbo.COMMENT
VALUES
(   GETUTCDATE(), -- Cmt_Time - datetime
    5,         -- Guest_ID - int
    10,         -- Art_ID - int
    N'Thuyết âm mưu !!!'        -- Cmt_Text - nvarchar(100)
)

INSERT dbo.COMMENT
VALUES
(   GETUTCDATE(), -- Cmt_Time - datetime
    2,         -- Guest_ID - int
    6,         -- Art_ID - int
    N'Sap tan the roi'        -- Cmt_Text - nvarchar(100)
)

INSERT dbo.COMMENT
VALUES
(   GETUTCDATE(), -- Cmt_Time - datetime
    4,         -- Guest_ID - int
    6,         -- Art_ID - int
    N'Tin vit'        -- Cmt_Text - nvarchar(100)
)

INSERT dbo.COMMENT
VALUES
(   GETUTCDATE(), -- Cmt_Time - datetime
    3,         -- Guest_ID - int
    1,         -- Art_ID - int
    N'kkkkk'        -- Cmt_Text - nvarchar(100)
)

INSERT dbo.COMMENT
VALUES
(   GETUTCDATE(), -- Cmt_Time - datetime
    1,         -- Guest_ID - int
    5,         -- Art_ID - int
    N'Haizz'        -- Cmt_Text - nvarchar(100)
)
COMMIT
END
GO 


-- PUBLICATION: ///////////////////////////////////////////////////////////////////////
-- DELETION: ///////////////////////////////////////////////////////////////////////
IF (NOT EXISTS(SELECT * FROM dbo.PUBLICATION) AND NOT EXISTS(SELECT * FROM dbo.DELETION))
BEGIN 
BEGIN TRAN 
-- submit Article to request publication
DECLARE @COUNT INT = 1
WHILE (@COUNT <= 26)
BEGIN
	EXEC dbo.sp_submit_Publication @Art_ID = @COUNT -- INT
	SET @COUNT += 1
END

-- Update public time or deny reason, editor
EXEC dbo.sp_grant_Publication @Art_ID = 1,                          -- int
                              @Public_Time = '2021-07-27 14:00:00', -- datetime
                              @Deny_Reason = NULL,                   -- nvarchar(100)
                              @Edt_ID = 5                           -- int

EXEC dbo.sp_grant_Publication @Art_ID = 2,                          -- int
                              @Public_Time = NULL,					-- datetime
                              @Deny_Reason = N'Bi trung chu de',    -- nvarchar(100)
                              @Edt_ID = 2                           -- int

EXEC dbo.sp_grant_Publication @Art_ID = 3,                          -- int
                              @Public_Time = '2021-07-28 12:00:00', -- datetime
                              @Deny_Reason = NULL,                   -- nvarchar(100)
                              @Edt_ID = 8                           -- int
							  
EXEC dbo.sp_grant_Publication @Art_ID = 5,                          -- int
                              @Public_Time = '2021-07-29 09:00:00', -- datetime
                              @Deny_Reason = NULL,                   -- nvarchar(100)
                              @Edt_ID = 6                           -- int
							  
EXEC dbo.sp_grant_Publication @Art_ID = 6,                          -- int
                              @Public_Time = '2021-07-30 17:00:00', -- datetime
                              @Deny_Reason = NULL,                  -- nvarchar(100)
                              @Edt_ID = 9                           -- int
							  
EXEC dbo.sp_grant_Publication @Art_ID = 9,                          -- int
                              @Public_Time = NULL,					-- datetime
                              @Deny_Reason = N'Kiem duyet noi dung',-- nvarchar(100)
                              @Edt_ID = 3                           -- int
							  
EXEC dbo.sp_grant_Publication @Art_ID = 10,                          -- int
                              @Public_Time = '2021-08-10 19:00:00', -- datetime
                              @Deny_Reason = NULL,                   -- nvarchar(100)
                              @Edt_ID = 1                           -- int

EXEC dbo.sp_grant_Publication @Art_ID = 11,                          -- int
                              @Public_Time = '2021-07-26 15:22:00', -- datetime
                              @Deny_Reason = NULL,                   -- nvarchar(100)
                              @Edt_ID = 1                           -- int
set @COUNT = 12
WHILE (@COUNT <= 20)
BEGIN
	EXEC dbo.sp_grant_Publication @Art_ID = @COUNT,                          -- int
                              @Public_Time = NULL, -- datetime
                              @Deny_Reason = 'Noi dung bi loi',                   -- nvarchar(100)
                              @Edt_ID = 4   
	SET @COUNT += 1
END

EXEC dbo.sp_grant_Publication @Art_ID = 21,                          -- int
                              @Public_Time = '2021-07-30 05:22:00', -- datetime
                              @Deny_Reason = NULL,                   -- nvarchar(100)
                              @Edt_ID = 1                           -- int

EXEC dbo.sp_grant_Publication @Art_ID = 22,                          -- int
                              @Public_Time = '2021-07-31 11:22:00', -- datetime
                              @Deny_Reason = NULL,                   -- nvarchar(100)
                              @Edt_ID = 1  				  

EXEC dbo.sp_grant_Publication @Art_ID = 23,                          -- int
                              @Public_Time = '2021-08-01 10:22:00', -- datetime
                              @Deny_Reason = NULL,                   -- nvarchar(100)
                              @Edt_ID = 1  
							  
EXEC dbo.sp_grant_Publication @Art_ID = 24,                          -- int
                              @Public_Time = '2021-08-01 11:22:00', -- datetime
                              @Deny_Reason = NULL,                   -- nvarchar(100)
                              @Edt_ID = 1  
				
EXEC dbo.sp_grant_Publication @Art_ID = 25,                          -- int
                              @Public_Time = '2021-08-17 19:22:00', -- datetime
                              @Deny_Reason = NULL,                   -- nvarchar(100)
                              @Edt_ID = 1  


-- update Art_Status: Article tbl (of newly published Articles after Public_Time)
EXEC dbo.sp_set_Article_Status_true @Begin_Time = '2021-07-25 15:22:00', --datetime
										@End_Time = '2022-07-27 15:22:00' --datetime
COMMIT
END
GO


-- EDITION ///////////////////////////////////////////////////////////////////////
IF NOT EXISTS(SELECT * FROM dbo.EDITION) 
BEGIN 
BEGIN TRAN 
INSERT dbo.EDITION
VALUES
(   GETUTCDATE(), -- Edit_Time - datetime
    1,         -- Art_ID - int
    N'Sua lai Genre',       -- Edit_Detail - nvarchar(100)
    1          -- Edt_ID - int
)

INSERT dbo.EDITION
VALUES
(   GETUTCDATE(), -- Edit_Time - datetime
    3,         -- Art_ID - int
    N'Sua lai tieu de',       -- Edit_Detail - nvarchar(100)
    4          -- Edt_ID - int
)

INSERT dbo.EDITION
VALUES
(   GETUTCDATE(), -- Edit_Time - datetime
    6,         -- Art_ID - int
    N'Sua lai duong link hinh anh bi mat',       -- Edit_Detail - nvarchar(100)
    4          -- Edt_ID - int
)

INSERT dbo.EDITION
VALUES
(   GETUTCDATE(), -- Edit_Time - datetime
    8,         -- Art_ID - int
    N'Sua loi chinh ta',       -- Edit_Detail - nvarchar(100)
    4          -- Edt_ID - int
)

INSERT dbo.EDITION
VALUES
(   GETUTCDATE(), -- Edit_Time - datetime
    21,         -- Art_ID - int
    N'Sua lai chuyen muc',       -- Edit_Detail - nvarchar(100)
    2          -- Edt_ID - int
)

INSERT dbo.EDITION
VALUES
(   GETUTCDATE(), -- Edit_Time - datetime
    22,         -- Art_ID - int
    N'Sua lai tieu de',       -- Edit_Detail - nvarchar(100)
    6          -- Edt_ID - int
)

INSERT dbo.EDITION
VALUES
(   GETUTCDATE(), -- Edit_Time - datetime
    23,         -- Art_ID - int
    N'Xoa anh bia',       -- Edit_Detail - nvarchar(100)
    7          -- Edt_ID - int
)

INSERT dbo.EDITION
VALUES
(   GETUTCDATE(), -- Edit_Time - datetime
    24,         -- Art_ID - int
    N'Viet tat ten nhan vat',       -- Edit_Detail - nvarchar(100)
    5          -- Edt_ID - int
)

INSERT dbo.EDITION
VALUES
(   GETUTCDATE(), -- Edit_Time - datetime
    25,         -- Art_ID - int
    N'Lam mo hinh anh nhan vat',       -- Edit_Detail - nvarchar(100)
    3          -- Edt_ID - int
)

INSERT dbo.EDITION
VALUES
(   GETUTCDATE(), -- Edit_Time - datetime
    26,         -- Art_ID - int
    N'An so dien thoai',       -- Edit_Detail - nvarchar(100)
    8          -- Edt_ID - int
)
COMMIT
END
GO

