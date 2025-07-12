# Portfolio

A personal portfolio built using Flutter, with GitHub as a database, Spring Boot for backend, and
deployed on Render using Docker.

## Features

- Responsive design for web and mobile
- Dynamic data fetched from GitHub
- Admin panel for content management
- About Me, Experience, Certificates, Projects, and Contact sections
- Custom animations and transitions
- Dark and light theme support

## Tech Stack

- **Frontend:** Flutter
- **Backend:** Spring Boot
- **Database:** GitHub (JSON files)
- **Deployment:** Docker on Render

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [Spring Boot](https://spring.io/projects/spring-boot) (for backend)
- [Docker](https://www.docker.com/get-started)

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/amankrmj01/portfolio
   cd portfolio
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the app:**
   ```bash
   flutter run -d chrome
   ```

### Backend Setup

1. Configure Spring Boot backend to serve data from GitHub.
2. Build the Docker image (replace `<username on docker hub>` with your Docker Hub username):
   ```bash
   docker build -t <username on docker hub>/java-application .
   ```
3. Run the backend in a container:
   ```bash
   docker run -p 8080:8080 -d <username on docker hub>/java-application
   ```
4. To check if the backend is working, access `http://localhost:8080` in your browser or use
   curl/postman.
5. Push the image to Docker Hub:
   ```bash
   docker push <username on docker hub>/java-application
   ```

### Deployment

- Frontend is deployed on GitHub Pages using GitHub Actions.
- Backend is deployed on [Render](https://render.com/) using Docker.

## Live Demo

[Portfolio Website](https://amankrmj01.github.io/portfolio/)

## Backend Repository

[portfolio_backend](https://github.com/amankrmj01/portfolio_backend)

## Frontend Repository

[portfolio](https://github.com/amankrmj01/portfolio)

## Folder Structure

```
lib/
  configs/         # App-wide configuration and constants
  domain/          # Core models and domain logic
  infrastructure/  # Data access and services
  presentation/    # UI screens and widgets
  utils/           # Utility functions and extensions
  widgets/         # Reusable widgets
assets/
  fonts/           # Custom fonts (Poppins, NotoSans, etc.)
  images/          # Images and icons
```

## License

[GPLv3.0](LICENSE)
