using MovieInfoApi.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MovieInfoApi.DTO
{
    public class MovieResponse : Movie
    {
        public decimal AverageRating { get; set; }
    }
}
