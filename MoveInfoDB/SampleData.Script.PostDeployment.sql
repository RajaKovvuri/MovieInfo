/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
--USE [MovieInfo]
--GO
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (1, N'U', 1980, N'Romance', 60)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (2, N'M', 1994, N'Comedy', 150)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (3, N'A', 2020, N'Romance', 200)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (4, N'Zack and Miri Make a Porno', 2008, N'Romance', 70)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (5, N'Youth in Revolt', 2010, N'Comedy', 52)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (6, N'You Will Meet a Tall Dark Stranger', 2010, N'Comedy', 35)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (7, N'When in Rome', 2010, N'Comedy', 44)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (8, N'What Happens in Vegas', 2008, N'Comedy', 72)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (9, N'Water For Elephants', 2011, N'Drama', 72)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (10, N'WALL-E', 2008, N'Animation', 89)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (11, N'Waitress', 2007, N'Romance', 67)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (12, N'Waiting For Forever', 2011, N'Romance', 53)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (13, N'Valentine''s Day', 2010, N'Comedy', 54)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (14, N'Tyler Perry''s Why Did I get Married', 2007, N'Romance', 47)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (15, N'Twilight: Breaking Dawn', 2011, N'Romance', 68)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (16, N'Twilight', 2008, N'Romance', 82)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (17, N'The Ugly Truth', 2009, N'Comedy', 68)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (18, N'The Twilight Saga: New Moon', 2009, N'Drama', 78)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (19, N'The Time Traveler''s Wife', 2009, N'Drama', 65)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (20, N'The Proposal', 2009, N'Comedy', 74)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (21, N'The Invention of Lying', 2009, N'Comedy', 47)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (22, N'The Heartbreak Kid', 2007, N'Comedy', 41)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (23, N'The Duchess', 2008, N'Drama', 68)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (24, N'The Curious Case of Benjamin Button', 2008, N'Fantasy', 81)
INSERT [dbo].[Movie] ([Id], [Title], [YearOfRelease], [Genres], [RunningTime]) VALUES (25, N'The Back-up Plan', 2010, N'Comedy', 47)
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieRating] ON 

INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (1, 7, 1, 4)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (2, 8, 1, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (3, 9, 1, 1)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (4, 10, 1, 2)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (5, 11, 1, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (6, 12, 1, 4)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (7, 13, 1, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (8, 14, 1, 1)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (9, 15, 1, 2)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (10, 16, 1, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (11, 17, 1, 4)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (12, 18, 1, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (13, 19, 1, 1)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (14, 20, 1, 2)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (15, 21, 1, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (16, 22, 1, 4)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (17, 23, 1, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (18, 24, 1, 1)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (19, 25, 1, 2)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (20, 1, 1, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (21, 2, 1, 4)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (22, 3, 1, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (23, 7, 2, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (24, 8, 2, 1)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (25, 9, 2, 2)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (26, 10, 2, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (27, 11, 2, 4)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (28, 12, 2, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (29, 13, 2, 1)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (30, 14, 2, 2)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (31, 15, 2, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (32, 16, 2, 4)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (33, 17, 2, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (34, 18, 2, 1)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (35, 19, 2, 2)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (36, 20, 2, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (37, 21, 2, 4)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (38, 22, 2, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (39, 23, 2, 1)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (40, 24, 2, 2)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (41, 25, 2, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (42, 1, 2, 4)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (43, 2, 2, 5)
INSERT [dbo].[MovieRating] ([Id], [MovieId], [UserId], [Rating]) VALUES (44, 3, 2, 5)
SET IDENTITY_INSERT [dbo].[MovieRating] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email]) VALUES (1, N'Raj', N'Kovvuri', N'Raj2k@live.com')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email]) VALUES (2, N'Sekhar', N'Kovvuri', N'test@test.com')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email]) VALUES (3, N'Reddy', N'K', N'Test@test.com')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
