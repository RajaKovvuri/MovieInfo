CREATE TABLE [dbo].[MovieRating] (
    [Id]      INT IDENTITY (1, 1) NOT NULL,
    [MovieId] INT NOT NULL,
    [UserId]  INT NOT NULL,
    [Rating]  INT NOT NULL,
    CONSTRAINT [PK_MovieRating] PRIMARY KEY CLUSTERED ([Id] ASC)
);

