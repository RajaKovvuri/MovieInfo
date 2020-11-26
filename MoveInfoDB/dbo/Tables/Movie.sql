CREATE TABLE [dbo].[Movie] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [Title]         VARCHAR (1000) NOT NULL,
    [YearOfRelease] INT            NOT NULL,
    [Genres]        VARCHAR (2000) NOT NULL,
    [RunningTime]   INT            NOT NULL,
    CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED ([Id] ASC)
);

