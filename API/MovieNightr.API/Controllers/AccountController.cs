using Microsoft.AspNet.Identity;
using MovieNightr.Business.DTO;
using MovieNightr.Business.ServiceObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web.Http;

namespace MovieNightr.API.Controllers
{
    [RoutePrefix("api/Account")]
    public class AccountController : ApiController
    {
        [Authorize]
        [Route("Test", Name = "Test")]
        [HttpGet]
        public IHttpActionResult Test()
        {
            RequestHelper helper = new RequestHelper();
            
            return Ok("You have permission to see this, " + helper.GetCurrentUser().UserName + '.');
        }

        //POST api/Account/Register
        [AllowAnonymous]
        [Route("Register", Name = "Register")]
        public IHttpActionResult Register(RegisterRequest request)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                Business.Managers.UserManager userManager = new Business.Managers.UserManager();

                IdentityResult idResult = userManager.Register(request);

                if (!idResult.Succeeded)
                {
                    return GetErrorResult(idResult);
                }

                //return something?
                return Ok(true);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        
        protected IHttpActionResult GetErrorResult(IdentityResult result)
        {
            if (result == null)
            {
                return InternalServerError();
            }

            if (!result.Succeeded)
            {
                if (result.Errors != null)
                {
                    foreach (string error in result.Errors)
                    {
                        ModelState.AddModelError("", error);
                    }
                }

                if (ModelState.IsValid)
                {
                    // No ModelState errors are available to send, so just return an empty BadRequest.
                    return BadRequest();
                }

                return BadRequest(ModelState);
            }

            return null;
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}
