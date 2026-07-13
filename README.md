# Houssem Hamdi Portfolio

A production-ready Flutter Web portfolio powered by Firebase, designed to showcase my software engineering projects, technical skills, experience, and professional profile.

The platform combines a modern Flutter frontend with Firebase services to provide a dynamic, scalable, and maintainable portfolio experience. Content can be managed through an admin dashboard, allowing updates without modifying the application code.

## Features

- Responsive Flutter Web interface
- Firebase-powered backend
- Dynamic project and experience management
- Admin dashboard for content updates
- CV download and document management
- Modern UI/UX focused on recruiter and technical audience experience

## Tech Stack

- **Frontend:** Flutter Web, Dart
- **Backend:** Firebase
  - Cloud Firestore
  - Firebase Storage
  - Firebase Authentication
  - Cloud Functions (if required)
- **Deployment:** Firebase Hosting

## Project Structure
lib/ # Flutter application source code
assets/ # Static assets and resources
firebase/ # Firebase configuration and services
docs/ # Documentation and project resources

## CV Management

The CV is generated using LaTeX and maintained separately from the application logic.

Included files:


docs/
└── cv/
├── Houssem_Hamdi_CV.tex # LaTeX source file
└── Houssem_Hamdi_CV.pdf # Generated CV document


The `.tex` file allows future modifications and regeneration of the CV through Overleaf or any LaTeX environment.

The generated PDF can be uploaded to Firebase Storage and managed through the portfolio administration system to keep the downloadable version updated without requiring a new application release.

## Development

Clone the repository:

```bash
git clone https://github.com/<username>/houssem-hamdi-portfolio.git