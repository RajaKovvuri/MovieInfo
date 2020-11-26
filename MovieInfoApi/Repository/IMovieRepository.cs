using MovieInfoApi.Entities;
using MovieInfoApi.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MovieInfoApi.Repository
{
    public interface IMovieRepository
    {
         Task<List<MovieResponse>> GetMoviesByCriteria(String title = null, Int64? year = 0, String genere = null);
        Task<List<MovieResponse>> GetTopMovies(int numberOfMovies);
         Task<List<MovieResponse>> GetTopMoviesByUserRating(int numberOfMovies,int userId);
         Task<int> SaveRating(MovieRating rating);
    }
}
