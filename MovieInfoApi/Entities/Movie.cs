using System;
using System.Collections.Generic;

#nullable disable

namespace MovieInfoApi.Entities
{
    public partial class Movie
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public int YearOfRelease { get; set; }
        public string Genres { get; set; }
        public int RunningTime { get; set; }
    }
}
