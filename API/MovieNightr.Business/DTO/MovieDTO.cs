using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieNightr.Business.DTO
{
    public class MovieDTO
    {
        public int MovieId { get; set; }
        public string Title { get; set; }
        public string Rating { get; set; }
        public int ReleaseYear { get; set; }

        public List<GenreDTO> Genres { get; set; }
        public List<ActorDTO> Actors { get; set; }
        public List<LanguageDTO> Languages { get; set; }
        public List<WriterDTO> Writers { get; set; }
        public List<ProducerDTO> Producers { get; set; }
        public List<DirectorDTO> Directors { get; set; }
    }
}
