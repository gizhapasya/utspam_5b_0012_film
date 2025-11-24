import '../models/movie.dart';

class MovieData {
  static List<Movie> getMovies() {
    return [
      Movie(
        id: 1,
        title: 'The Crimson Empire',
        genre: 'Action, Adventure',
        price: 50000,
        posterUrl: 'https://picsum.photos/seed/movie1/400/600',
        description:
            'An epic tale of warriors fighting for their kingdom in a world torn by war and betrayal.',
        duration: 142,
        schedules: [
          MovieSchedule(time: '10:00 AM', studio: 'Studio 1'),
          MovieSchedule(time: '01:30 PM', studio: 'Studio 2'),
          MovieSchedule(time: '04:45 PM', studio: 'Studio 1'),
          MovieSchedule(time: '08:00 PM', studio: 'Studio 3'),
        ],
      ),
      Movie(
        id: 2,
        title: 'Midnight Shadows',
        genre: 'Horror, Thriller',
        price: 45000,
        posterUrl: 'https://picsum.photos/seed/movie2/400/600',
        description:
            'A chilling story of supernatural forces haunting a small town after midnight.',
        duration: 118,
        schedules: [
          MovieSchedule(time: '11:00 AM', studio: 'Studio 4'),
          MovieSchedule(time: '02:15 PM', studio: 'Studio 3'),
          MovieSchedule(time: '07:30 PM', studio: 'Studio 4'),
          MovieSchedule(time: '10:00 PM', studio: 'Studio 2'),
        ],
      ),
      Movie(
        id: 3,
        title: 'Starlight Dreams',
        genre: 'Romance, Drama',
        price: 40000,
        posterUrl: 'https://picsum.photos/seed/movie3/400/600',
        description:
            'A heartwarming love story between two souls destined to meet under the stars.',
        duration: 125,
        schedules: [
          MovieSchedule(time: '10:30 AM', studio: 'Studio 2'),
          MovieSchedule(time: '01:00 PM', studio: 'Studio 1'),
          MovieSchedule(time: '05:30 PM', studio: 'Studio 2'),
          MovieSchedule(time: '08:45 PM', studio: 'Studio 1'),
        ],
      ),
      Movie(
        id: 4,
        title: 'Code Zero',
        genre: 'Sci-Fi, Action',
        price: 55000,
        posterUrl: 'https://picsum.photos/seed/movie4/400/600',
        description:
            'In a dystopian future, hackers fight against an oppressive AI government.',
        duration: 136,
        schedules: [
          MovieSchedule(time: '09:45 AM', studio: 'Studio 3'),
          MovieSchedule(time: '12:30 PM', studio: 'Studio 4'),
          MovieSchedule(time: '04:00 PM', studio: 'Studio 3'),
          MovieSchedule(time: '07:15 PM', studio: 'Studio 4'),
        ],
      ),
      Movie(
        id: 5,
        title: 'Laugh Out Loud',
        genre: 'Comedy',
        price: 38000,
        posterUrl: 'https://picsum.photos/seed/movie5/400/600',
        description:
            'A hilarious adventure of friends trying to survive an unforgettable road trip.',
        duration: 102,
        schedules: [
          MovieSchedule(time: '11:30 AM', studio: 'Studio 1'),
          MovieSchedule(time: '02:45 PM', studio: 'Studio 2'),
          MovieSchedule(time: '06:00 PM', studio: 'Studio 1'),
          MovieSchedule(time: '09:15 PM', studio: 'Studio 2'),
        ],
      ),
      Movie(
        id: 6,
        title: 'Ocean Depths',
        genre: 'Adventure, Documentary',
        price: 42000,
        posterUrl: 'https://picsum.photos/seed/movie6/400/600',
        description:
            'Explore the mysteries of the deep sea and encounter creatures never seen before.',
        duration: 95,
        schedules: [
          MovieSchedule(time: '10:15 AM', studio: 'Studio 4'),
          MovieSchedule(time: '01:45 PM', studio: 'Studio 3'),
          MovieSchedule(time: '05:00 PM', studio: 'Studio 4'),
          MovieSchedule(time: '08:30 PM', studio: 'Studio 3'),
        ],
      ),
      Movie(
        id: 7,
        title: 'The Last Guardian',
        genre: 'Fantasy, Action',
        price: 52000,
        posterUrl: 'https://picsum.photos/seed/movie7/400/600',
        description:
            'A legendary warrior must protect the realm from ancient dark forces awakening.',
        duration: 158,
        schedules: [
          MovieSchedule(time: '09:30 AM', studio: 'Studio 2'),
          MovieSchedule(time: '12:45 PM', studio: 'Studio 1'),
          MovieSchedule(time: '04:15 PM', studio: 'Studio 2'),
          MovieSchedule(time: '07:45 PM', studio: 'Studio 1'),
        ],
      ),
      Movie(
        id: 8,
        title: 'Silent Witness',
        genre: 'Mystery, Crime',
        price: 47000,
        posterUrl: 'https://picsum.photos/seed/movie8/400/600',
        description:
            'A detective unravels a complex web of lies to solve a decades-old cold case.',
        duration: 130,
        schedules: [
          MovieSchedule(time: '11:15 AM', studio: 'Studio 3'),
          MovieSchedule(time: '02:30 PM', studio: 'Studio 4'),
          MovieSchedule(time: '06:30 PM', studio: 'Studio 3'),
          MovieSchedule(time: '09:45 PM', studio: 'Studio 4'),
        ],
      ),
    ];
  }
}
