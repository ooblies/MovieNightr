using MovieNightr.Business.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Http;

namespace MovieNightr.API
{
    public class RequestHelper : ApiController
    {
        public UserDTO GetCurrentUser()
        {
            var claims = ((ClaimsIdentity)User.Identity).Claims;
            var response = new UserDTO
            {
                UserId = Convert.ToInt32(claims.Where(c => c.Type == "UserId").Select(c => c.Value).FirstOrDefault()),
                UserName = claims.Where(c => c.Type == "UserName").Select(c => c.Value).FirstOrDefault()
            };

            

            return response;
        }
    }
}