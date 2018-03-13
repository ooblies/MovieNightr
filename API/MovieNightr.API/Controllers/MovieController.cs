using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MovieNightr.Business;
using System.Threading.Tasks;
using MovieNightr.Business.ServiceObjects;
using MovieNightr.Business.Managers;

namespace MovieNightr.API.Controllers
{
    [RoutePrefix("api/Movies")]
    public class MovieController : ApiController
    {
        public MovieManager _movieManager;

        MovieController () {
            _movieManager = new MovieManager();
        }
        
        [Authorize]
        [HttpGet]
        [Route("GetMovieList")]
        public GetMovieListResponse GetMovieList()
        {
            RequestHelper helper = new RequestHelper();

            GetMovieListResponse response = new GetMovieListResponse();

            response.MovieList = _movieManager.GetMovieListByUserId(helper.GetCurrentUser().UserId);

            return response;
        }
    }
}
