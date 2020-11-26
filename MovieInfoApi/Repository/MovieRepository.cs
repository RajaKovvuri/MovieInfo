using Microsoft.EntityFrameworkCore;
using MovieInfoApi.DTO;
using MovieInfoApi.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace MovieInfoApi.Repository
{
    public class MovieRepository : IMovieRepository
    {
        Movies_DBContext _context;
        public MovieRepository(Movies_DBContext _dbcontext)
        {
            _context = _dbcontext;
        }

        public Task<List<MovieResponse>> GetMoviesByCriteria(String title = null, Int64? year = 0, String genere = null)
        {
            var movieResponse = (from m in _context.Movies
                                 where (
                                            (string.IsNullOrEmpty(title) || (!string.IsNullOrEmpty(title) && m.Title.Contains(title)))
                                         && (year == 0 || (year > 0 && m.YearOfRelease == year))
                                         && (string.IsNullOrEmpty(genere) || (!string.IsNullOrEmpty(genere) && m.Genres.Equals(genere)))  
                                       )
                                 select new MovieResponse
                                 {
                                     Id = m.Id,
                                     Title = m.Title,
                                     Genres = m.Genres,
                                     RunningTime = m.RunningTime,
                                     YearOfRelease = m.YearOfRelease,
                                     AverageRating = Math.Round(
                                                                (
                                                                  (from r in _context.MovieRatings where r.MovieId == m.Id select (decimal?)r.Rating).Average() ?? default)
                                                                  ,2
                                                                  , MidpointRounding.AwayFromZero) // Round to 2 digits
                                 }).ToListAsync();
            return movieResponse;
        }

        public  Task<List<MovieResponse>> GetTopMovies(int numberOfMovies)
        {
            //Using Lambda expression Here to show the variation where as LINQ is used in the rest of methods
            var movieResponse = _context.Movies
                                                .Join(_context.MovieRatings
                                                    .GroupBy(r => r.MovieId).Select(g => new { MovieId = g.Key, AvgReview = g.Average(r => r.Rating) }),
                                                        m => m.Id,
                                                        r => r.MovieId,
                                                        (m, r) => new MovieResponse
                                                        {
                                                            Id = m.Id,
                                                            Title = m.Title,
                                                            Genres = m.Genres,
                                                            RunningTime = m.RunningTime,
                                                            YearOfRelease = m.YearOfRelease,
                                                            AverageRating = Math.Round(
                                                                                        (decimal?)r.AvgReview ?? default,
                                                                                        2,
                                                                                        MidpointRounding.AwayFromZero
                                                                                        )  // Round to 2 digits
                                                        }).ToList();


            // return the top n movies in the order of average rating
            return Task.FromResult(SortBy(movieResponse, numberOfMovies)); 
        }

        public  Task<List<MovieResponse>> GetTopMoviesByUserRating(int numberOfMovies, int userId)
        {          
            var movieResponse = (from r in _context.MovieRatings
                        join m in _context.Movies on r.MovieId equals m.Id
                        where r.UserId == userId
                        select new MovieResponse
                                        {
                                            Id = m.Id,
                                            Title = m.Title,
                                            Genres = m.Genres,
                                            RunningTime = m.RunningTime,
                                            YearOfRelease = m.YearOfRelease,
                                            AverageRating = r.Rating  //No avg required as its by User
                                        }).ToList();

            // return the top n movies in the order of average rating
            return Task.FromResult(SortBy(movieResponse, numberOfMovies));
        }
        private List<MovieResponse> SortBy(List<MovieResponse> movieResponse, int numberOfMovies)
        {
            return movieResponse.OrderByDescending(x => x.AverageRating).ThenBy(x => x.Title).Take(numberOfMovies).ToList();
        }
        public async Task<int> SaveRating(MovieRating rating)
        {
            if (!_context.Movies.Any(x => x.Id == rating.MovieId) || !_context.Users.Any(x => x.Id == rating.UserId))
            {
                return 404;  
            }
            else if (rating.Rating < 1 || rating.Rating > 5)    // TODO: Should not hard code 
            {
                return 400;  
            }

            var currentRating = _context.MovieRatings.Where(x => x.MovieId == rating.MovieId && x.UserId == rating.UserId).FirstOrDefault();

            if (currentRating != null)
            {
                currentRating.Rating = rating.Rating;
                await _context.SaveChangesAsync(); // Update existing rating 
            }
            else
            {
                _context.MovieRatings.Add(
                    new MovieRating
                    {
                        MovieId = rating.MovieId,
                        UserId = rating.UserId,
                        Rating = rating.Rating
                    }
                    );
                await _context.SaveChangesAsync(); // Add new rating
            }

            return 200;

        }
    }
}
