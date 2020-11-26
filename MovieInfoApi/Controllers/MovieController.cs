using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using MovieInfoApi.DTO;
using MovieInfoApi.Entities;
using MovieInfoApi.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MovieInfoApi.Controllers
{

    [Route("api/v1/[controller]")]
    [ApiController]
    public class MovieController : ControllerBase
    {
        IMovieRepository _movieRepository;
        private readonly ILogger<MovieController> _logger;
        public MovieController(IMovieRepository movieRepository, ILogger<MovieController> logger)
        {
            _movieRepository = movieRepository;
            _logger = logger;
        }


        /// <summary>
        /// Query movie data based on provided filter criteria: title, year of release, genre(s)
        /// </summary>
        /// <param name="title"></param>
        /// <param name="year"></param>
        /// <param name="genere"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("")]
        [Route("{title}&{year}&{genere}")]
        public async Task<ActionResult<List<MovieResponse>>> Search([FromQueryAttribute] String title, [FromQueryAttribute] Int64? year, [FromQueryAttribute] String genere)
        {
            _logger.LogInformation("MovieController:API Search()-->Log Info...");

            // 400 (if invalid / no criteria is given)
            if (string.IsNullOrEmpty(title) && year == 0 && string.IsNullOrEmpty(genere)) return BadRequest(); 

            //Call Repository method
            var movieResponse = await _movieRepository.GetMoviesByCriteria(title, year, genere);
            
            if (movieResponse.Count == 0)
            {
               // 404(if no movie is found based on the criteria)
                return NotFound(); 
            }
            else
            {
                // return the movies if found something.Return status code 200
                return Ok(movieResponse); 
            }
        }
    
    /// <summary>
        /// Query top n (default 5) movies based on total user rating
        /// </summary>
        /// <param name="n"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("top/{n=5}")]
        public async Task<ActionResult<List<MovieResponse>>> GetTopMovies(int n)
        {
            _logger.LogInformation("MovieController:API GetTopMovies()--> Log Info...");
            //Call Repository method
            var movieResponse = await _movieRepository.GetTopMovies(n);            
            if (movieResponse.Count() == 0)
            {
                // 404(if no movie is found based on the criteria)
                return NotFound(); 
            }
            else
            {
                // return the movies if found something.Return status code 200
                return Ok(movieResponse); 
            }
        }

        /// <summary>
        /// Query top n (default 5) movies based on a certain user’s  rating
        /// </summary>
        /// <param name="n"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("top/{n=5}/{userId}")]
        public async Task<ActionResult<List<MovieResponse>>> GetTopMoviesByUserRating(int n, int userId)
        {
                _logger.LogInformation("MovieController:API GetTopMoviesByUserRating()-->Log Info...");
                //Call Repository method
                var movieResponse = await _movieRepository.GetTopMoviesByUserRating(n, userId);
               
                if (movieResponse.Count() == 0)
                {
                // 404(if no movie is found based on the criteria)
                return NotFound(); 
                }
                else
                {
                // return the movies if found something.Return status code 200
                return Ok(movieResponse); 
                }
            }
        
    }
}
