SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `SunflowerDatabase` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `SunflowerDatabase`;

CREATE TABLE `Account` (
  `Id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Username` VARCHAR(20) NOT NULL,
  `Password` VARCHAR (128),
  `Role` VARCHAR(10),
  `Fullname` VARCHAR(128) COLLATE utf8_unicode_ci NOT NULL,
  `Email` VARCHAR(128) NOT NULL,
  `AvatarURL` VARCHAR(512) DEFAULT NULL,
  `DateOfBirth` DATE DEFAULT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

INSERT INTO `Account` (`Username`, `Password`, `Role`, `Fullname`, `Email`, `AvatarURL`, `DateOfBirth`)
VALUES
('trang', '25f9e794323b453885f5181f1b624d0b', 'Student', 'Hoàng Thị Thùy Trang', 'trang@gmail.com', '/App/View/Source/Image/Student/avatar-default.png', '2001-02-19'),
('thang', '25f9e794323b453885f5181f1b624d0b', 'Student', 'Lưu Quang Thắng', 'thang@gmail.com', '/App/View/Source/Image/Student/avatar-default.png', '2000-10-24'),
('khanhlinh', '25f9e794323b453885f5181f1b624d0b', 'Student', 'Phạm Khánh Linh', 'linh@gmail.com', '/App/View/Source/Image/Student/khanh-linh.jpg', '1999-02-20'),
('thihong', '25f9e794323b453885f5181f1b624d0b', 'Student', 'Nguyễn Thị Hồng', 'hong@gmail.com', '/App/View/Source/Image/Student/thi-hong.png', '2001-06-21'),
('congmanh', '25f9e794323b453885f5181f1b624d0b', 'Student', 'Đinh Công Mạnh', 'manh@gmail.com', '/App/View/Source/Image/Student/cong-manh.png', '2000-12-22'),
('quangtruong', '25f9e794323b453885f5181f1b624d0b', 'Student', 'Bùi Quang Trường', 'truong@gmail.com', '/App/View/Source/Image/Student/quang-truong.png', '2001-05-10'),
('ngocphuong', '25f9e794323b453885f5181f1b624d0b', 'Student', 'Đinh Thị Ngọc Phương', 'phuong@gmail.com', '/App/View/Source/Image/Student/ngoc-phuong.jpg', '2001-08-13'),
('ngocmai', '25f9e794323b453885f5181f1b624d0b', 'Student', 'Nguyễn Thị Ngọc Mai', 'mai@gmail.com', '/App/View/Source/Image/Student/ngoc-mai.jpg', '2001-10-30'),
('ngocthach', '25f9e794323b453885f5181f1b624d0b', 'Student', 'Phạm Ngọc Thạch', 'thach@gmail.com', '/App/View/Source/Image/Student/ngoc-thach.jpg', '2001-3-30'),
('vannha', '25f9e794323b453885f5181f1b624d0b', 'Student', 'Nguyễn Văn Nhã', 'nha@gmail.com', '/App/View/Source/Image/Student/van-nha.jpg', '2001-8-25'),
('huyentrang', '25f9e794323b453885f5181f1b624d0b', 'Student', 'Nguyễn Thị Huyền Trang', 'huyentrang@gmail.com', '/App/View/Source/Image/Student/huyen-trang.jpg', '2001-11-07'),
('admin', '25f9e794323b453885f5181f1b624d0b', 'Admin', 'Sunflower', 'sunflower@gmail.com', '/App/View/Source/Image/Student/avatar-default.png', '2000-10-24'),
('thoa', '25f9e794323b453885f5181f1b624d0b', 'Teacher', 'Vương Kim Thoa', 'thoa@gmail.com', '/App/View/Source/Image/Teacher/VuongKimThoa.jpg', '1990-03-10'),
('tuan', '25f9e794323b453885f5181f1b624d0b', 'Teacher', 'Trần Anh Tuấn', 'tuan@gmail.com', '/App/View/Source/Image/Teacher/AnhTuan.jpg', '1988-03-3'),
('chi', '25f9e794323b453885f5181f1b624d0b', 'Teacher', 'Nguyễn Thị Kim Chi', 'chi@gmail.com', '/App/View/Source/Image/Teacher/kim-chi.jpg', '1990-09-25'),
('thao', '25f9e794323b453885f5181f1b624d0b', 'Teacher', 'Lê Thị Phương Thảo', 'thao@gmail.com', '/App/View/Source/Image/Teacher/phuong-thao.jpg', '1992-01-28'),
('duy', '25f9e794323b453885f5181f1b624d0b', 'Teacher', 'Trần Anh Duy', 'duy@gmail.com', '/App/View/Source/Image/Teacher/anh-duy.jpg', '1989-05-16');


CREATE TABLE `AccountTeacher`(
  `Username` VARCHAR(20) NOT NULL,
  `Language` VARCHAR (20) NOT NULL,
  `PhoneNumber` VARCHAR(20) NOT NULL,
  `Degree` VARCHAR(512) NOT NULL,
  `Rating` FLOAT DEFAULT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;
INSERT INTO `AccountTeacher` (`Username`, `Language`, `PhoneNumber`, `Degree`, `Rating`)
VALUES
('thoa', 'Tiếng Anh', '0387504444', 'Đạt IELTS 8.5 với phần thi Speaking đạt 9.0 – điểm số tuyệt đối+ 5 năm kinh nghiệm dạy tiếng Anh giao tiếp và luyện IELTS tại Thái Lan, 3 năm kinh nghiệm luyện IELTS nâng cao tại Việt Nam', 4.8),
('tuan', 'Tiếng Trung', '0924896968', 'Đã có kinh nghiệm dạy học tiếng Trung 2 năm ở Canada, hơn 4 năm kinh nghiệm giảng dạy và đào tạo tại các trung tâm ngoại ngữ trong và ngoài nước khác khác', 4.5),
('chi', 'Tiếng Hàn', '0925188188', 'Cô đã có 8 năm kinh nghiệm giảng dạy cho các đối tượng có nhu cầu học tiếng Hàn để du học và làm việc tại đất nước Hàn Quốc. Cô luôn truyền nhiệt huyết, đam mê về ngôn ngữ đến với các học sinh của mình', 4.5),
('thao', 'Tiếng Nhật', '0994679679', 'Mong muốn của cô khi tham gia giảng dạy các khóa giao tiếp tiếng Nhật là giúp các bạn học viên tự tin, xóa bỏ sự ngượng ngùng khi giao tiếp, đồng thời cung cấp cho các bạn các kỹ năng nói cần thiết để nâng cao trình độ của mình', 4.5),
('duy', 'Tiếng Anh', '0997161999', 'Thầy Duy là một giáo viên nhiệt tình, phương pháp giảng dạy sáng tạo, luôn biết cách tạo cảm hứng cho học viên. Với trên 7 năm kinh nghiệm giảng dạy tiếng Anh, thầy Duy đã giúp rất nhiều học viên từ mất gốc đạt điểm số IELTS 6.0 – 6.5 trong thời gian ngắn', 4.5);


CREATE TABLE `Course`(
  `Id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `CourseName` VARCHAR(256) NOT NULL UNIQUE,
  `CourseImageAddress` VARCHAR(512) DEFAULT NULL,
  `CourseDescription` VARCHAR(512) NOT NULL,
  `StartDateCourse` DATE NOT NULL,
  `EndDateCourse` DATE NOT NULL,
  `CourseTime` VARCHAR(100) NOT NULL,
  `CourseLanguage` VARCHAR(100) NOT NULL,
  `CoursePrice` INT NOT NULL,
  `CourseSlot` INT NOT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

INSERT INTO `Course` (`CourseName`, `CourseImageAddress`, `CourseDescription`, `StartDateCourse`, `EndDateCourse`, `CourseTime`, `CourseLanguage`, `CoursePrice`, `CourseSlot`)
VALUES
('Khóa học tiếng Anh cơ bản chỉ từ 840k/tháng', '/App/View/Source/Image/Course/course-speaking-english.jpg', 'Khóa học này mang đến cho bạn những trải nghiệm thực tế, gắn lý thuyết vào thực hành để giúp bạn cải thiện giao tiếp xã hội, cũng như hiểu và tận dụng được nguồn thông tin đa dạng trên internet.', '2021-6-1', '2021-8-3', 'Tối T3, T5, T7', 'Tiếng Anh', '840000', '35'),
('Khóa học tiếng Trung cho người mới bắt đầu', '/App/View/Source/Image/Course/course-chinese-beginner.jpg', 'Khóa học giúp học viên có những kiến thức cơ bản ban đầu về tiếng Trung, trang bị những ngữ pháp cơ bản và đặc biệt là lượng từ vựng vô cùng thực tế.', '2021-5-14', '2021-7-9', 'Sáng T2, T4, T6', 'Tiếng Trung', '650000', '35'),
('Khóa học tiếng Trung học thử miễn phí', '/App/View/Source/Image/Course/course-chinese-free-trial.png', 'Khóa học ra đời với mục đích giúp các bạn tiết kiệm được thời gian, công sức, tiền bạc, nhưng vẫn đảm bảo các bạn nắm vững và sử dụng tiếng Trung một cách thành thạo.', '2021-5-28', '2021-7-30', 'Chiều T2, T4, T6', 'Tiếng Trung', '800000', '25'),
('Khóa học giao tiếp tiếng Anh cho người mới bắt đầu', '/App/View/Source/Image/Course/course-beginner-speaking-english.jpg', 'Đến với lớp học này bạn sẽ được luyện tập kỹ năng giao tiếp tiếng Anh trực tiếp với giáo viên bản xứ.', '2021-5-28', '2021-7-21', 'Tối T2, T4, T6', 'Tiếng Anh', '950000', '35'),
('Tiếng Hàn phá tan mọi rào cản cho người mới bắt đầu', '/App/View/Source/Image/Course/course-korean-beginner-breaking.jpg', 'Khoá học này giúp bạn nắm chắc phần ngữ pháp thông dụng trong tiếng Hàn. Tích lũy được một lượng lớn một lượng lớn từ vựng thông dụng và cần thiết để sử dụng trong học tập, công việc và đời sống hàng ngày.', '2021-6-5', '2021-9-4', 'Sáng T3, T5, T7', 'Tiếng Hàn', '890000', '25'),
('Khóa học thành thạo tiếng Hàn cơ bản chỉ với 499k', '/App/View/Source/Image/Course/course-korean-fluent-499k.png', 'Khóa học này giúp bạn phát triển kỹ năng nghe - nói - phản xạ tốt bằng tiếng Hàn trong giao tiếp hàng ngày và tự tin giao tiếp bằng tiếng Hàn với người bản xứ. Đồng thời nâng cao cơ hội giành học bổng cao khi du học Hàn Quốc.', '2021-10-26', '2021-12-30', 'Chiều T3, T5, T7', 'Tiếng Hàn', '499000', '35'),
('Khóa học tiếng Hàn nâng cao chỉ với 899k', '/App/View/Source/Image/Course/course-korean-master.jpg', 'Khoá học này giúp bạn hoàn toàn tự tin đọc và hiểu được nội dung của tờ tạp chí tiếng Hàn. Hòa nhập nhanh chóng với cuộc sống tại Hàn Quốc, tự tin tham gia các hoạt động cùng người Hàn trong các trường Đại học.', '2021-6-29', '2021-8-28', 'Tối T3, T5, T7', 'Tiếng Hàn', '899000', '20'),
('Khóa học tiếng Trung cơ bản cho mọi người', '/App/View/Source/Image/Course/course-chinese-basic.jpg', 'Khoá học này giúp học viên phát triển cả 4 kỹ năng nghe - nói - đọc - viết. Kết hợp với những bài giảng học viên sẽ được biết thêm nhiều thông tin bổ ích về văn hóa, con người, ẩm thực đất nước Trung Hoa.', '2021-6-4', '2021-8-2', 'Sáng T2, T4, T6', 'Tiếng Trung', '599000', '35'),
('Khóa học tiếng Anh cam kết đầu ra IELTS 5.5 thần tốc', '/App/View/Source/Image/Course/course-english-ielts-5.5.jpg', 'Cam kết chỉ sau 01 khóa học, học viên đạt IELTS 5.5 theo kết quả thi tại các cơ sở chính thức của Hội đồng Anh (BC và IDP). Đào tạo miễn phí 01 năm nếu học viên không đạt kết quả thi như trong cam kết.', '2021-6-1', '2021-8-28', 'Tối T3, T5, T7', 'Tiếng Anh', '699000', '30'),
('Khóa học tiếng Anh lấy chứng chỉ TOIEC từ 450 - 700+', '/App/View/Source/Image/Course/course-english-toeic-400-700.jpg', 'Khóa học giúp học viên nắm chắc các chủ đề ngữ pháp, vốn từ vựng cần thiết trong kỳ thi TOEIC. Nắm vững format và nắm được phương pháp nâng điểm cực nhanh trong thời gian ôn thi TOEIC ngắn.', '2021-6-7', '2021-8-27', 'Chiều T2, T4, T6', 'Tiếng Anh', '599000', '30'),
('Khóa học luyện thi tiếng Nhật lấy chứng chỉ N4', '/App/View/Source/Image/Course/course-japanese-n4.png', 'Mang lại cơ hội cho học viên chủ động giao tiếp với giảng viên và các bạn khác trong lớp kết hợp với sử dụng slide, flash card, tranh ảnh, các video trực quan nhằm giúp học viên tiếp thu bài nhanh chóng ngay tại lớp.', '2021-6-7', '2021-8-27', 'Sáng T2, T4, T6', 'Tiếng Nhật', '999000', '35'),
('Khóa học tiếng Nhật để lấy chứng chỉ N3 cấp tốc', '/App/View/Source/Image/Course/course-japanese-n3.jpg', 'Khóa học giúp cho bạn thành thạo 4 kỹ năng: Nghe - nói - đọc - viết. Bên cạnh đó, học viên có thể giao tiếp bằng tiếng Nhật các chủ đề thông dụng trong cuộc sống hoặc tham gia phỏng vấn du học với các trường Nhật Bản.', '2021-6-1', '2021-8-3', 'Chiều T3, T5, T7', 'Tiếng Nhật', '799000', '35'),
('Khai giảng khóa học "Tiếng Nhật là chuyện nhỏ"', '/App/View/Source/Image/Course/course-japanese-is-easy.jpg', 'Khóa học đem lại cho bạn kiến thức tổng quan mức độ sơ cấp để có thể tham dự kỳ thi JLPT đạt kết quả cao chỉ trong thời gian ngắn và tự tin nghe nói thông thạo như người bản xứ ở trình độ sơ cấp trong các tình huống giao tiếp hằng ngày.', '2021-6-4', '2021-8-2', 'Tối T2, T4, T6', 'Tiếng Nhật', '500000', '30');

CREATE TABLE `StudentCourse`(
  `IdStudent` INT NOT NULL,
  `IdCourse` INT NOT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;
INSERT INTO `StudentCourse` (`IdStudent`, `IdCourse`)
VALUES
('1', '1'),
('2', '1'),
('2', '13');


CREATE TABLE `TeacherCourse`(
  `IdTeacher` INT NOT NULL,
  `IdCourse` INT NOT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;
INSERT INTO `TeacherCourse` (`IdTeacher`, `IdCourse`)
VALUES
('13', '1'),
('15', '5'),
('14', '2'),
('16', '11');


CREATE TABLE `CommentRating`(
  `Id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `IdStudent` INT NOT NULL,
  `IdTeacher` INT NOT NULL,
  `RatingPoint` INT NOT NULL,
  `CommentContent` TEXT NOT NULL,
  `CommentDate` DATE DEFAULT CURDATE()
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;
INSERT INTO `CommentRating`(`IdStudent`, `IdTeacher`, `RatingPoint`, `CommentContent`)
VALUES
('1', '13', 4, 'Cô rất nhiệt tình !!!'),
('2', '14', 4, 'Thầy rất nhiệt tình !!!');


CREATE TABLE `PendingStudentCourse`(
  `IdStudent` INT NOT NULL,
  `IdCourse` INT NOT NULL,
  `RegisterDate` DATE DEFAULT CURDATE(),
  `Status` VARCHAR(100) NOT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;
INSERT INTO `PendingStudentCourse`(`IdStudent`, `IdCourse`, `RegisterDate`, `Status`)
VALUES
('1', '11', '2021-5-21', 'Chưa duyệt'),
('1', '10', '2021-5-21', 'Chưa duyệt'),
('2', '2', '2021-5-1', 'Chưa duyệt'),
('2', '10', '2021-5-21', 'Chưa duyệt');


CREATE TABLE `PendingCourse`(
  `Id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `IdTeacher` INT NOT NULL,
  `RegisterDate` DATE DEFAULT CURDATE(),
  `CourseName` VARCHAR(256) NOT NULL,
  `CourseImageAddress` VARCHAR(512) DEFAULT NULL,
  `CourseDescription` VARCHAR(512) NOT NULL,
  `StartDateCourse` DATE NOT NULL,
  `EndDateCourse` DATE NOT NULL,
  `CourseTime` VARCHAR(100) NOT NULL,
  `CourseLanguage` VARCHAR(100) NOT NULL,
  `CoursePrice` INT NOT NULL,
  `CourseSlot` INT NOT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

INSERT INTO `PendingCourse` (`IdTeacher`, `RegisterDate`, `CourseName`, `CourseImageAddress`, `CourseDescription`, `StartDateCourse`, `EndDateCourse`, `CourseTime`, `CourseLanguage`, `CoursePrice`, `CourseSlot`)
VALUES
(17, '2021-4-1', 'Tiếng Anh cải thiện kỹ năng giao tiếp cơ bản đến nâng cao', '/App/View/Source/Image/Course/course-english-for-adult.png', 'Đến với khóa học này giúp bạn tự tin sử dụng tiếng Anh để nâng cao chất lượng cuộc sống. Tiếng Anh giúp bạn cải thiện giao tiếp xã hội, nâng cao cơ hội nghề nghiệp cũng như hiểu và tận dụng được nguồn thông tin đa dạng trên internet.', '2021-6-1', '2021-8-3', 'Chiều T3, T5, T7', 'Tiếng Anh', '899000', '25');


CREATE TABLE `News`(
  `Id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `NewsTitle` VARCHAR(256) NOT NULL,
  `NewsImageAddress` VARCHAR(512) DEFAULT NULL,
  `NewsDescription` VARCHAR(1024) NOT NULL,
  `NewsContent` TEXT NOT NULL,
  `NewsReleaseDate` DATE DEFAULT CURDATE(),
  `NewsCategory`  VARCHAR(256) NOT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

INSERT INTO `News` (`NewsTitle`, `NewsImageAddress`, `NewsDescription`, `NewsContent`, `NewsCategory`)
VALUES
('24 Idioms chinh phục 7.0 IELTS Speaking', '/App/View/Source/Image/News/english-idioms.png', 'Chắc hẳn các bạn đều biết sử dụng Idioms (thành ngữ) trong IELTS speaking sẽ giúp cho bạn có những điểm cộng trong phần thi này, tuy nhiên nếu sử dụng idioms không đúng trong ngữ cảnh bạn sẽ bị giám khảo trừ điểm.',
 '<p><strong>1. Don&rsquo;t count your chickens until they are hatched.</strong></p>

<p>Giải nghĩa: You should not make plans that depend on something good happening, because it might not (kh&ocirc;ng n&ecirc;n lập kế hoạch v&igrave; nghĩ rằng</p>

<p>mọi việc sẽ tốt đẹp trong khi những việc đ&oacute; vẫn chưa xảy ra; đừng n&oacute;i trước kẻo bước kh&ocirc;ng qua; đừng đếm cua trong lỗ).</p>

<p>V&iacute; dụ:</p>

<p>I wouldn&#39;t count your chickens, Mr Vass. I&#39;ve agreed to sign the contract, but that&#39;s all.</p>

<p>I think I&rsquo;m going to get straight A&rsquo;s on my tests, but I don&rsquo;t want to count my chickens before they&rsquo;re hatched.</p>

<p><strong>2. A bad/rotten apple</strong></p>

<p>Giải nghĩa: One bad person who has a bad effect on all the others in a group (th&agrave;nh phần c&aacute; biệt; con s&acirc;u l&agrave;m rầu nồi canh).</p>

<p>V&iacute; dụ:</p>

<p>There&rsquo;s always one bad apple in every class.</p>

<p>What do you plan to do about the bad apples in the company when you become CEO?</p>

<p><strong>3. Have egg on your face</strong></p>

<p>Giải nghĩa: To be made to look stupid by something embarrassing (trở th&agrave;nh tr&ograve; cười)</p>

<p>V&iacute; dụ:</p>

<p>The president was left with egg on his face after he called the ambassador by the wrong name.</p>

<p>Mike always said he could speak French fluently, but when he couldn&rsquo;t hold a conversation with the French tourist, he had egg all over his face.</p>

<p><strong>4. Burn the candle at both ends</strong></p>

<p>Giải nghĩa: To get very tired by doing things until very late at night and getting up early in the mornings (mệt mỏi v&igrave; phải thức khuya dậy sớm).</p>

<p>V&iacute; dụ:</p>

<p>If he doesn&rsquo;t stop burning the candle at both ends, he will end up in hospital.</p>

<p>I&rsquo;ve been burning the candle at both ends for too long. I need to slow down.</p>

<p><strong>5. Kill two birds with one stone</strong></p>

<p>Giải nghĩa: To achieve two things with one action (một mũi t&ecirc;n tr&uacute;ng hai đ&iacute;ch; nhất cử lưỡng tiện)</p>

<p>V&iacute; dụ:</p>

<p>I kill two birds with one stone by reading the news in English. I learn about current events AND improve my English.</p>

<p>You can kill two birds with one stone by brushing your teeth in the shower.</p>

<p><strong>6. Paint the town red</strong></p>

<p>Giải nghĩa: To go out to bars, clubs, etc. to enjoy yourself (&ldquo;quậy&rdquo; hết m&igrave;nh ở qu&aacute;n bar, c&acirc;u lạc bộ, v.v...để tận hưởng cuộc sống).</p>

<p>V&iacute; dụ:</p>

<p>Some people like nothing better than to paint the town red at every opportunity, but I prefer to stay at home and read books.</p>

<p>You got a bonus? We must paint the town red immediately!</p>

<p><strong>7. Bite off more than you can chew</strong></p>

<p>Giải nghĩa: To try to do more than you are able to do (&ocirc;m đồm nhiều việc vượt qu&aacute; khả năng của m&igrave;nh; tham thực cực th&acirc;n)</p>

<p>V&iacute; dụ:</p>

<p>At first I was really excited about my new project, but now I feel like I&rsquo;ve bitten off more than I can chew.</p>

<p>She bit off more than she could chew and quickly fell behind in her work.</p>

<p><strong>8. A storm in a teacup</strong></p>

<p>Giải nghĩa: An unnecessary expression of strong feelings about something that is very unimportant (ph&oacute;ng đại sự việc; chuyện b&eacute; x&eacute; ra to).</p>

<p>V&iacute; dụ:</p>

<p>The media is going crazy about it but if you ask me, it&rsquo;s just a storm in a teacup.</p>

<p>We will be alright. It seems bad now but we&rsquo;ll look back and see it was just a storm in a teacup.<br />
<br />
<strong>9. Bite the bullet</strong></p>

<p>Giải nghĩa: to accept something unpleasant because you cannot avoid it any longer. (chấp nhận một việc kh&ocirc;ng mấy dễ chịu v&igrave; kh&ocirc;ng thể tr&aacute;nh được nữa; cắn răng chịu đựng)</p>

<p>V&iacute; dụ:</p>

<p>I don&rsquo;t want to do military service but it&rsquo;s mandatory so I just have to bite the bullet.</p>

<p>I hate dentists but I have a toothache so it looks like I&rsquo;m going to have to bite the bullet.</p>

<p><strong>10. Cry over spilt milk</strong></p>

<p>Giải nghĩa: To waste time feeling sorry about an earlier mistake or problem that cannot be changed (tốn thời gian đi nuối tiếc những việc đ&atilde; xảy ra kh&ocirc;ng thay đổi được; kh&oacute;c g&agrave; quạ tha)</p>

<p>V&iacute; dụ:</p>

<p>It&rsquo;s broken but there&rsquo;s no use crying over spilt milk. We&rsquo;ll just have to buy a new one.</p>

<p>It&rsquo;s no use crying over spilt milk. Just forget it and try to do better next time.</p>

<p><strong>11. Dodge a bullet</strong></p>

<p>Giải nghĩa: to have a narrow escape from a dangerous situation (tho&aacute;t hiểm trong gang tấc)</p>

<p>V&iacute; dụ:</p>

<p>I wasn&rsquo;t wearing my helmet but the police officer didn&rsquo;t even notice. I really dodged a bullet!</p>

<p>The bus I missed had an accident. I feel like I dodged a bullet.<br />
<br />
<strong>12. Every cloud has a silver lining</strong></p>

<p>Giải nghĩa: There is something good even in a situation that seems very sad or difficult (trong c&aacute;i rủi c&oacute; c&aacute;i may, c&aacute;i kh&oacute; l&oacute; c&aacute;i kh&ocirc;n).</p>

<p>V&iacute; dụ:</p>

<p>Every cloud has a silver lining. Maybe losing your job will allow you to pursue your real dreams!</p>

<p>I broke my leg but then met my future wife in hospital. It&rsquo;s true that every cloud has a silver lining.<br />
<br />
<strong>13. A little bird told me</strong></p>

<p>Giải nghĩa: If you have information, but you do not want to reveal who told you it, you can say &#39;A little bird told me&rsquo; (khi bạn biết một điều g&igrave; đ&oacute; nhưng lại kh&ocirc;ng muốn tiết lộ nguồn tin của m&igrave;nh, bạn sẽ n&oacute;i &ldquo;A little bird told me&rdquo;).</p>

<p>V&iacute; dụ:</p>

<p>Who told you that she was up for a big promotion? A little bird told me.</p>

<p>I don&rsquo;t want to be rude but a little bird told me your girlfriend has been cheating on you.<br />
<br />
<strong>14. Have a green thumb</strong></p>

<p>Giải nghĩa: to be good at making plants grow. (m&aacute;t tay trồng c&acirc;y)</p>

<p>V&iacute; dụ:</p>

<p>Look at Sarah&rsquo;s garden! She really has a green thumb.</p>

<p>I admire people with green thumbs. Any plants entrusted to my care die quickly.</p>

<p><strong>15. Money talks</strong></p>

<p>Giải nghĩa: money is power and it can buy influence. (c&oacute; tiền mua ti&ecirc;n cũng được)</p>

<p>V&iacute; dụ:</p>

<p>You want to know how I did it? Money talks, my friend.</p>

<p>She&rsquo;s rich and money talks, so she always gets what she wants.</p>

<p><strong>16. Mind-blowing</strong></p>

<p>Giải nghĩa: absolutely amazing, astounding or shocking. (tuyệt vời, g&acirc;y ấn tượng mạnh, g&acirc;y shock)</p>

<p>V&iacute; dụ:</p>

<p>The computer game has mind-blowing graphics.</p>

<p>It is a mind-blowing experience to me. I will never forget it.<br />
<br />
<strong>17. Pay through the nose</strong></p>

<p>Giải nghĩa: to pay much more for something than it is really worth. (phải trả một c&aacute;i gi&aacute; cắt cổ)</p>

<p>V&iacute; dụ:</p>

<p>After the environmental disaster, the oil company had to pay through the nose to clean it all up.</p>

<p>Be careful your car doens&rsquo;t break down out in the country. The local mechanics will make you pay through the nose to fix it.</p>

<p><strong>18. Shoot yourself in the foot</strong></p>

<p>Giải nghĩa: To say or do something stupid that will cause you a lot of trouble. (n&oacute;i hay l&agrave;m việc xuẩn ngốc v&agrave; tự g&acirc;y rắc rối cho ch&iacute;nh m&igrave;nh; tự m&igrave;nh hại m&igrave;nh)</p>

<p>V&iacute; dụ:</p>

<p>If he keeps talking, pretty soon he&#39;ll shoot himself in the foot.</p>

<p>The applicant shot himself in the foot when he mentioned how many other people were interested in the job.<br />
<br />
<strong>19. Turn green with...</strong></p>

<p>Giải nghĩa: to feel a lof of jealousy with what someone else has. (cảm thấy v&ocirc; c&ugrave;ng ghen tị với những g&igrave; người kh&aacute;c c&oacute; m&agrave; m&igrave;nh kh&ocirc;ng c&oacute;; ghen tức xanh mặt; ghen ăn tức ở)</p>

<p>V&iacute; dụ:</p>

<p>They turned green envy when my wife walked in the room.</p>

<p>I was green with envy when I saw the rich man&rsquo;s collection of sports cars.<br />
<br />
<strong>20. The sky is the limit</strong></p>

<p>Giải nghĩa: There is no limit to what can be achieved. (kh&ocirc;ng c&oacute; giới hạn cho những th&agrave;nh tựu m&agrave; ai đ&oacute; c&oacute; thể đạt được)</p>

<p>V&iacute; dụ:</p>

<p>These days it seems the sky is the limit for successful young Internet ventures.</p>

<p>You can do anything you put your mind to. The sky is the limit.</p>

<p><strong>21. Wash your hands of something</strong></p>

<p>Giải nghĩa: to refuse to be responsible for something any more. (từ chối tiếp tục chịu tr&aacute;ch nhiệm cho một việc n&agrave;o đ&oacute;)</p>

<p>V&iacute; dụ:</p>

<p>The CEO couldn&rsquo;t wait to wash his hands of the money-losing operation.</p>

<p>I washed my hands of the whole situation and I never want to hear about it again.<br />
<br />
<strong>22. Money doesn&rsquo;t grow on trees</strong></p>

<p>Giải nghĩa: used to say that you should not waste money (D&ugrave;ng để nhắc bạn kh&ocirc;ng n&ecirc;n phung ph&iacute; tiền bạc &ldquo;Tiền kh&ocirc;ng phải l&agrave; vỏ hến&rdquo;.)</p>

<p>V&iacute; dụ:</p>

<p>No, I won&rsquo;t buy you that toy robot. Money doesn&rsquo;t grow on trees, you know.</p>

<p>You should know that money doesn&rsquo;t grow on trees. You have to save money</p>

<p><strong>23. See red</strong></p>

<p>Giải nghĩa: To become very angry</p>

<p>(Nổi giận đỏ m&agrave;y đỏ mặt, &ldquo;Giận t&iacute;m mặt&rdquo;.)</p>

<p>V&iacute; dụ:</p>

<p>When he called me an idiot I saw red. I&rsquo;ve never been angrier.</p>

<p>The boss will see red if you make another mistake on this. Do something at gunpoint.</p>

<p><strong>24. Do something at gunpoint</strong></p>

<p>Giải nghĩa: To do something reluctantly, as a result of being strongly forced.&nbsp;(L&agrave;m việc g&igrave; đ&oacute; một c&aacute;ch miễn cưỡng do bị &eacute;p buộc.)</p>

<p>V&iacute; dụ:</p>

<p>I wouldn&rsquo;t sing in public unless I was at gunpoint.</p>

<p>She might go out on a date with you&hellip;at gunpoint! Haha!</p>

<p>C&aacute;c bạn lưu v&agrave;o v&agrave; học nh&eacute;!</p>
', 'Tài liệu');

INSERT INTO `News` (`NewsTitle`, `NewsImageAddress`, `NewsDescription`, `NewsContent`, `NewsCategory`)
VALUES
('Học bổng du học các nước và điều cần biết', '/App/View/Source/Image/News/study-abroad.jpg', 'Xin học bổng du học để đỡ phần chi phí khi theo học tại các trường nước ngoài là điều mà nhiều học sinh, sinh viên mong mỏi. Vậy có những trường nào, nước nào cung cấp các khóa học bổng ra sao? Điều kiện cần để xin học bổng là gì?',
 '<h2><strong>I. Th&ocirc;ng tin học bổng du học c&aacute;c nước</strong></h2>

<p>Mỗi nước v&agrave; trường c&oacute; c&aacute;c hạng mục học bổng kh&aacute;c nhau d&agrave;nh cho c&aacute;c bạn ngo&agrave;i nước. Học bổng từ bậc THCS, THPT hay ĐH, dự bị ĐH, cao đẳng, Thạc sĩ&hellip;đa dạng tại nhiều trường mở ra cơ hội xin học bổng nhiều hơn cho người Việt.</p>

<p>Dưới đ&acirc;y l&agrave; sơ lược một số học bổng kh&aacute;c nhau cho c&aacute;c bạn tham khảo.</p>

<p style="text-align:center"><img alt="học bổng du học và điều cần biết 1" src="https://static.ielts-fighter.com/uploads/2020/10/30/hoc-bong-du-hoc-va-cac-thong-tin-can-biet-1.jpg" style="height:466px; width:700px" /></p>

<p style="text-align:center"><em>Du học v&agrave; xin học bổng du học mỗi nước kh&aacute;c nhau</em></p>

<h3><strong>1. Học bổng du học Anh</strong></h3>

<p>Hiện c&aacute;c trường tại Anh c&oacute; học bổng từ 10-100% d&agrave;nh cho kh&oacute;a phổ th&ocirc;ng, dự bị đại học, đại học. Đặc biệt l&agrave; nhiều học bổng 1.000-5.000 GBP tại c&aacute;c trường ĐH như University of Greenwich, London South Bank University (LSBU),Coventry University,&nbsp; University of Huddersfield, University of Herdfordshire, Plymouth University, University of Portsmouth, Queen&rsquo;s University Belfast (QUB), University of East Anglia (UEA), Birmingham City University (BCU), UCLAN,</p>

<h3><strong>2. Học bổng du học &Uacute;c</strong></h3>

<p>Những trường đại học như Australian National University, Swinburne University,The University of Sydney, Queensland University of technology,&nbsp; Latrobe University, RMIT, University of ollongong, The University of Western Australia,&nbsp; University of technology Sydney, University of Canberra&hellip;đều c&oacute; học bổng từ 10-50% để c&aacute;c bạn học sinh, sinh vi&ecirc;n hướng tới.</p>

<h3><strong>3. Học bổng du học Mỹ</strong></h3>

<p>C&aacute;c trường ở Mỹ c&oacute; nhiều mức học bổng cao từ b&aacute;n phần đến to&agrave;n phần ở chương tr&igrave;nh THPT v&agrave; ĐH, cao đẳng, dự bị đại học.</p>

<p>Những trường ĐH như c&oacute; học bổng 50% : American University,University of Illinois, Adephil University,&nbsp; Auburn Univeristy, University of Kansas, University of Arizona, Univeristy of Central Florida&hellip;nổi tiếng.</p>

<h3><strong>4. Học bổng New Zealand</strong></h3>

<p>Học bổng của c&aacute;c trường thường tối đa đến 50%, c&ugrave;ng nhiều học bổng kh&aacute;c tại trường THPT, học viện, đại học&hellip;kh&aacute;c nhau.</p>

<p>V&iacute; dụ trường học viện c&ocirc;ng nghệ Nelson Marlborough (NMIT) cung cấp chương tr&igrave;nh học bổng tiếng Anh, cử nh&acirc;n với 100% gi&aacute; trị kh&oacute;a học trị gi&aacute; 6,000NZD hay 3,000 NZD.&rsquo;</p>

<p>Một số trường nổi tiếng với học bổng cao kh&aacute;c như: Học viện IPU (3,000 - 7,000NZD), Victoria University, University of Canterburry, Học viện Ara Canterbury, Taylor college, 12 trường THPT c&ocirc;ng lập ở Wellington, Le Cordon Bleu, Đại học Waikato&hellip;</p>

<h3><strong>5. Học bổng du học Canada</strong></h3>

<p>Du học Canada c&ograve;n nổi bật với du học diện visa miễn t&agrave;i ch&iacute;nh. Chi ph&iacute; học bổng du học từ 11.000-1600 CAD/năm. V&igrave; thế nơi đ&acirc;y cũng l&agrave; điểm đến được nhiều bạn lựa chọn n&ecirc;n t&iacute;nh cạnh tranh cũng tăng cao do đ&oacute; hiện ch&iacute;nh s&aacute;ch visa cũng c&oacute; thay đổi theo thời điểm.</p>

<h3><strong>6. Học bổng du học H&agrave; Lan</strong></h3>

<p>Những trường như Amsterdam University, Radboud University, TRotterdam University, he Hague University, Stenden University, Fontys University, HAN University, Inholland University, Saxion University, Tilburg University&hellip;c&oacute; nhiều suất học bổng cao tới 80-100%, học bổng 2.000-5.000 EUR.</p>

<h3><strong>7. Học bổng du học Thụy Sỹ</strong></h3>

<p>Gi&aacute; trị học bổng c&aacute;c trường thường từ 1.000-4.000 CHF (24-96 triệu) v&agrave; c&oacute; thể l&ecirc;n tới 1 tỷ 2 tại c&aacute;c trường ĐH lớn.</p>

<p>Th&ocirc;ng tin học bổng của c&aacute;c trường như BHMS, HTMI, SHMS, IHTTI, Cesar Ritz &hellip;d&agrave;nh cho cử nh&acirc;n, Thạc Sỹ h&agrave;ng năm.</p>

<h3><strong>9. Học bổng du học T&acirc;y Ban Nha, CH Sip</strong></h3>

<p>Du học tại hai nước n&agrave;y hiện đang c&oacute; chi ph&iacute; thấp hơn so với c&aacute;c nước kh&aacute;c n&ecirc;n được nhiều người hướng tới hiện nay. Những mức học bổng 50% của nhiều trường như BEBS, EUHT, tại hay UCAM, ESEI, BEBS, EUHT &hellip;đem lại lựa chọn đa dạng.</p>

<p>V&agrave; học bổng nhiều nước như Singpaore, c&aacute;c nước Đ&ocirc;ng &Acirc;u...kh&aacute;c.</p>

<h2><strong>II. Du học nước n&agrave;o tốt nhất?</strong></h2>

<p>Điều n&agrave;y sẽ l&agrave; trải nghiệm của mỗi người. Thường những trường được đ&aacute;nh gi&aacute; cao theo c&aacute;c bảng xếp hạng h&agrave;ng đầu thế giới. C&aacute;c bạn c&ugrave;ng tham khảo th&ecirc;m c&aacute;c bảng xếp hạng c&aacute;c trường ĐH tốt nhất thế giới ở link:&nbsp;<strong><a href="https://ielts-fighter.com/tin-tuc/Top-truong-Dai-hoc-hang-dau-the-gioi_mt1603994869.html" target="_blank" title="Top trường Đại học xếp hạng cao nhất thế giới">Top trường Đại học xếp hạng cao nhất thế giới</a></strong></p>

<p style="text-align:center"><img alt="học bổng du học và điều cần biết 2" src="https://static.ielts-fighter.com/uploads/2020/10/30/hoc-bong-du-hoc-va-cac-thong-tin-can-biet-2.jpg" style="height:492px; width:700px" /></p>

<p style="text-align:center"><em>Du học nước n&agrave;o cũng cần chuẩn bị kỹ</em></p>

<p>Tuy nhi&ecirc;n, để du học tại c&aacute;c nước, c&aacute;c bạn n&ecirc;n t&igrave;m hiểu n&ecirc;n văn h&oacute;a v&agrave; c&oacute; trang bị c&aacute;c kiến thức về văn h&oacute;a, x&atilde; hội, ch&iacute;nh trị...về đất nước đ&oacute; để h&ograve;a nhập được nhanh ch&oacute;ng hơn. C&oacute; nhiều sinh vi&ecirc;n, học sinh thường trải nghiệm c&aacute;c việc l&agrave;m th&ecirc;m hay t&igrave;m hiểu c&aacute;c anh chị đi trước để c&oacute; th&ecirc;m kinh nghiệm trong việc du học.</p>

<h2><strong>III. Điều kiện cần để xin học bổng</strong></h2>

<p>Mỗi trường y&ecirc;u cầu xin học bổng kh&aacute;c nhau n&ecirc;n c&aacute;c bạn cần t&igrave;m hiểu kỹ lưỡng để nộp đ&uacute;ng thời gian v&agrave; đủ hồ sơ cần thiết. Hồ sơ học bổng du học thường y&ecirc;u cầu chung về :</p>

<p>- Th&ocirc;ng tin c&aacute; nh&acirc;n, những điểm s&aacute;ng trong qu&aacute; tr&igrave;nh học tập, hoạt động ngoại kh&oacute;a, c&acirc;u chuyện ấn tượng.</p>

<p>-&nbsp;Bằng tiếng Anh. C&aacute;c chứng chỉ được chấp nhận phổ biến l&agrave; IELTS hoặc TOEFL iBT, GMAT, GRE, ACT, SAT.&nbsp;Hiện nay c&aacute;c chương tr&igrave;nh&nbsp;học bổng từ ch&iacute;nh phủ t&agrave;i trợ hay nhiều trường thường y&ecirc;u cầu IELTS 6.5 hoặc TOEFL iBT 79.&nbsp;</p>

<p>V&iacute; dụ như xin học bổng tại c&aacute;c trường đại học &Uacute;c&nbsp;y&ecirc;u cầu&nbsp;điểm trung b&igrave;nh đạt từ 8.0 trở l&ecirc;n, IELTS 6.5 hay du học tại Mỹ y&ecirc;u cầu&nbsp;TOEFL iBT 110.</p>

<p style="text-align:center"><img alt="học bổng du học và điều cần biết 3" src="https://static.ielts-fighter.com/uploads/2020/10/30/hoc-bong-du-hoc-va-cac-thong-tin-can-biet-3.jpg" style="height:842px; width:700px" /></p>

<p style="text-align:center"><em>IELTS rất quan trọng khi du học</em></p>

<p>-&nbsp;GPA - l&agrave; điểm trung b&igrave;nh t&iacute;ch lũy của học sinh, sinh vi&ecirc;n trong&nbsp;thời gian học tập. V&iacute; dụ với học sinh THPT th&igrave; điểm tổng kết từ 8.0-9.0 (tương đương A+), hay sinh vi&ecirc;n sau đại học th&igrave; điểm thường l&agrave; mức tr&ecirc;n 7.0 (B trở l&ecirc;n). Y&ecirc;u cầu điểm n&agrave;y ở trường n&agrave;o học bổng x&eacute;t khắt khe th&igrave; c&agrave;ng cao.</p>

<p style="text-align:center"><img alt="học bổng du học và điều cần biết 3" src="https://static.ielts-fighter.com/uploads/2020/10/30/hoc-bong-du-hoc-va-cac-thong-tin-can-biet-4.jpg" style="height:476px; width:700px" /></p>

<p style="text-align:center"><em>Tham khảo bảng quy đổi GPA</em></p>

<p>&nbsp;</p>

<p>Trong số những điều kiện cần để xin học bổng du học th&igrave; chứng chỉ tiếng Anh rất quan trọng. Hiện hầu như c&aacute;c trường đều chấp nhận chứng chỉ IELTS TOEFL, SAT&hellip;Trong đ&oacute; IELTS được chấp nhận rộng r&atilde;i v&agrave; nhiều bạn lựa chọn hơn cả.&nbsp;</p>

<p>Theo y&ecirc;u cầu chung của nhiều trường hiện nay, chứng chỉ từ 5.5, 6.5, 7.0, 7.5 l&agrave; cũng c&oacute; thể đủ điều kiện theo học tại trường. Thường y&ecirc;u cầu chung l&agrave; 6.5. Tuy nhi&ecirc;n, x&eacute;t học chương tr&igrave;nh THPT hay ĐH tại nước ngo&agrave;i, việc c&oacute; tiếng Anh tốt để theo kịp b&agrave;i giảng cũng như giao lưu văn h&oacute;a th&igrave; chứng chỉ 7.0 l&agrave; nhiều bạn hướng tới nhất.</p>

<p>7.0 IELTS đ&aacute;nh gi&aacute; khả năng sử dụng tiếng Anh tốt của th&iacute; sinh, theo cả 4 kỹ năng. Do đ&oacute;, việc tiếp nhận kiến thức v&agrave; giao tiếp, mở rộng, h&ograve;a nhập v&agrave;o thế giới xứ người th&ecirc;m thuận tiện cho c&aacute;c bạn du học sinh.</p>
', 'Kinh nghiệm');

INSERT INTO `News` (`NewsTitle`, `NewsImageAddress`, `NewsDescription`, `NewsContent`, `NewsCategory`)
VALUES
('Mẹo học tiếng Anh cho người mới bắt đầu', '/App/View/Source/Image/News/tips-for-beginner-learn-english.jpg', 'Mẹo học tiếng Anh này phù hợp với bạn, nếu bạn là người mới bắt đầu học tiếng Anh và không muốn rơi vào tình trạng không thể nói hoặc nghe tiếng Anh thì hãy tham khảo bảy mẹo học tiếng Anh cho người mới bắt đầu trong bài viết dưới đây và thử áp dụng với bản thân.',
 '<h3 dir="ltr"><strong>1. B&agrave;i tập học tiếng Anh&nbsp;hằng ng&agrave;y</strong></h3>

<p dir="ltr"><a href="https://giaovientienganh.edu.vn/"><em>Học ngoại ngữ</em></a>&nbsp;cũng giống như đi đến ph&ograve;ng tập thể dục, bạn phải luyện tập mỗi ng&agrave;y. Đối với&nbsp;<strong><em>tiếng Anh</em></strong>, thực h&agrave;nh l&agrave; một c&aacute;ch học ho&agrave;n hảo nhất.</p>

<p dir="ltr">Mẹo: Bạn h&atilde;y d&agrave;nh 15 ph&uacute;t mỗi ng&agrave;y để&nbsp;<strong><em>học tiếng Anh</em></strong>&nbsp;bằng c&aacute;ch nghe nhạc, podcast, đọc s&aacute;ch, xem phim ngắn tr&ecirc;n internet, chơi game tiếng Anh hay đơn giản l&agrave; gặp gỡ một v&agrave;i&nbsp;<a href="https://giaovientienganh.edu.vn/cung-cap-giao-vien-ban-ngu/"><em>người bản ngữ</em></a>.</p>

<h3 dir="ltr"><strong>2. Kh&ocirc;ng chỉ l&agrave; những từ vựng đơn lẻ</strong></h3>

<p dir="ltr">Học vi&ecirc;n mới bắt đầu&nbsp;<strong><em>học tiếng Anh</em></strong>&nbsp;sẽ cảm thấy thoải m&aacute;i khi nghe những từ vựng ri&ecirc;ng lẻ hay từ vựng được lặp đi lặp lại nhiều lần. Điều n&agrave;y kh&ocirc;ng c&oacute; vấn đề g&igrave; cho những ng&agrave;y đầu mới l&agrave;m quen v&agrave; tiếp x&uacute;c với tiếng Anh. Nhưng khi đ&atilde;&nbsp;<strong><em>tiếp x&uacute;c với tiếng Anh</em></strong>&nbsp;được v&agrave;i th&aacute;ng, bạn n&ecirc;n chuyển sang th&oacute;i quen học cả đoạn hoặc cả cụm từ để gi&uacute;p bạn dễ d&agrave;ng trong việc th&agrave;nh lập c&acirc;u v&agrave; khi n&oacute;i sẽ được tự nhi&ecirc;n v&agrave; tr&ocirc;i chảy hơn.</p>

<p dir="ltr">Mẹo: Bạn n&ecirc;n học c&aacute;c cụm collocations trong tiếng Anh. V&iacute; dụ: &ldquo;having breakfast&rdquo; (ăn s&aacute;ng) sẽ kh&aacute;c với &ldquo;making breakfast&rdquo; (chuẩn bị bữa s&aacute;ng).</p>

<h3 dir="ltr"><strong>3. Sự cố gắng</strong></h3>

<p dir="ltr">Mỗi khi bắt đầu một điều g&igrave; đ&oacute; mới mẻ, sẽ lu&ocirc;n c&oacute; một khả năng tiềm ẩn rằng bạn cũng c&oacute; thể bỏ cuộc giữa chừng. Ch&uacute;ng ta thường nghe c&acirc;u n&oacute;i: &ldquo;nếu bạn kh&ocirc;ng th&agrave;nh c&ocirc;ng lần đầu th&igrave; bạn vẫn c&ograve;n cơ hội thử lại lần thứ 2, thứ 3 v&agrave; nhiều lần nữa cho đến khi th&agrave;nh c&ocirc;ng thực sự mỉm cười&rdquo;.</p>

<p dir="ltr">Việc&nbsp;<strong><em>học một ngoại ngữ mới</em></strong>&nbsp;ho&agrave;n to&agrave;n so với tiếng mẹ đẻ kh&ocirc;ng phải l&agrave; điều dễ d&agrave;ng, với những cấu tr&uacute;c, từ vựng, nguy&ecirc;n tắc khiến bạn kh&ocirc;ng sao nhớ nổi nếu kh&ocirc;ng thường xuy&ecirc;n luyện tập. Nhưng việc luyện tập&nbsp;<em><strong>tiếng Anh cho người mới bắt đầu</strong></em>&nbsp;cũng đầy thử th&aacute;ch khi những lỗi sai cứ lặp đi lặp lại, rất dễ khiến người học nản l&ograve;ng v&agrave; muốn bỏ cuộc. Nếu một l&uacute;c n&agrave;o đ&oacute; bạn cảm thấy muốn bỏ cuộc tr&ecirc;n con đường chinh phục ngoại ngữ của m&igrave;nh th&igrave; h&atilde;y nhớ l&yacute; do tại sao bạn muốn bắt đầu. Điều n&agrave;y như một động lực gi&uacute;p bạn giữ lửa v&agrave; tiếp tục cố gắng.</p>

<p dir="ltr">Mẹo: Giữ một quyển sổ tay về những lỗi sai thường gặp của bạn trong qu&aacute; tr&igrave;nh&nbsp;<strong><em>học tiếng Anh</em></strong>. Ki&ecirc;n nhẫn sửa lỗi từng ch&uacute;t một, cho d&ugrave; bạn mắc lỗi h&agrave;ng chục hay h&agrave;ng trăm lần th&igrave; đừng vội bỏ cuộc, những lỗi sai kh&ocirc;ng thể đ&aacute;nh gi&aacute; khả năng tr&iacute; tuệ của bạn, m&agrave; ch&uacute;ng đang gi&uacute;p bạn r&egrave;n luyện v&agrave; ph&aacute;t triển những kỹ năng ngoại ngữ của m&igrave;nh.</p>

<h3 dir="ltr"><strong>4. D&aacute;n nh&atilde;n</strong></h3>

<p dir="ltr">C&oacute; một kỹ thuật đơn giản để ghi nhớ c&aacute;c từ vựng tiếng Anh mới đ&oacute; l&agrave; ghi nh&atilde;n. Phương ph&aacute;p học tiếng Anh n&agrave;y rất hữu &iacute;ch cho những người lớn tuổi học tiếng Anh. Họ c&oacute; thể ghi t&ecirc;n tiếng Anh của những đồ vật trong nh&agrave; v&agrave;o một mảnh giấy nhỏ v&agrave; d&aacute;n ch&uacute;ng l&ecirc;n những vật dụng tương ứng để đưa tiếng Anh v&agrave;o cuộc sống hằng ng&agrave;y.</p>

<p dir="ltr">Mẹo: H&atilde;y d&aacute;n nh&atilde;n mọi thứ m&agrave; bạn cần biết. N&ecirc;n sử dụng những mảnh giấy m&agrave;u để mỗi m&agrave;u sẽ đại diện cho một loại đồ vật. V&iacute; dụ: bạn c&oacute; thể sử dụng những mảnh ghi ch&uacute; m&agrave;u xanh l&aacute; c&acirc;y cho c&aacute;c thiết bị điện.</p>

<p dir="ltr">Ngo&agrave;i c&aacute;ch sử dụng những mảnh giấy để học từ vựng, c&aacute;c bạn cũng c&oacute; thể tải những&nbsp;ứng dụng&nbsp;<strong><em>học từ vựng tiếng Anh</em></strong>&nbsp;miễn ph&iacute; v&agrave;o c&aacute;c thiết bị di động để c&oacute; th&ecirc;m những trải nghiệm th&uacute; vị cho việc học.</p>

<h3 dir="ltr">&nbsp;</h3>

<h3 dir="ltr"><strong>5. Th&ecirc;m nhiều đối tượng v&agrave;o b&agrave;i học</strong></h3>

<p dir="ltr">Kh&ocirc;ng c&oacute; g&igrave; th&uacute; vị hơn l&agrave; bạn c&oacute; thể đem gia đ&igrave;nh v&agrave; bạn b&egrave; của m&igrave;nh v&agrave;o trong c&aacute;c b&agrave;i học tiếng Anh để tăng th&ecirc;m sự gần gũi v&agrave; th&uacute; vị. Tuy nhi&ecirc;n, bạn cũng cần lưu &yacute; về kh&iacute;a cạnh đạo đức khi mang những người th&acirc;n v&agrave;o b&agrave;i học.</p>

<p dir="ltr">Mẹo: Bạn c&oacute; thể quay video tiếng Anh về gia đ&igrave;nh hoặc bạn b&egrave;. C&oacute; thể thực hiện điều n&agrave;y mỗi tuần với nhiều chủ đề kh&aacute;c nhau. Sau một th&aacute;ng, chắc chắn bạn sẽ c&oacute; một số video th&uacute; vị v&agrave; khoảng thời gian vui vẻ khi xem lại c&ugrave;ng gia đ&igrave;nh hoặc bạn b&egrave; của m&igrave;nh.</p>

<blockquote><img alt="" src="https://pfn.vn/sites/default/files/anh_bai_viet/cach-hoan-thanh-muc-tieu-trong-ban-hang.png" style="height:522px; width:767px" />
<p>Bạn n&ecirc;n x&aacute;c định một mục ti&ecirc;u cụ thể để soi s&aacute;ng con đường học ngoại ngữ của m&igrave;nh.</p>
</blockquote>

<h3 dir="ltr"><strong>6. Đặt mục ti&ecirc;u</strong></h3>

<p dir="ltr">Bạn n&ecirc;n x&aacute;c định một mục ti&ecirc;u cụ thể v&agrave; tập trung v&agrave;o đ&oacute; khi bắt đầu học ngoại ngữ. H&atilde;y đặt&nbsp;<em><strong>mục ti&ecirc;u để học tiếng Anh</strong></em>&nbsp;xoay quanh lĩnh vực m&agrave; bạn đang quan t&acirc;m. Điều n&agrave;y sẽ rất hữu &iacute;ch cho việc học của bạn. V&iacute; dụ: nếu bạn muốn đi mua sắm quần &aacute;o ở một quốc gia n&oacute;i tiếng Anh, bạn sẽ phải học những cụm từ li&ecirc;n quan như: &ldquo;Where is the changing room?&rdquo; hoặc &ldquo;Can I pay by credit card?&rdquo;.</p>

<p dir="ltr">Mẹo: H&atilde;y viết những g&igrave; bạn muốn học trong một tuần v&agrave;o quyển sổ tay. V&agrave;o cuối tuần, kiểm tra xem bạn đ&atilde; đạt được những mục ti&ecirc;u tiếng Anh n&agrave;o v&agrave; điều g&igrave; đ&atilde; cản trở cũng như hỗ trợ cho việc học của bạn. Bằng c&aacute;ch trả lời những c&acirc;u hỏi n&agrave;y, bạn sẽ cải thiện rất nhiều cho qu&aacute; tr&igrave;nh học của m&igrave;nh.</p>

<h3 dir="ltr"><strong>7. Khoảng thời gian vui vẻ</strong></h3>

<p dir="ltr">Thời gian đầu khi mới&nbsp;<strong><em>học tiếng Anh</em></strong>&nbsp;thực sự kh&ocirc;ng dễ d&agrave;ng ch&uacute;t n&agrave;o. Bạn sẽ cảm thấy kh&aacute; thất vọng v&agrave; đ&acirc;y l&agrave; khoảng thời gian dễ khiến người học từ bỏ v&igrave; nản l&ograve;ng. V&igrave; vậy, bạn phải tạo ra khoảnh khắc học tập vui vẻ để th&uacute;c đẩy những cảm x&uacute;c t&iacute;ch cực. Khi những cảm x&uacute;c n&agrave;y được li&ecirc;n kết với qu&aacute; tr&igrave;nh học, bạn sẽ thấy những&nbsp;<em>kỹ năng tiếng Anh</em>&nbsp;của m&igrave;nh được cải thiện một c&aacute;ch đ&aacute;ng kể.</p>

<p dir="ltr">Mẹo: nếu bạn mắc lỗi, chỉ cần &ldquo;cười v&agrave;o ch&uacute;ng&rdquo;. Điều quan trọng trong qu&aacute; tr&igrave;nh học tiếng Anh l&agrave; vui vẻ, thoải m&aacute;i v&agrave; ki&ecirc;n tr&igrave;.</p>

<p dir="ltr">Với mẹo học tiếng anh cho người mới th&igrave; sẽ dễ d&agrave;ng hơn, rất tuyệt vời nếu bạn c&oacute; thể thể hiện bản th&acirc;n bằng tiếng Anh, quả l&agrave; một thử th&aacute;ch đầy th&uacute; vị phải kh&ocirc;ng n&agrave;o! Ch&uacute;c c&aacute;c bạn th&agrave;nh c&ocirc;ng.</p>
', 'Mẹo vặt');

INSERT INTO `News` (`NewsTitle`, `NewsImageAddress`, `NewsDescription`, `NewsContent`, `NewsCategory`)
VALUES
('IELTS là gì ? Lệ phí thi bao nhiêu ? Thi ở đâu ?', '/App/View/Source/Image/News/ielts-infor.jpg', 'Chứng chỉ IELTS được xem là tấm giấy thông hành mở ra cơ hội sự nghiệp và học tập mang tính quốc tế. Cùng Sunflower Center hiểu rõ về Cấu Trúc Đề Thi IELTS để chuẩn bị thật tốt cho kỳ thi IELTS của bạn nhé.',
 '<h1>Giới thiệu về k&igrave; thi IELTS</h1>

<p><strong>IELTS</strong>&nbsp;(viết tắt từ International English Language Testing System) l&agrave; một k&igrave; thi Anh ngữ chuẩn c&agrave;ng ng&agrave;y c&agrave;ng được thừa nhận rộng r&atilde;i tr&ecirc;n thế giới. B&agrave;i kiểm&nbsp;<strong>tra IELTS</strong>&nbsp;được sử dụng để đ&aacute;nh gi&aacute; tr&igrave;nh độ tiếng Anh của những người mong muốn đi học hay l&agrave;m việc trong một m&ocirc;i trường n&oacute;i tiếng Anh. Phần lớn ứng vi&ecirc;n l&agrave; sinh vi&ecirc;n muốn tiếp tục được đ&agrave;o tạo ở nước ngo&agrave;i v&agrave; những người t&igrave;m c&aacute;ch khởi nghiệp ở nước ngo&agrave;i. Hiện nay c&oacute; hơn 10&nbsp;000 tổ chức, cả c&ocirc;ng v&agrave; tư, chấp nhận chứng chỉ IELTS.</p>

<p>Mỗi năm c&oacute; đến hơn 3 triệu th&iacute; sinh tham dự k&igrave; thi IELTS, theo nguồn tin từ website của Hội đồng Anh (British Council). Con số đ&oacute; n&oacute;i l&ecirc;n một điều l&agrave; k&igrave; thi IELTS l&agrave; một trong những k&igrave; kiểm tra đ&aacute;nh gi&aacute; ng&ocirc;n ngữ phổ biến, nổi tiếng nhất tr&ecirc;n thế giới.</p>

<p style="text-align:center"><img alt="IELTS LÀ GÌ? LỆ PHÍ THI BAO NHIÊU? THI Ở Đ U?" src="https://global-exam.com/blog/wp-content/uploads/2020/06/ielts-viet-test-1-300x200.jpg" style="height:333px; width:500px" /></p>

<p>C&oacute;&nbsp;<strong>2 dạng IELTS:</strong></p>

<ol>
	<li><strong>IELTS Học thuật/ IELTS Academic</strong>&nbsp;d&agrave;nh cho những sinh vi&ecirc;n muốn theo học đại học v&agrave; sau đại học trong c&aacute;c cơ sở đ&agrave;o tạo ở nước ngo&agrave;i.</li>
	<li><strong><em>IETLS Tổng qu&aacute;t/ IELTS General Training</em></strong>&nbsp;cho ph&eacute;p những người muốn l&agrave;m việc ở nước ngo&agrave;i được chứng thực tr&igrave;nh độ Anh ngữ của họ.</li>
</ol>

<p>D&ugrave; bạn thi theo dạng IELTS n&agrave;o th&igrave; một lời khuy&ecirc;n quan trọng ch&uacute;ng t&ocirc;i d&agrave;nh cho bạn l&agrave; cần&nbsp;<strong>phải lập kế hoạch chuẩn bị &ocirc;n thi&nbsp;</strong>để kh&ocirc;ng bị bất ngờ v&agrave;o ng&agrave;y đi thi.</p>

<p>B&agrave;i kiểm tra IELTS d&ugrave;ng để đ&aacute;nh gi&aacute;<strong>&nbsp;4 kỹ năng ng&ocirc;n ngữ:</strong></p>

<ul>
	<li><strong>Listening</strong>&nbsp;(kỹ năng Nghe) bao gồm 40 c&acirc;u hỏi kh&aacute;c nhau dưới dạng c&aacute;c đề b&agrave;i kh&aacute;c nhau: c&acirc;u hỏi nhiều lựa chọn, điền v&agrave;o chỗ trống, nối c&acirc;u hỏi với c&acirc;u trả lời, ho&agrave;n thiện sơ đồ&hellip;</li>
	<li><strong>Reading</strong>&nbsp;(kỹ năng Đọc) cũng bao gồm 40 c&acirc;u hỏi kh&aacute;c nhau dựa tr&ecirc;n c&aacute;c đề b&agrave;i ở đủ c&aacute;c dạng thức kh&aacute;c nhau: c&acirc;u hỏi nhiều lựa chọn, điền v&agrave;o chỗ trống, nối c&acirc;u hỏi với c&acirc;u trả lời, ho&agrave;n thiện sơ đồ&hellip;</li>
	<li><strong>Writing</strong>&nbsp;(kỹ năng Viết) bao gồm 2 b&agrave;i viết luận: b&agrave;i thứ nhất c&oacute; &iacute;t nhất 150 từ v&agrave; b&agrave;i thứ hai c&oacute; &iacute;t nhất 250 từ.</li>
	<li><strong>Speaking</strong>&nbsp;(kỹ năng N&oacute;i) diễn ra dưới h&igrave;nh thức một cuộc phỏng vấn c&aacute; nh&acirc;n trực diện với một vị gi&aacute;m khảo IELTS, bao gồm 3 phần: gi&aacute;m khảo đặt những c&acirc;u hỏi li&ecirc;n quan đến cuộc sống c&aacute; nh&acirc;n của bạn, gi&aacute;m khảo đề nghị bạn n&oacute;i về một chủ đề được r&uacute;t thăm một c&aacute;ch ngẫu nhi&ecirc;n v&agrave; sau đ&oacute; sẽ thiết lập một cuộc trao đổi mang t&iacute;nh chất kh&aacute;i qu&aacute;t hơn thường về chủ đề đ&atilde; được bốc thăm.</li>
</ul>

<h2><strong>Ph&acirc;n lượng thời gian</strong>&nbsp;(như nhau đối với cả hai dạng thi IELTS)</h2>

<ul>
	<li><strong>Listening</strong>&nbsp;k&eacute;o d&agrave;i 40 ph&uacute;t</li>
</ul>

<p>&deg; 30 ph&uacute;t nghe</p>

<p>&deg; 10 ph&uacute;t để điền c&aacute;c c&acirc;u trả lời l&ecirc;n phiếu trả lời</p>

<ul>
	<li><strong>Reading</strong>&nbsp;c&oacute; thời lượng 60 ph&uacute;t</li>
</ul>

<p>&deg; trung b&igrave;nh 20 ph&uacute;t cho mỗi văn bản</p>

<ul>
	<li><strong>Writing</strong>&nbsp;k&eacute;o d&agrave;i 60 ph&uacute;t</li>
</ul>

<p>&deg; 20 ph&uacute;t cho b&agrave;i luận thứ nhất chứa &iacute;t nhất 150 từ</p>

<p>&deg; 40 ph&uacute;t cho b&agrave;i luận thứ hai chứa &iacute;t nhất 250 từ</p>

<ul>
	<li><strong>Speaking</strong>&nbsp;c&oacute; thời lượng dao động từ 10 đến 15 ph&uacute;t</li>
</ul>

<p>&deg; từ 2 đến 3 ph&uacute;t cho phần phỏng vấn thứ nhất (c&acirc;u hỏi li&ecirc;n quan đến c&aacute; nh&acirc;n th&iacute; sinh)</p>

<p>&deg; từ 4 đến 5 ph&uacute;t cho phần phỏng vấn thứ hai (c&acirc;u hỏi li&ecirc;n quan đến chủ đề bốc thăm)</p>

<p>&deg; từ 4 đến 7 ph&uacute;t cho phần phỏng vấn thứ ba (c&acirc;u hỏi mang t&iacute;nh kh&aacute;i qu&aacute;t hơn)</p>

<p>Tổng cộng thời lượng của c&aacute;c b&agrave;i kiểm tra IELTS dao động&nbsp;<strong>từ 2 giờ 50 ph&uacute;t đến 2 giờ 55 ph&uacute;t.</strong></p>

<h2>C&aacute;c chủ đề của IELTS</h2>

<p>Bởi v&igrave; b&agrave;i kiểm tra IELTS c&oacute; mục đ&iacute;ch đ&aacute;nh gi&aacute; tr&igrave;nh độ ng&ocirc;n ngữ chung của th&iacute; sinh n&ecirc;n&nbsp;<strong>tất cả c&aacute;c chủ đề mang t&iacute;nh thời sự c&oacute; thể sẽ được đề cập</strong>&nbsp;trong cả 4 phần thi.</p>

<ul>
	<li><strong>To&agrave;n cảnh x&atilde; hội hiện đại</strong>&nbsp;(to&agrave;n cầu h&oacute;a, những tiến bộ khoa học kĩ thuật, c&ocirc;ng nghệ mới, y tế sức khỏe&hellip;)</li>
	<li><strong>Cuộc sống thường nhật</strong>&nbsp;(giao th&ocirc;ng, đồ ăn thức uống, giải tr&iacute;&hellip;)</li>
	<li><strong>Gi&aacute;o dục</strong>&nbsp;(việc học tập, việc học ngoại ngữ, chương tr&igrave;nh đại học&hellip;)</li>
	<li><strong>M&ocirc;i trường</strong>&nbsp;(hệ sinh th&aacute;i, biến đổi kh&iacute; hậu, c&aacute;c lo&agrave;i c&oacute; nguy cơ tuyệt chủng&hellip;)</li>
	<li><strong>C&ocirc;ng việc</strong>&nbsp;(thất nghiệp, nghỉ hưu, t&aacute;c động của ch&iacute;nh phủ&hellip;)</li>
</ul>

<p>Lưu &yacute; rằng b&agrave;i kiểm tra IELTS Reading của dạng IELTS Tổng qu&aacute;t thường đưa ra c&aacute;c văn bản tập trung hơn về chủ đề c&ocirc;ng việc, nghề nghiệp trong khi đ&oacute; b&agrave;i kiểm tra IELTS Reading của dạng IELTS Học thuật c&oacute; thể đề cập đến bất k&igrave; chủ đề n&agrave;o được n&ecirc;u ở tr&ecirc;n.</p>

<h2>Thi IELTS ở đ&acirc;u?</h2>

<p>Bạn chỉ được ph&eacute;p thi IELTS ở c&aacute;c trung t&acirc;m được Hội đồng Anh (British Council) ủy nhiệm. Ở Việt Nam, k&igrave; thi IELTS được tổ chức tại H&agrave; Nội, Th&agrave;nh phố Hồ Ch&iacute; Minh v&agrave; hơn 20 tỉnh, th&agrave;nh phố tr&ecirc;n cả nước. Th&iacute; sinh c&oacute; thể đăng k&iacute; thi trực tiếp tại Văn ph&ograve;ng Hội đồng Anh hoặc đăng k&iacute; th&ocirc;ng qua hệ thống c&aacute;c đối t&aacute;c ch&iacute;nh thức tổ chức thi IELTS của Hội đồng Anh.</p>

<p>Ở H&agrave; Nội v&agrave; Th&agrave;nh phố Hồ Ch&iacute; Minh, bạn c&oacute; thể đăng k&iacute; thi IELTS trực tiếp với Hội đồng Anh, với lịch thi l&ecirc;n đến 4 ng&agrave;y mỗi th&aacute;ng (từ th&aacute;ng 1 đến th&aacute;ng 6). Ngo&agrave;i ra, tại H&agrave; Nội, bạn c&oacute; thể đăng k&iacute; thi với c&aacute;c đối t&aacute;c của Hội đồng Anh như: Học viện Anh ngữ 5 sao Atlantic Five-Star English, GLN English Center, Đại học Kinh tế Quốc d&acirc;n. Tại Th&agrave;nh phố Hồ Ch&iacute; Minh, bạn c&oacute; thể đăng k&iacute; thi IELTS với đối t&aacute;c của Hội đồng Anh l&agrave; Trường Cao đẳng Quốc tế Kent. C&aacute;c tỉnh, th&agrave;nh phố c&oacute; c&aacute;c trung t&acirc;m được Hội đồng Anh ủy nhiệm tổ chức thi IELTS l&agrave;: Hải Ph&ograve;ng, Hạ Long (Quảng Ninh), Bắc Giang, Ph&uacute; Thọ, Thanh H&oacute;a, Vinh (Nghệ An), Huế, Đ&agrave; Nẵng, Quy Nhơn (B&igrave;nh Định), Quảng Ng&atilde;i, Tuy H&ograve;a (Ph&uacute; Y&ecirc;n), Quảng Trị, Bu&ocirc;n Ma Thuột (Đắc Lắc), Pleiku (Gia Lai), Nha Trang, Đ&agrave; Lạt, Vũng T&agrave;u, Bi&ecirc;n H&ograve;a (Đồng Nai), Đồng Th&aacute;p, Cần Thơ, B&igrave;nh Dương, Tr&agrave; Vinh, Vĩnh Long.</p>

<p>Ch&uacute;ng t&ocirc;i khuy&ecirc;n bạn n&ecirc;n đăng k&iacute; thi &iacute;t nhất trước 2 th&aacute;ng.</p>

<p><strong>Lệ ph&iacute; thi</strong>&nbsp;cho mỗi dạng IELTS (Học thuật v&agrave; Tổng qu&aacute;t) l&agrave; 4&nbsp;750&nbsp;000 VNĐ.</p>

<h2>V&igrave; sao n&ecirc;n thi lấy chứng chỉ IELTS?</h2>

<p>Chứng chỉ IELTS gi&uacute;p bạn mở v&ocirc; số c&aacute;nh cửa cả về mặt học thuật v&agrave; c&ocirc;ng việc. Đ&acirc;y l&agrave; một chứng chỉ ng&ocirc;n ngữ nổi tiếng được c&ocirc;ng nhận tr&ecirc;n to&agrave;n thế giới, trong đ&oacute; c&oacute; &Uacute;c, Canada, Niu Di-l&acirc;n, Anh v&agrave; Mỹ.</p>

<p>&nbsp;</p>
', 'Tin tức');


INSERT INTO `News` (`NewsTitle`, `NewsImageAddress`, `NewsDescription`, `NewsContent`, `NewsCategory`)
VALUES
('Đại từ sở hữu (possessive pronoun): Cách sử dụng và bài tập', '/App/View/Source/Image/News/possessive-pronoun.png', 'Khi học đến đại từ, chúng ta sẽ biết được nó có nhiều loại khác nhau trong đó có đại từ sở hữu. Bài viết này, chúng ta cùng tìm hiểu sâu hơn về Đại từ sở hữu trong tiếng Anh và cách sử dụng chúng nhé !',
 '<h2><strong>Đại từ sở hữu l&agrave; g&igrave;?</strong></h2>

<p><strong>Đại từ sở hữu</strong>&nbsp;(<strong>possessive pronoun</strong>) l&agrave;&nbsp;những&nbsp;<strong>đại từ</strong>&nbsp;d&ugrave;ng để&nbsp;<strong>chỉ sự sở hữu</strong>,&nbsp;<strong>nhấn mạnh sự sở hữu</strong>&nbsp;đ&oacute; hoặc&nbsp;<strong>tr&aacute;nh sự lặp từ</strong>&nbsp;trong c&acirc;u.</p>

<p><img alt="Đại từ sở hữu" src="https://static.ielts-fighter.com/uploads/2021/04/29/dai-tu-so-huu.jpg" style="height:372px; width:710px" /></p>

<h2><strong>C&aacute;c loại đại từ sở hữu</strong></h2>

<p>Trong tiếng Anh c&oacute; 7 đại từ chỉ sự sở hữu sau:</p>

<table align="center" border="1" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th scope="col">Đại từ sở hữu</th>
			<th scope="col">V&iacute; dụ</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><strong>mine</strong>&nbsp;(của t&ocirc;i)</td>
			<td>That car is&nbsp;<strong>mine</strong>. (Chiếc xe đ&oacute; l&agrave; của t&ocirc;i.)</td>
		</tr>
		<tr>
			<td><strong>ours</strong>&nbsp;(của ch&uacute;ng t&ocirc;i)</td>
			<td>That car is&nbsp;<strong>ours</strong>. (Chiếc xe đ&oacute; l&agrave; của ch&uacute;ng t&ocirc;i.)</td>
		</tr>
		<tr>
			<td><strong>yours</strong>&nbsp;(của bạn)</td>
			<td>That car is&nbsp;<strong>yours</strong>. (Chiếc xe đ&oacute; l&agrave; của bạn.)</td>
		</tr>
		<tr>
			<td><strong>his</strong>&nbsp;(của anh ấy)</td>
			<td>That car is&nbsp;<strong>his</strong>. (Chiếc xe đ&oacute; l&agrave; của anh ấy.)</td>
		</tr>
		<tr>
			<td><strong>hers</strong>&nbsp;(của c&ocirc; ấy)</td>
			<td>That car is&nbsp;<strong>hers</strong>. (Chiếc xe đ&oacute; l&agrave; của c&ocirc; ấy.)</td>
		</tr>
		<tr>
			<td><strong>theirs</strong>&nbsp;(của họ)</td>
			<td>That car is&nbsp;<strong>theirs</strong>. (Chiếc xe đ&oacute; l&agrave; của họ.)</td>
		</tr>
		<tr>
			<td><strong>its</strong>&nbsp;(của n&oacute;)</td>
			<td>I have a guinea pig, this carrot is&nbsp;<strong>its</strong>. (T&ocirc;i c&oacute; một con chuột lang, đ&acirc;y l&agrave; củ c&agrave; rốt của n&oacute;.)</td>
		</tr>
	</tbody>
</table>

<p>*<strong>Ch&uacute; &yacute;</strong>:&nbsp;Đại từ sở hữu &quot;its&quot; hiếm khi được sử dụng trong thực tế n&ecirc;n nhiều t&agrave;i liệu đ&atilde; loại bỏ n&oacute; v&agrave; biến t&iacute;nh từ sở hữu &quot;it&quot; th&agrave;nh &quot;its&quot;.</p>

<h2><strong>Vị tr&iacute; của đại từ sở hữu trong c&acirc;u</strong></h2>

<p>V&igrave; đại từ&nbsp;sở hữu&nbsp;l&agrave; một loại của đại từ n&ecirc;n n&oacute; c&oacute; thể xuất hiện ở c&aacute;c vị tr&iacute; của đại từ:</p>

<p><strong>1. Đại từ sở hữu l&agrave;m chủ ngữ.</strong></p>

<p>V&iacute; dụ:&nbsp;His pet is a dog.&nbsp;<strong>Mine</strong>&nbsp;is a cat. (Vật nu&ocirc;i của anh ấy l&agrave; một con ch&oacute;. Của t&ocirc;i l&agrave; một con m&egrave;o.)</p>

<p><strong>2. Đại từ sở hữu l&agrave;m&nbsp;<a href="https://ielts-fighter.com/tin-tuc/Tan-ngu-la-gi-Cac-loai-va-hinh-thuc-tan-ngu-trong-tieng-Anh_mt1619604920.html" target="_blank">t&acirc;n ngữ</a>.</strong></p>

<p>V&iacute; dụ: The book you are reading is&nbsp;<strong>mine</strong>. (Cuốn s&aacute;ch bạn đang đọc l&agrave; của t&ocirc;i.)</p>

<p><strong>3. Đại từ sở hữu đứng sau&nbsp;<a href="https://ielts-fighter.com/tin-tuc/GIOI-TU-PREPOSITIONS-trong-tieng-Anh-va-cach-su-dung-bai-tap-co-dap-an_mt1548113270.html" target="_blank">giới từ</a>.</strong></p>

<p>V&iacute; dụ: It was the best gift in&nbsp;<strong>his</strong>&nbsp;life. (Đ&oacute; l&agrave; m&oacute;n qu&agrave; tuyệt vời nhất trong cuộc đời anh ấy.)</p>

<h2><strong>C&aacute;ch d&ugrave;ng đại từ sở hữu tiếng Anh</strong></h2>

<p><strong>1. Đại từ sở hữu được sử dụng thay thế cho&nbsp;<a href="https://ielts-fighter.com/tin-tuc/DANH-TU-TRONG-TIENG-ANH-va-BAI-TAP-CO-DAP-AN_mt1546446610.html" target="_blank">danh từ</a>&nbsp;c&oacute; chứa t&iacute;nh từ sở hữu (Đại từ sở hữu = T&iacute;nh từ sở hữu + Danh từ).</strong></p>

<p>V&iacute; dụ:&nbsp;She has a blue phone.&nbsp;<strong>Mine</strong>&nbsp;is black. (C&ocirc; ấy c&oacute; một chiếc điện thoại m&agrave;u xanh lam. Của t&ocirc;i m&agrave;u đen.)</p>

<p>=&gt; Trong c&acirc;u ta thấy đại từ sở hữu &quot;mine&quot; được sử dụng thay thế cho &quot;my phone&quot; chứa danh từ &quot;phone&quot; với t&iacute;nh từ sở hữu &quot;my&quot;.</p>

<p><strong>2. Đại từ sở hữu sử dụng&nbsp;cuối&nbsp;c&aacute;c l&aacute; thư như một quy ước.</strong></p>

<ul>
	<li><strong>Yours</strong>: th&acirc;n</li>
	<li><strong>Yours sincerely</strong>: tr&acirc;n trọng (trong trường hợp biết t&ecirc;n người nhận thư)</li>
	<li><strong>Yours faithfully</strong>: tr&acirc;n trọng (trong trường hợp biết t&ecirc;n người nhận thư)</li>
</ul>

<p><strong>3. Đại từ sở hữu sử dụng để nhấn mạnh&nbsp;sự&nbsp;sở hữu.</strong></p>

<p>V&iacute; dụ:</p>

<ul>
	<li>This is&nbsp;<strong>my</strong>&nbsp;prey. (Đ&acirc;y l&agrave; con mồi của t&ocirc;i.)</li>
	<li>This prey is&nbsp;<strong>mine</strong>. (Con mồi n&agrave;y l&agrave; của t&ocirc;i.)</li>
</ul>

<p>=&gt; Ta c&oacute; thể khi sử dụng đại từ sở hữu, sự sở hữu được nhấn mạnh hơn. Nhưng điều đ&oacute; chỉ dễ nhận thấy được&nbsp;khi sử dụng trong giao tiếp thực tế.</p>

<p><strong>4. Đại từ sở hữu sử dụng để tr&aacute;nh lặp từ trong c&acirc;u.</strong></p>

<p>V&iacute; dụ:&nbsp;His cell phone has fast charging but&nbsp;<strong>mine</strong>&nbsp;doesn&#39;t. (Điện thoại di động của anh ấy c&oacute; sạc nhanh nhưng của t&ocirc;i th&igrave; kh&ocirc;ng.)</p>

<p>=&gt; Ta thấy trong c&acirc;u chỉ sử dụng một lần từ &quot;cell phone&quot; để tr&aacute;nh lặp từ trong c&acirc;u kh&ocirc;ng c&oacute; dấu ph&acirc;n c&aacute;ch.</p>

<p><img alt="Ví dụ đại từ sở hữu" src="https://static.ielts-fighter.com/uploads/2021/04/29/vi-du-dai-tu-so-huu.jpg" style="height:466px; width:697px" /></p>

<h2><strong>Ph&acirc;n biệt đại từ sở hữu v&agrave; t&iacute;nh từ sở hữu</strong></h2>

<p><strong>Đại từ sở hữu = T&iacute;nh từ sở hữu + Danh từ</strong></p>

<p>Trong đ&oacute;:</p>

<ul>
	<li><strong>T&iacute;nh từ sở hữu</strong>: Bổ nghĩa lu&ocirc;n cho danh từ đằng sau n&oacute;.</li>
	<li><strong>Đại từ sở hữu</strong>: Đ&oacute;ng vai tr&ograve; như một cụm danh từ hoặc đại diện cho danh từ&nbsp;c&oacute; chứa&nbsp;t&iacute;nh từ sở hữu.</li>
</ul>

<p>V&iacute; dụ:</p>

<table align="center" border="1" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th scope="col">T&iacute;nh từ sở hữu</th>
			<th scope="col">Đại từ sở hữu</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>This is&nbsp;<strong>my</strong>&nbsp;book. (Đ&acirc;y l&agrave; quyển s&aacute;ch của t&ocirc;i.)</td>
			<td>This book is&nbsp;<strong>mine</strong>. (Cuốn s&aacute;ch n&agrave;y l&agrave; của t&ocirc;i.)</td>
		</tr>
	</tbody>
</table>

<h2><strong>B&agrave;i tập đại từ sở hữu</strong></h2>

<p><strong>B&agrave;i 1: Điền v&agrave;o chỗ trống.</strong></p>

<p>1) Is this cup ____ (your / yours)?</p>

<p>2) The coffee is ____ (my/mine).</p>

<p>3) That coat is ____ (my/mine).</p>

<p>4) He lives in ____ (her/hers) house.</p>

<p>5) You might want ____ (your/yours) phone.</p>

<p>6) The new car is ____ (their/theirs).</p>

<p>7) She cooked ____ (our/ours) food.</p>

<p>8) Don&#39;t stand on ____ (my/mine) foot!</p>

<p>9) She gave him ____ (her/hers) suitcase.</p>

<p>10) I met ____ (their/theirs) mother.</p>

<p>11) Is this ____ (their/theirs) coffee?</p>

<p>12) Is the flat ____ (her/hers)?</p>

<p>13) The grey scarf is ____ (my/mine).</p>

<p>14) That red bike is ____ (our/ours).</p>

<p>15) We should take ____ (our/ours) coats.</p>

<p>16) That is ____ (my/mine) car.</p>

<p>17) He dropped ____ (my/mine) bag.</p>

<p>18) Are these phones ____ (their/theirs)?</p>

<p>19) These cakes are ____ (our/ours)!</p>

<p>20) Are those children ____ (your/yours)?</p>

<p><strong>Đ&aacute;p &aacute;n:</strong></p>

<p>1.&nbsp;yours</p>

<p>2.&nbsp;mine</p>

<p>3.&nbsp;mine</p>

<p>4.&nbsp;her</p>

<p>5.&nbsp;your</p>

<p>6.&nbsp;theirs</p>

<p>7.&nbsp;our</p>

<p>8.&nbsp;my</p>

<p>9. her</p>

<p>10.&nbsp;their</p>

<p>11.&nbsp;their</p>

<p>12.&nbsp;hers</p>

<p>13.&nbsp;mine</p>

<p>14.&nbsp;ours</p>

<p>15.&nbsp;our</p>

<p>16.&nbsp;my</p>

<p>17.&nbsp;my</p>

<p>18.&nbsp;theirs</p>

<p>19.&nbsp;ours</p>

<p>20.&nbsp;yours</p>

<p><strong>B&agrave;i 2:&nbsp;Điền&nbsp;v&agrave;o chỗ trống.</strong></p>

<p>1. This book is (you) ____.</p>

<p>2. The ball is (I) ____.</p>

<p>3. The blue car is (we) ____.</p>

<p>4. The ring is (she) ____.</p>

<p>5. We met Paul and Jane last night. This house is (they) ____.</p>

<p>6. The luggage is (he) ____.</p>

<p>7. The pictures are (she) ____.</p>

<p>8. In our garden is a bird. The nest is (it) ____.</p>

<p>9. This cat is (we) ____.</p>

<p>This was not my fault. It was (you) ____.</p>

<p><strong>Đ&aacute;p &aacute;n:</strong></p>

<p>1. This book is yours.</p>

<p>2. The ball is mine.</p>

<p>3. The blue car is ours.</p>

<p>4. The ring is hers.</p>

<p>5. We met Paul and Jane last night. This house is theirs.</p>

<p>6. The luggage is his.</p>

<p>7. The pictures are hers.</p>

<p>8. In our garden is a bird. The nest is its.</p>

<p>9. This cat is ours.</p>

<p>10. This was not my fault. It was yours.</p>

<p>Tr&ecirc;n đ&acirc;y m&igrave;nh đ&atilde; chia sẻ chi tiết về đại tự sở hữu, vị tr&iacute; v&agrave; c&aacute;ch sử dụng trong c&acirc;u. Ch&uacute;c bạn học tiếng Anh hiệu quả !</p>
', 'Tài liệu');


INSERT INTO `News` (`NewsTitle`, `NewsImageAddress`, `NewsDescription`, `NewsContent`, `NewsCategory`)
VALUES
('Top 10 trường Chuyên THPT tốt nhất Việt Nam', '/App/View/Source/Image/News/top-school.jpg', 'Chọn một môi trường học tập tốt trong những năm tháng Cấp 3 là tiền đề quan trọng cho sự phát triển tương lai của con em sau này. Sau đây là 10 tên trường Chuyên được gọi tên nhiều nhất về độ "hot" về chất lượng đầu ra.',
 '<p><strong>1. Trường THPT Hà N&ocirc;̣i &ndash; Amsterdam (H&agrave; Nội)</strong><br />
<br />
Trường THPT Hà N&ocirc;̣i &ndash; Amsterdam lu&ocirc;n nằm trong top đầu c&aacute;c trường cấp 3 tốt nhất ở H&agrave; Nội n&oacute;i ri&ecirc;ng v&agrave; cả nước n&oacute;i chung với những th&agrave;nh t&iacute;ch nổi bật:<br />
<br />
- Tỷ lệ đỗ Đại học của học sinh trường chuy&ecirc;n Hà N&ocirc;̣i &ndash; Amsterdam l&agrave; 95%.</p>

<p>- Nhiều học sinh được cấp học bổng học tập tại nước ngo&agrave;i.</p>

<p>- Nằm trong top dẫn đầu c&aacute;c kỳ thi học sinh giỏi th&agrave;nh phố, Quốc gia, Quốc tế.</p>

<p><strong>2. Trường THPT Chu Văn An (H&agrave; Nội)&nbsp;</strong></p>

<p>THPT Chu Văn An l&agrave; một trong những ng&ocirc;i trường l&acirc;u đời nhất của nước ta, được th&agrave;nh lập từ năm 1908 (tiền th&acirc;n l&agrave; trường Bưởi).Trải qua 113 năm với nhiều th&agrave;nh t&iacute;ch ấn tượng như:</p>

<p>- Nh&agrave; trường được c&ocirc;ng nhận l&agrave; Ng&ocirc;i trường sinh th&aacute;i Asean.</p>

<p>- Nhiều thế hệ học sinh đạt giải Học sinh giỏi Quốc gia, giải Nghi&ecirc;n cứu Khoa học Quốc gia, Quốc tế,...</p>

<p>- Trong năm học 2015 &ndash; 2016, nh&agrave; trường được Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo đ&atilde; tặng Bằng khen v&igrave; đ&atilde; c&oacute; th&agrave;nh t&iacute;ch xuất sắc trong phong tr&agrave;o thi đua giai đoạn 2010-2015.</p>

<p>- Trong kỳ thi chọn học sinh giỏi lớp 12 th&agrave;nh phố th&aacute;ng 9/2016, trường đ&atilde; c&oacute; 189 hs đạt giải, trong đ&oacute; c&oacute; 22 học sinh được tham dự kỳ thi chọn học sinh giỏi Quốc gia.</p>

<p><strong>3. Trường THPT Chuy&ecirc;n Khoa học tự nhi&ecirc;n- ĐH KHTN ( Đại học Quốc gia H&agrave; Nội)</strong><br />
<br />
Đ&acirc;y l&agrave; m&ocirc;i trường đ&agrave;o tạo h&agrave;ng đầu cho c&aacute;c em thi&ecirc;n về Khoa học Tự nhi&ecirc;n, trở th&agrave;nh c&aacute;i n&ocirc;i ph&aacute;t triển v&agrave; bồi dưỡng học sinh năng khiếu h&agrave;ng đầu của cả nước.<br />
<br />
Hiện tại, trường THPT Chuy&ecirc;n KHTN &ndash; ĐHQG Hà N&ocirc;̣i ch&iacute;nh l&agrave; ng&ocirc;i trường gi&agrave;u th&agrave;nh t&iacute;ch nhất Việt Nam về số lượng Huy chương cũng như giải thưởng đạt được trong c&aacute;c kỳ thi học sinh giỏi quốc gia, Olympic quốc tế v&agrave; khu vực.C&aacute;c khối chuy&ecirc;n của trường cũng lu&ocirc;n nằm trong top dẫn đầu 200 trường c&oacute; điểm trung b&igrave;nh thi đại học cao nhất Việt Nam.<br />
<br />
Nhiều năm trở lại đ&acirc;y lu&ocirc;n lọt v&agrave;o Top 5 trường THPT c&oacute; điểm thi đại học trung b&igrave;nh cao nhất cả nước (điểm trung b&igrave;nh khoảng 22 đến 25 điểm), với nhiều thủ khoa đạt 29, 30 điểm v&agrave;o c&aacute;c Trường Đại học h&agrave;ng đầu cả nước.</p>

<p>&nbsp;</p>

<p><strong><img alt="" src="https://static.ielts-fighter.com/uploads/2021/04/27/hinh-anh-15-2.png" style="height:351px; width:506px" /></strong></p>

<p><strong>4. Trường THPT Chuy&ecirc;n Đại học Sư phạm H&agrave; Nội</strong><br />
<br />
Được th&agrave;nh lập v&agrave;o năm 1966, ban đầu, trường l&agrave; nơi bồi dưỡng những học sinh Việt Nam xuất sắc về to&aacute;n học. Sau đ&oacute; mở rộng quy m&ocirc;. Trường l&agrave; cơ sở đ&agrave;o tạo đa lĩnh vực d&agrave;nh về: To&aacute;n Học, Vật L&yacute;,&hellip; v&agrave; Tiếng Anh.<br />
<br />
H&agrave;ng năm, trường nằm trong top đầu về điểm trung b&igrave;nh trong k&igrave; thi tuyển sinh đại học của Bộ Gi&aacute;o dục &amp; Đ&agrave;o tạo . Đ&atilde; c&oacute; rất nhiều học sinh đ&atilde; v&agrave; đang l&agrave; những c&aacute;n bộ cho To&aacute;n học v&agrave; ng&agrave;nh kh&aacute;c như: Đại sứ &ndash; Thứ trưởng Ngoại giao Đo&agrave;n Xu&acirc;n Hưng, Gi&aacute;o sư Tr&iacute; tuệ nh&acirc;n tạo Hồ T&uacute; Bảo, Viện ph&oacute; Viện H&agrave;n l&acirc;m Khoa học Nguyễn Đ&igrave;nh C&ocirc;ng,&hellip;<br />
<br />
<strong>5. Trường THPT Chuy&ecirc;n Phan Bội Ch&acirc;u ( Nghệ An)</strong><br />
<br />
L&agrave; một trong 2 trường Chuy&ecirc;n của tỉnh Nghệ An đặt tại Th&agrave;nh phố Vinh, trở th&agrave;nh c&aacute;i n&ocirc;i của bao thế hệ học sinh y&ecirc;u nước &ndash; hiếu học xưa v&agrave; nay.<br />
<br />
- Tỷ lệ đỗ đại học lu&ocirc;n đứng Top đầu cả nước, trong đ&oacute; phải kể đến nhiều năm nay lu&ocirc;n xuất hiện 100% học sinh trong một lớp đạt tr&ecirc;n 26 điểm thi đại học,..<br />
<br />
- Những cựu học sinh đ&atilde; mang về vinh dự cho trường phải kể đến như: Trần Thế Trung &ndash; Qu&aacute;n qu&acirc;n trận Chung kết Đường l&ecirc;n đỉnh Olympia năm 2019; Ho&agrave;ng Phan Hữu Đức &ndash; Huy chương Bạc Olympic Tin học Ch&acirc;u &Aacute; &ndash; Th&aacute;i B&igrave;nh Dương năm 2019; Trần Kh&aacute;nh Vy hot girl 7 thứ tiếng,...</p>

<p><br />
<img alt="" src="https://static.ielts-fighter.com/uploads/2021/04/27/totoantin-1.jpg" style="height:433px; width:600px" /></p>

<p><strong>6. Trường THPT chuy&ecirc;n L&ecirc; Hồng Phong ( Nam Định)</strong><br />
<br />
THPT chuy&ecirc;n L&ecirc; Hồng Phong với 100 năm truyền thống h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển đ&atilde; được Nh&agrave; nước Việt Nam trao tặng nhiều phần thưởng qu&yacute; gi&aacute;. V&agrave; được phong tặng danh hiệu &ldquo;Anh h&ugrave;ng Lao động thời k&igrave; đổi mới&rdquo;<br />
<br />
Nhiều cựu học sinh nổi tiếng đ&atilde; từng học ở nơi đ&acirc;y l&agrave;: Trường Chinh &ndash; Tổng b&iacute; thư Đảng Cộng sản Đ&ocirc;ng Dương, Chủ tịch hội đồng nh&agrave; nước; &ocirc;ng Mai Ch&iacute; Thọ &ndash; Bộ trưởng Bộ Nội vụ , Đại tướng c&ocirc;ng an nh&acirc;n d&acirc;n đầu ti&ecirc;n của Việt Nam.</p>

<p><strong>7. Trường THPT Chuy&ecirc;n Quốc học Huế (Huế)</strong><br />
<br />
Được th&agrave;nh lập v&agrave;o ng&agrave;y 23 th&aacute;ng 10 năm 1896. Đến nay, với hơn 120 năm lịch sử đến Quốc Học đ&atilde; l&agrave; nơi đ&agrave;o tạo ra nhiều thế hệ học sinh xuất sắc. Hiện nay, trường được ch&iacute;nh phủ Việt Nam lựa chọn để x&acirc;y dựng th&agrave;nh một trong ba trường phổ th&ocirc;ng trung học chất lượng cao của Việt Nam.<br />
<br />
Quốc Học Huế c&ograve;n l&agrave; nơi đ&agrave;o tạo những người nổi tiếng đ&atilde; từng theo học tại đ&acirc;y, đặc biệt đ&acirc;y l&agrave; nơi chủ tịch Hồ Ch&iacute; Minh đ&atilde; d&agrave;nh thời gian học tập.<br />
<br />
<strong>8. Trường Chuy&ecirc;n cấp 3 Lam Sơn (Thanh H&oacute;a)</strong><br />
<br />
Trường THPT chuy&ecirc;n Lam Sơn nằm ở th&agrave;nh phố Thanh H&oacute;a, tỉnh Thanh H&oacute;a. Đ&acirc;y l&agrave; một trong những trường trung học phổ th&ocirc;ng chuy&ecirc;n đầu ti&ecirc;n của cả nước v&agrave; duy nhất của tỉnh Thanh Ho&aacute;.<br />
<br />
Đ&atilde; c&oacute; rất nhiều th&iacute; sinh của chương tr&igrave;nh &rdquo; Đường l&ecirc;n đỉnh Olympia&rdquo; đến từ ng&ocirc;i trường n&agrave;y . V&agrave; cũng c&oacute; rất nhiều người ở vị tr&iacute; quan trọng của bộ, ban, ng&agrave;nh từng l&agrave; học sinh nơi đ&acirc;y. Như: Nguyễn Dy Ni&ecirc;n- Uỷ vi&ecirc;n Trung ương Đảng Cộng sản Việt Nam, Bộ trưởng Bộ Ngoại giao ch&iacute;nh phủ nước CHXHCN Việt Nam,&hellip;<br />
<br />
<strong>9. THPT chuy&ecirc;n L&ecirc; Hồng Phong (TP.HCM)</strong><br />
<br />
Cũng c&ugrave;ng mang t&ecirc;n vị Tổng b&iacute; thư L&ecirc; Hồng Phong, nhưng ng&ocirc;i trường kiến tr&uacute;c cổ điển kiếu Ph&aacute;p.<br />
<br />
Với tr&ecirc;n 3/4 thế kỷ th&agrave;nh lập. L&ecirc; Hồng Phong năm nay tr&ograve;n 90 tuổi - trở th&agrave;nh niềm ki&ecirc;u h&atilde;nh v&agrave; tự h&agrave;o, niềm mơ ước của h&agrave;ng triệu học sinh.</p>

<p>Từ m&aacute;i trường n&agrave;y đ&atilde; c&oacute; những người trở th&agrave;nh nguy&ecirc;n thủ quốc gia, nh&agrave; hoạt động c&aacute;ch mạng, tướng giỏi, nh&agrave; văn, nh&agrave; thơ, nhạc sĩ, ca sĩ, doanh nh&acirc;n th&agrave;nh đạt...trong đ&oacute;, đ&aacute;ng ch&uacute; &yacute; l&agrave; cả hai vị Chủ Tịch nước Nguyễn Minh Triết v&agrave; Trương Tấn Sang đều l&agrave; cựu học sinh của trường.</p>

<p><br />
<img alt="" src="https://static.ielts-fighter.com/uploads/2021/04/27/t%E1%BA%A3i%20xu%E1%BB%91ng%20(1).jpg" style="height:165px; width:305px" /></p>

<p><strong>10. Trường Chuy&ecirc;n cấp 3 H&ugrave;ng Vương (Ph&uacute; Thọ)</strong><br />
<br />
Tọa lạc tại v&ugrave;ng đất Tổ, trường chuy&ecirc;n cấp 3 H&ugrave;ng Vương được ch&iacute;nh thức th&agrave;nh lập v&agrave;o ng&agrave;y 22/8/1986 . Th&aacute;ng 9/1994, trường chuyển từ Thị x&atilde; Ph&uacute; Thọ về TP. Việt Tr&igrave; v&agrave; cố định cho tới nay.<br />
<br />
Với bề d&agrave;y kinh nghiệm của gi&aacute;o vi&ecirc;n, sự năng động của sinh vi&ecirc;n.&nbsp;Đến nay, THPT H&ugrave;ng Vương đ&atilde; mang đến những nh&acirc;n t&agrave;i với những giải thưởng trong v&agrave; ngo&agrave;i nước như: Nguyễn Thu&yacute; Hằng &ndash; Huy chương đồng H&oacute;a học quốc tế lần thứ 47 tổ chức tại Cộng ho&agrave; Azerbaijan(2015),&hellip;</p>

<p>Đ&acirc;y cũng l&agrave; trường trung học phổ th&ocirc;ng duy nhất trong cả nước tổ chức th&agrave;nh c&ocirc;ng cuộc thi s&aacute;ng tạo Robot d&agrave;nh cho học sinh phổ th&ocirc;ng.</p>

<p>Nh&agrave; trường đ&atilde; đ&oacute;n c&aacute;c nh&acirc;n vật l&atilde;nh đạo Đảng Cộng sản v&agrave; ch&iacute;nh phủ Việt Nam về thăm l&agrave;: nguy&ecirc;n Ph&oacute; chủ tịch nước Nguyễn Thị B&igrave;nh, Bộ trưởng Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo Nguyễn Thiện Nh&acirc;n&hellip;</p>

<p><br />
Hy vọng với 10 trường chuy&ecirc;n cấp 3 tốt nhất Việt Nam vừa kể tr&ecirc;n, c&aacute;c bạn đ&atilde; sẽ lựa chọn cho m&igrave;nh ng&ocirc;i trường y&ecirc;u th&iacute;ch. Ch&uacute;c bạn sẽ c&oacute; những b&agrave;i học bổ &iacute;ch cũng như những kỉ niệm đẹp thời học sinh.</p>
', 'Tin tức');


INSERT INTO `News` (`NewsTitle`, `NewsImageAddress`, `NewsDescription`, `NewsContent`, `NewsCategory`)
VALUES
('9 website tự học và rèn luyện bài tập ngữ pháp IELTS cực hay', '/App/View/Source/Image/News/english-websites.jpg', 'Học IELTS tại nhà gặp khá nhiều khó khăn từ từ vựng đến ngữ pháp. Trong đó, ngữ pháp cần phải rèn luyện thường xuyên để nhớ và viết "cứng tay" hơn. Sau đây là 9 website dưới đây sẽ giúp các bạn phần nào khi tự học tại nhà nhé.',
 '<h3><strong>1. Grammarly</strong></h3>

<p><strong>[&nbsp;<a href="https://www.grammarly.com/">https://www.grammarly.com</a>&nbsp;]</strong></p>

<p>Chắc hẳn với những bạn n&agrave;o&nbsp;<a href="https://ielts-fighter.com/tin-tuc/Lo-trinh-hoc-Ielts-online-level-5-0-cho-nguoi-moi-bat-dau_mt1462866581.html" target="_blank" title="Lộ trình tự học IELTS">tự học IELTS</a>, đặc biệt t&igrave;m hiểu về Writing th&igrave; đều quen thuộc với trang web n&agrave;y. Bởi đ&acirc;y l&agrave; trang phổ biến được nhiều người học tin tưởng để check lỗi ngữ ph&aacute;p, từ vựng.</p>

<p>Tuy nhi&ecirc;n, bạn c&oacute; biết, trang n&agrave;y cũng cung cấp c&aacute;c b&agrave;i học ngữ ph&aacute;p cực chất. Khi v&agrave;o trang chủ, bạn k&eacute;o xuống ch&acirc;n trang, ở phần&nbsp;Services sẽ c&oacute; mục Handbook (<a href="https://www.grammarly.com/blog/category/handbook/">https://www.grammarly.com/blog/category/handbook/</a>).&nbsp;</p>

<p>Khi click v&agrave;o đ&acirc;y, bạn sẽ thấy&nbsp;c&aacute;c b&agrave;i học ngữ ph&aacute;p v&agrave; từ vựng được cung cấp đầy đủ, chỉ cần học th&ocirc;i. C&aacute;c b&agrave;i c&oacute; cả b&agrave;i tập, &ocirc;n luyện mỗi ng&agrave;y. Sau khi cứng ngữ ph&aacute;p, bạn viết đoạn văn v&agrave; check lu&ocirc;n bằng c&ocirc;ng cụ check lỗi l&agrave; ok rồi.</p>

<p><img alt="" src="http://static.ielts-fighter.com/uploads/2018/08/06/9-web-tu-hoc-ngu-phap-ielts-mien-phi-1.png" style="height:472px; width:800px" />&nbsp;</p>

<h3><strong>2. EnglishGrammar.org</strong></h3>

<p>[&nbsp;<strong><a href="http://www.englishgrammar.org/">http://www.englishgrammar.org/</a>&nbsp;</strong>]</p>

<p>Trang n&agrave;y l&agrave; địa chỉ học&nbsp;<a href="https://ielts-fighter.com/tin-tuc/Tong-hop-tai-lieu-ngu-phap-tieng-Anh-co-bai-tap-chi-tiet_mt1576099094.html" target="_blank" title="ngữ pháp tiếng Anh">ngữ ph&aacute;p tiếng Anh</a>&nbsp;được nhiều người y&ecirc;u th&iacute;ch lựa chọn. C&aacute;c b&agrave;i học được ph&acirc;n chia chủ điểm r&otilde; r&agrave;ng, ph&acirc;n t&iacute;ch đầy đủ c&aacute;c cấu tr&uacute;c v&agrave; c&oacute; b&agrave;i tập để bạn r&egrave;n luyện ngay mỗi ng&agrave;y.</p>

<p>C&aacute;c b&agrave;i học cũng được cập nhật thường xuy&ecirc;n n&ecirc;n c&aacute;c bạn lu&ocirc;n c&oacute; b&agrave;i mới để học. B&ecirc;n cạnh đ&oacute;, những bản t&agrave;i liệu được chia sẻ thường xuy&ecirc;n. Trang cũng c&oacute; phần chữa ngữ ph&aacute;p n&ecirc;n c&aacute;c bạn sẽ được so&aacute;t lỗi miễn ph&iacute;.</p>

<p>&nbsp;<img alt="EnglishGrammar.org" src="http://static.ielts-fighter.com/uploads/2018/08/06/9-web-tu-hoc-ngu-phap-ielts-mien-phi-2.png" style="height:432px; width:800px" /></p>

<h3><strong>3.&nbsp; Grammarics</strong></h3>

<p><strong>[&nbsp;<a href="http://www.grammarics.com/">http://www.grammarics.com/</a>&nbsp;]</strong></p>

<p>Đ&acirc;y cũng l&agrave; check ngữ ph&aacute;p quen thuộc. Bạn c&oacute; thể vừa học ngữ ph&aacute;p, từ vựng v&agrave; check lỗi với trang n&agrave;y tương tự Grammarly ph&iacute;a tr&ecirc;n.</p>

<p>C&aacute;c b&agrave;i học ở đ&acirc;y th&uacute; vị với tranh, c&oacute; sự so s&aacute;nh kh&aacute;c nhau giữa c&acirc;u đ&uacute;ng v&agrave; c&acirc;u sai...để c&aacute;c bạn r&egrave;n luyện c&aacute;c sử dụng từ, c&acirc;u, viết c&acirc;u thế n&agrave;o cho hay...Điều n&agrave;y sẽ gi&uacute;p bạn học tập th&uacute; vị hơn nhiều nha.</p>

<p><img alt="Grammarics" src="http://static.ielts-fighter.com/uploads/2018/08/06/9-web-tu-hoc-ngu-phap-ielts-mien-phi-3.png" style="height:449px; width:800px" />&nbsp;</p>

<h3><strong>4. English Grammar Secrets</strong></h3>

<p>[&nbsp;<strong><a href="http://www.englishgrammarsecrets.com/">http://www.englishgrammarsecrets.com/</a></strong>&nbsp;]</p>

<p>Một web ngữ ph&aacute;p được chia theo c&aacute;c th&igrave;, c&aacute;c c&acirc;u hỏi thường gặp rất đơn giản để luyện tập free. Tuy rằng trang kh&ocirc;ng c&oacute; check ngữ ph&aacute;p c&aacute;c b&agrave;i kh&aacute;c ngo&agrave;i những chủ điểm bạn đ&atilde; học tuy nhi&ecirc;n, r&egrave;n luyện ngữ ph&aacute;p thường xuy&ecirc;n tr&ecirc;n đ&acirc;y cũng rất hay ho đấy nha.</p>

<p><img alt="English Grammar Secrets" src="http://static.ielts-fighter.com/uploads/2018/08/06/9-web-tu-hoc-ngu-phap-ielts-mien-phi-4.png" style="height:463px; width:800px" /></p>

<h3><strong>5. Grammar - quizzes</strong></h3>

<p><strong>[&nbsp;<a href="https://www.grammar-quizzes.com/">https://www.grammar-quizzes.com</a>&nbsp;]</strong></p>

<p>Nguồn từ vựng phong ph&uacute;, c&aacute;c b&agrave;i học được minh họa v&agrave; ph&acirc;n t&iacute;ch kỹ lưỡng gi&uacute;p bạn học tập vui th&iacute;ch hơn. Sau c&aacute;c b&agrave;i học, bạn sẽ được r&egrave;n luyện với b&agrave;i tập v&agrave; chấm điểm.</p>

<p>Những b&agrave;i học ph&acirc;n chia r&otilde;, bạn check lỗi mỗi lần v&agrave; tự n&acirc;ng cao nền tảng ngữ ph&aacute;p của bản th&acirc;n. Trang n&agrave;y kh&aacute; đơn giản nhưng học tập kh&aacute; th&uacute; vị đấy c&aacute;c bạn ạ.</p>

<p><img alt="Grammar - quizzes" src="http://static.ielts-fighter.com/uploads/2018/08/06/9-web-tu-hoc-ngu-phap-ielts-mien-phi-5.png" style="height:456px; width:800px" /></p>

<h3>6. Perfect English Grammar</h3>

<p>[&nbsp;<strong><a href="http://www.perfect-english-grammar.com/">http://www.perfect-english-grammar.com/</a></strong>&nbsp;]</p>

<p>Trang n&agrave;y được dạy bởi một gi&aacute;o vi&ecirc;n bản xứ với hệ thống c&aacute;c b&agrave;i học được thực hiện online h&agrave;ng ng&agrave;y. Bạn c&oacute; thể học miễn ph&iacute; hoặc chọn kh&oacute;a học online ph&ugrave; hợp với bản th&acirc;n. C&ocirc; gi&aacute;o sẽ hướng dẫn bạn c&aacute;ch l&agrave;m chủ ngữ ph&aacute;p thuận lợi hơn.&nbsp;</p>

<p>&nbsp;<img alt="Perfect English Grammar" src="http://static.ielts-fighter.com/uploads/2018/08/06/9-web-tu-hoc-ngu-phap-ielts-mien-phi-6.png" style="height:428px; width:800px" /></p>

<h3><strong>7. Your Dictionary</strong></h3>

<p><strong>[&nbsp;<a href="http://grammar.yourdictionary.com/">http://grammar.yourdictionary.com/</a>&nbsp;]</strong></p>

<p>Học từ vựng v&agrave; ngữ ph&aacute;p dễ d&agrave;ng theo c&aacute;c b&agrave;i học được ph&acirc;n chia tỉ mỉ, c&aacute;c bạn sẽ dễ nắm vững được nhiều kiến thức hơn. Nếu chỉ băn khoăn về một cấu tr&uacute;c, từ vựng n&agrave;o, bạn c&oacute; thể tra ngay bởi web hoạt động như tra từ điển vậy đ&oacute;.</p>

<p>Ngo&agrave;i ra, những tip được chia sẻ khi học ngữ ph&aacute;p sẽ rất hay để bạn vận dụng, học nhanh, nhớ l&acirc;u nghen.</p>

<p><img alt="Your Dictionary" src="http://static.ielts-fighter.com/uploads/2018/08/06/9-web-tu-hoc-ngu-phap-ielts-mien-phi-7.png" style="height:442px; width:800px" /></p>

<h3><strong>8. English grammar exercises by Kaplan</strong></h3>

<p>[&nbsp;<strong><a href="http://www.kaplaninternational.com/blog/category/english-grammar-exercises">http://www.kaplaninternational.com/blog/category/english-grammar-exercises</a></strong>&nbsp;]</p>

<p>Đ&acirc;y l&agrave; blog nhưng giống website tự học tiếng Anh, cũng chia th&agrave;nh nhiều chủ điểm kh&aacute;c nhau. C&aacute;c chia sẻ hữu &iacute;ch từ gi&aacute;o vi&ecirc;n c&oacute; kinh nghiệm l&acirc;u năm giảng dạy n&ecirc;n c&aacute;c bạn dễ nắm vững cấu tr&uacute;c v&agrave; học tập.</p>

<p>C&oacute; thể bạn sẽ kh&ocirc;ng được chữa b&agrave;i thường xuy&ecirc;n nhưng với những tip được chia sẻ sẽ rất th&uacute; vị để &ocirc;n luyện nh&eacute;!</p>

<p><img alt="English grammar exercises by Kaplan" src="http://static.ielts-fighter.com/uploads/2018/08/06/9-web-tu-hoc-ngu-phap-ielts-mien-phi-8.png" style="height:410px; width:800px" /></p>

<h3><strong>9. English Test Store</strong></h3>

<p><strong>[&nbsp;<a href="https://englishteststore.net/">https://englishteststore.net/</a>&nbsp;]</strong></p>

<p>Mặc d&ugrave; kh&ocirc;ng chuy&ecirc;n biệt về IELTS nhưng những b&agrave;i học ngữ ph&aacute;p tại trang n&agrave;y đều rất tỉ mỉ v&agrave; dễ học. Khi v&agrave;o trang, bạn nhấn chọn Grammar Test để học ngữ ph&aacute;p v&agrave; l&agrave;m b&agrave;i tập.</p>

<p>Nếu muốn tham khảo th&ecirc;m học tập những kỹ năng kh&aacute;c, bạn cũng c&oacute; thể click c&aacute;c phần mục kh&aacute;c nh&eacute;. V&igrave; học&nbsp;IELTS n&oacute;i chung vẫn l&agrave; học tiếng Anh m&agrave;!</p>

<p><img alt="English Test Store" src="http://static.ielts-fighter.com/uploads/2018/08/06/9-web-tu-hoc-ngu-phap-ielts-mien-phi-9.png" style="height:439px; width:800px" /></p>

<p>Tr&ecirc;n đ&acirc;y l&agrave;&nbsp;9 website gi&uacute;p bạn học ngữ ph&aacute;p tốt, h&atilde;y tham khảo nh&eacute;!</p>
', 'Mẹo vặt');


INSERT INTO `News` (`NewsTitle`, `NewsImageAddress`, `NewsDescription`, `NewsContent`, `NewsCategory`)
VALUES
('Cách học ngoại ngữ của người thạo ba thứ tiếng', '/App/View/Source/Image/News/way-learning-language.webp', 'Tôi không tham gia bất cứ khóa học ngôn ngữ nào mà hoàn toàn để trải nghiệm tự nhiên dẫn dắt quá trình học của bản thân. Dưới đây là phương pháp tự học bốn kỹ năng nghe, nói, đọc, viết do tôi đúc kết từ trải nghiệm của mình',
 '<p dir="ltr"><strong>1. Kỹ năng nghe</strong></p>

<p dir="ltr">Trong học ngoại ngữ, t&ocirc;i tin rằng kỹ năng nghe l&agrave; ưu ti&ecirc;n số một. Hầu hết mọi người cho rằng nh&oacute;m kỹ năng giao tiếp (gồm nghe v&agrave; n&oacute;i) quan trọng hơn nh&oacute;m đọc viết (đọc hiểu v&agrave; viết). Bằng c&aacute;ch lắng nghe, người học c&oacute; thể thu thập dữ liệu về từ vựng, ph&aacute;t &acirc;m, cấu tr&uacute;c c&acirc;u để sử dụng trong việc luyện n&oacute;i hoặc học ngữ ph&aacute;p. Bạn c&oacute; thể tham khảo một số c&aacute;ch để đ&ocirc;i tai l&agrave;m quen với ngoại ngữ như sau.</p>

<p dir="ltr">Xem TV: C&aacute;c chương tr&igrave;nh tr&ecirc;n TV như tr&ograve; chơi truyền h&igrave;nh, phim ảnh, tin tức l&agrave; nguồn tiếp cận ngoại ngữ dễ d&agrave;ng, đơn giản nhất nhưng nguồn th&ocirc;ng tin thu về rất hữu &iacute;ch, phong ph&uacute;, đủ sức thỏa lấp &quot;cơn kh&aacute;t ngoại ngữ&quot; của bạn. Xem TV, bạn kh&ocirc;ng chỉ tiếp nhận &acirc;m thanh m&agrave; c&oacute; thể chứng kiến c&aacute;ch người bản ngữ di chuyển cơ miệng, cử chỉ, biểu cảm. Từ đ&oacute;, bạn n&ecirc;n m&ocirc; phỏng theo họ trong qu&aacute; tr&igrave;nh luyện tập sau n&agrave;y để việc sử dụng ng&ocirc;n ngữ trau chuốt, tự nhi&ecirc;n hơn. H&atilde;y bắt đầu theo tr&igrave;nh độ từ thấp đến cao. Nếu l&agrave; người mới bắt đầu, bạn n&ecirc;n xem c&aacute;c chương tr&igrave;nh k&egrave;m phụ đề rồi dần tho&aacute;t ly khi kiến thức vững v&agrave;ng hơn.</p>

<p dir="ltr">Nghe radio: Nguồn t&agrave;i liệu như radio sẽ ph&ugrave; hợp với những người c&oacute; tr&igrave;nh độ trung cấp trở l&ecirc;n v&igrave; tr&ecirc;n đ&agrave;i ph&aacute;t thanh, MC sẽ n&oacute;i chuyện nhanh hơn, về những chủ đề học thuật như văn h&oacute;a, ch&iacute;nh trị, t&ocirc;n gi&aacute;o. Đặc biệt, v&igrave; bạn kh&ocirc;ng thể nh&igrave;n c&aacute;ch họ di chuyển cơ miệng hoặc sử dụng phụ đề n&ecirc;n việc đo&aacute;n nghĩa sẽ kh&oacute; khăn hơn. Một nguồn nghe hữu &iacute;ch kh&aacute;c l&agrave; podcasts, tương tự như radio, nhưng c&oacute; nhiều lựa chọn d&agrave;nh cho tr&igrave;nh độ yếu, trung b&igrave;nh hoặc c&aacute;c b&agrave;i học ngoại ngữ m&agrave; bạn c&oacute; thể tham khảo.</p>

<p dir="ltr">&Acirc;m nhạc: Thực tế, việc học ngoại ngữ qua nghe nhạc l&agrave; hoạt động được chăng hay chớ, nghĩa l&agrave; hiệu quả với một số người v&agrave; kh&ocirc;ng ph&ugrave; hợp với số kh&aacute;c. V&igrave; khi h&aacute;t, ca sĩ thường luyến l&aacute;y c&aacute;c &acirc;m n&ecirc;n bạn kh&oacute; c&oacute; thể tiếp cận c&aacute;ch ph&aacute;t &acirc;m chuẩn x&aacute;c. Nhưng về cơ bản, &acirc;m nhạc sẽ k&iacute;ch th&iacute;ch nguồn cảm hứng gi&uacute;p bạn duy tr&igrave; động lực học tập d&agrave;i hơi.</p>

<p><img alt="Ảnh: Moneycrashers." src="https://i1-vnexpress.vnecdn.net/2020/03/15/learn-a-new-language-flags-106-9510-7168-1584273231.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Km1VFX7YHpjIRxiGmYWJDg" /></p>

<p>Ảnh:&nbsp;<em>Moneycrashers.</em></p>

<p dir="ltr"><strong>2. Kỹ năng n&oacute;i</strong></p>

<p dir="ltr">Rất nhiều người học ngoại ngữ đặt kỹ năng n&oacute;i l&agrave; ưu ti&ecirc;n h&agrave;ng đầu nhưng t&ocirc;i kh&ocirc;ng đồng &yacute; với quan điểm n&agrave;y. N&oacute;i l&agrave; kỹ năng chủ động, trong khi nghe l&agrave; thụ động, giống như hai mặt của đồng xu. Nghe sẽ gi&uacute;p người học x&acirc;y dựng t&agrave;i liệu học trong khi n&oacute;i sẽ sử dụng nguồn t&agrave;i liệu n&agrave;y để luyện tập, biến n&oacute; trở th&agrave;nh của c&aacute; nh&acirc;n. V&igrave; thế, sau hoạt động nghe, người học cần tiếp tục luyện tập kỹ năng n&oacute;i dựa tr&ecirc;n th&ocirc;ng tin thu thập được.</p>

<p dir="ltr">Ứng dụng luyện n&oacute;i: Hiện nay rất nhiều ứng dụng luyện n&oacute;i c&ugrave;ng bạn b&egrave; quốc tế hoặc người bản xứ, l&agrave; cơ hội gi&uacute;p bạn thực h&agrave;nh cuộc hội thoại thực tế. Bạn c&oacute; thể sử dụng trang web Conversationexchange, ứng dụng Cambly, iTalki. Những ứng dụng học ngoại ngữ trực tuyến giống như sự trao đổi, giao thoa văn h&oacute;a. H&atilde;y thoải m&aacute;i khi tr&ograve; chuyện với những người bạn qua video, đừng sợ rằng họ đang dạy bạn bởi biết đ&acirc;u họ cũng đang t&ograve; m&ograve; về ng&ocirc;n ngữ mẹ đẻ của bạn v&agrave; mong muốn được chỉ dẫn.</p>

<p dir="ltr">Tr&ograve; chuyện thực tế: Nếu địa phương bạn đang sống l&agrave; th&agrave;nh phố du lịch hoặc c&oacute; c&acirc;u lạc bộ trao đổi ng&ocirc;n ngữ, đừng bỏ lỡ cơ hội n&agrave;y để luyện n&oacute;i trực tiếp. Việc luyện n&oacute;i trực tiếp c&oacute; thể gi&uacute;p bạn gia tăng tự tin, ứng xử linh hoạt với nhiều t&igrave;nh huống thực tế.</p>

<p dir="ltr"><strong>3. Kỹ năng đọc</strong></p>

<p dir="ltr">Kỹ năng đọc viết tương đối kh&aacute;c biệt với nghe n&oacute;i nhưng kh&ocirc;ng đồng nghĩa ch&uacute;ng kh&ocirc;ng li&ecirc;n quan. Chẳng hạn, bạn c&oacute; thể học từ mới th&ocirc;ng qua việc đọc. So với viết, bạn sẽ phải đọc nhiều hơn, nhưng đừng lo lắng. Với một số phương ph&aacute;p học cụ thể, tr&igrave;nh độ đọc của bạn sẽ được cải thiện đ&aacute;ng kể.</p>

<p dir="ltr">Đọc s&aacute;ch: Tất nhi&ecirc;n, khi nhắc đến luyện đọc, kh&ocirc;ng t&agrave;i liệu n&agrave;o gi&aacute; trị v&agrave; phong ph&uacute; hơn những cuốn s&aacute;ch. Nếu l&agrave; người mới bắt đầu, bạn c&oacute; thể đọc truyện tranh, s&aacute;ch thiếu nhi, bộ Bookworm hoặc đọc bản ngoại văn của những cuốn s&aacute;ch y&ecirc;u th&iacute;ch đến mức thuộc l&ograve;ng. T&ocirc;i thi&ecirc;n về lựa chọn đọc ngoại văn cuốn s&aacute;ch y&ecirc;u th&iacute;ch hơn l&agrave; s&aacute;ch truyện thiếu nhi v&igrave; bạn c&oacute; thể học từ vựng nhanh hơn, hiểu r&otilde; nghĩa của từ, c&acirc;u trong bối cảnh bạn đ&atilde; nằm l&ograve;ng. Ở tr&igrave;nh độ ngoại ngữ cao hơn, bạn c&oacute; thể lựa chọn s&aacute;ch theo chủ đề y&ecirc;u th&iacute;ch, s&aacute;ch nằm trong danh s&aacute;ch b&aacute;n chạy nhất, t&aacute;c phẩm kinh điển. Khi đọc, bạn c&oacute; thể kết hợp với n&oacute;i gi&uacute;p ghi nhớ những từ mới nhanh ch&oacute;ng hơn.</p>

<p dir="ltr">Wikipedia hoặc Wikitravel: Hai trang web n&agrave;y cung cấp h&agrave;ng ngh&igrave;n b&agrave;i viết ở mọi chủ đề, với dung lượng ngắn hơn s&aacute;ch rất nhiều lần, ph&ugrave; hợp với những người học kh&ocirc;ng c&oacute; nhiều thời gian đọc s&aacute;ch. Bạn c&oacute; thể lựa chọn chủ đề y&ecirc;u th&iacute;ch, đọc phi&ecirc;n bản ngoại ngữ rồi quay sang đọc bản dịch tiếng mẹ đẻ v&agrave; học được h&agrave;ng t&aacute; từ mới th&uacute; vị.</p>

<p dir="ltr">T&agrave;i liệu học thuật: Khi kỹ năng đọc đ&atilde; được cải thiện, bạn c&oacute; thể đặt ra những mục ti&ecirc;u cao hơn v&agrave; học th&ecirc;m từ vựng học thuật bằng c&aacute;ch đọc t&agrave;i liệu tr&igrave;nh độ cao. Bạn c&oacute; thể t&igrave;m đọc một số tờ b&aacute;o chuy&ecirc;n ng&agrave;nh, nguồn t&agrave;i liệu học thuật như&nbsp;<em>The Atlantic, The Economist, Slate.</em></p>

<p dir="ltr"><strong>4. Kỹ năng viết</strong></p>

<p dir="ltr">Đối với t&ocirc;i, kỹ năng viết lu&ocirc;n l&agrave; kh&oacute; nhất v&agrave; đ&ograve;i hỏi phải ki&ecirc;n tr&igrave; như việc tập thể dục. Nhưng may mắn thay thế giới c&ocirc;ng nghệ hiện nay đ&atilde; cho ch&uacute;ng ta nhiều cơ hội hơn để r&egrave;n luyện.</p>

<p dir="ltr">Mạng x&atilde; hội: H&atilde;y tận dụng ngay ứng dụng nhắn tin Messenger, Facebook hay Twitter để đăng b&agrave;i viết hoặc tr&ograve; chuyện với người bản ngữ bằng ng&ocirc;n ngữ bạn đang học. Th&ocirc;ng qua mạng x&atilde; hội ảo, bạn sẽ bớt lo lắng hơn khi tr&ograve; chuyện với mọi người cũng kh&ocirc;ng cảm thấy qu&aacute; xấu hổ nếu được mọi người sửa lỗi.</p>

<p dir="ltr">Viết tự do: Khi học ngoại ngữ, bạn kh&ocirc;ng nhất thiết phải viết theo chủ đề nhất định. Bạn c&oacute; thể luyện tập dần dần bằng c&aacute;ch viết theo cảm x&uacute;c, suy nghĩ của bạn. Khi học tiếng H&agrave; Lan, t&ocirc;i bắt đầu với việc viết danh s&aacute;ch nhu yếu phẩm cần mua, việc cần l&agrave;m hoặc lời nhắn. Nhiều bạn b&egrave; của t&ocirc;i h&igrave;nh th&agrave;nh th&oacute;i quen viết nhật k&yacute; bằng tiếng H&agrave; Lan. Khi tr&igrave;nh độ đ&atilde; cải thiện hơn, t&ocirc;i thử viết b&agrave;i b&aacute;o nhỏ, suy nghĩ trong ng&agrave;y, chủ yếu để h&igrave;nh th&agrave;nh th&oacute;i quen r&egrave;n luyện viết.</p>
', 'Kinh nghiệm');