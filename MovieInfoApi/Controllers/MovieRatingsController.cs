using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MovieInfoApi.Entities;
using MovieInfoApi.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MovieInfoApi.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class MovieRatingsController : ControllerBase
    {
        IMovieRepository _movieRepository;
        private readonly ILogger<MovieRatingsController> _logger;

        public MovieRatingsController(IMovieRepository movieRepository, ILogger<MovieRatingsController> logger)
        {
            _movieRepository = movieRepository;
            _logger = logger;
        }
        /// <summary>
        /// Add or update user rating for a movie 
        /// </summary>
        /// <param name="rating"></param>
        /// <returns></returns>
        [HttpPost]        
        public async Task<ActionResult> SaveRating([FromBody]  MovieRating rating)
        {
            _logger.LogInformation("MovieRatingsController:API SaveRating()-->Log Info...");
            int status = await _movieRepository.SaveRating(rating);


            if (status == 404)
            {
                //Movie or user not found. Return status code 404
                return NotFound(); 
            }
            else if (status == 400)
            {
                // Invalid Rating .Return status code 400
                return BadRequest(); 
            }
            else
            {
                //Return status code 200
                return Ok(); 
            }
        }
    }
}
