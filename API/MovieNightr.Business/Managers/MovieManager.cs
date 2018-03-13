using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MovieNightr.Data;
using MovieNightr.Business.DTO;

namespace MovieNightr.Business.Managers
{
    public class MovieManager
    {
        public Movies GetMovie(int movieId)
        {
            using (var ctx = new MovieNightrEntities())
            {
                return ctx.Movies
                            .Where(m => m.MovieId == movieId)
                            .FirstOrDefault();
            }
        }

        public MovieListDTO GetMovieListByUserId(int userId)
        {
            using (var ctx = new MovieNightrEntities())
            {
                MovieListDTO list = new MovieListDTO();

                list.Movies = (from ml in ctx.MovieLists
                               join m in ctx.Movies on ml.MovieId equals m.MovieId
                               where ml.UserId == userId

                             select new MovieListMovie
                             {
                                 Ranking = ml.Rank,
                                 MovieId = m.MovieId,
                                 Title = m.Title,
                                 Rating = m.Rating,
                                 ReleaseYear = m.ReleaseYear,
                                 Genres = m.MovieGenres.Select(mg => new GenreDTO
                                 {
                                     GenreId = mg.GenreId,
                                     Name = mg.Genres.Name,
                                 }).ToList(),
                                 Actors = m.MovieActors.Select(ma => new ActorDTO
                                 {
                                     ActorId = ma.ActorId,
                                     Name = ma.Actors.Name
                                 }).ToList(),
                                 Languages = m.MovieLanguages.Select(ml => new LanguageDTO
                                 {
                                    LanguageId = ml.LanguageId,
                                    Name = ml.Languages.Name
                                 }).ToList(),
                                 Writers = m.MovieWriters.Select(mw => new WriterDTO
                                 {
                                     WriterId = mw.WriterId,
                                     Name = mw.Writers.Name,
                                 }).ToList(),
                                 Producers = m.MovieProducers.Select(mp => new ProducerDTO
                                 {
                                     ProducerId = mp.ProducerId,
                                     Name = mp.Producers.Name
                                 }).ToList(),
                                 Directors = m.MovieDirectors.Select(md => new DirectorDTO
                                 {
                                     DirectorId = md.DirectorId,
                                     Name = md.Directors.Name
                                 }).ToList(),
                             }).ToList();

                return list;
            }            
        }
    }
}
