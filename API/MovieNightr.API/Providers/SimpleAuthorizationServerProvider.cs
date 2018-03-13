using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security.OAuth;
using MovieNightr.Business.ServiceObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using MovieNightr.Data;

namespace MovieNightr.API.Providers
{
    public class SimpleAuthorizationServerProvider : OAuthAuthorizationServerProvider
    {
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();
        }

        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            context.OwinContext.Response.Headers.Add("Access-Control-Allow-Origin", new[] { "*" });

            Business.Managers.UserManager userManager = new Business.Managers.UserManager();
            
            var response = userManager.VerifyLogin(new LoginRequest { UserName = context.UserName, Password = context.Password });

            if (response == null)
            {
                context.SetError("invalid_grant", "Username or password is invalid.");
                return;
            }            
            if (response.UserStatusId == 3)
            {
                context.SetError("invalid_grant", "Email Address is not validated.");
                return;
            }
            
            var identity = new ClaimsIdentity(context.Options.AuthenticationType);
            identity.AddClaim(new Claim("UserName", context.UserName));
            identity.AddClaim(new Claim("UserId", response.UserId.ToString()));
            

            context.Validated(identity);
        }
    }
}