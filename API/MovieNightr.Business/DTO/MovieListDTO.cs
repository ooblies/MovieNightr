using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieNightr.Business.DTO
{
    public class MovieListDTO
    {
        public List<MovieListMovie> Movies { get; set; }        
    }

    public class MovieListMovie : MovieDTO
    {
        public int? Ranking { get; set; }
    }
}
