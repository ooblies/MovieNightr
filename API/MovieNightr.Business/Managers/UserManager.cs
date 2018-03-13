using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MovieNightr.Data;
using MovieNightr.Business.DTO;
using Microsoft.AspNet.Identity;
using CryptSharp.Utility;
using MovieNightr.Business.ServiceObjects;

namespace MovieNightr.Business.Managers
{
    public class UserManager
    {
        public Users VerifyLogin(LoginRequest login)
        {
            using (var ctx = new MovieNightrEntities())
            {
                var user = ctx.Users.Where(u => u.UserName == login.UserName).FirstOrDefault();

                if (user != null && user.Password == Hash(login.Password, user.Salt))
                {
                    user.LastLoginDate = DateTime.Now;
                    user.ModifiedOn = DateTime.Now;
                    user.ModifiedBy = user.UserName;

                    ctx.SaveChanges();
                    return user;
                }

                return null;
            }
        }

        public IdentityResult Register(RegisterRequest reg)
        {            
            using (var ctx = new MovieNightrEntities())
            {
                try
                {
                    //Check if username already taken
                    if (ctx.Users.Where(u => u.UserName == reg.UserName).Count() > 0)
                    {
                        return new IdentityResult("This username is already taken.");
                    }

                    //save to users table
                    Guid salt = Guid.NewGuid();

                    ctx.Users.Add(new Users
                    {
                        UserName = reg.UserName,
                        Password = Hash(reg.Password, salt.ToString()),
                        Salt = salt.ToString(),
                        FirstName = reg.FirstName,
                        LastName = reg.LastName,
                        Email = reg.Email,
                        //TO-DO: create enum
                        UserStatusId = 3, //pending
                        IsActive = true,
                        CreatedBy = "RegisterAPI",
                        CreatedOn = DateTime.Now,
                        ModifiedOn = DateTime.Now,
                        ModifiedBy = "RegisterAPI",
                    });

                    ctx.SaveChanges();

                    //return successful result            
                    return IdentityResult.Success;
                }
                catch (Exception ex)
                {
                    return new IdentityResult(ex.Message);
                }
            }            
        }

        public string Hash(string secret, string salt)
        {
            var keyBytes = Encoding.UTF8.GetBytes(secret);
            var saltBytes = Encoding.UTF8.GetBytes(salt);
            var cost = 262144;
            var blockSize = 8;
            var parallel = 1;
            var maxThreads = (int?)null;
            var derivedKeyLength = 128;

            var bytes = SCrypt.ComputeDerivedKey(keyBytes, saltBytes, cost, blockSize, parallel, maxThreads, derivedKeyLength);
            return Convert.ToBase64String(bytes);
        }
    }
}
