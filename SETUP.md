# 🚀 Shree Mahendra Secondary School - Setup Guide

This guide will help you set up the complete educational web platform for Shree Mahendra Secondary School.

## 📋 Prerequisites

Before starting, ensure you have the following installed:

### Required Software
- **Node.js 18+** - [Download from nodejs.org](https://nodejs.org/)
- **PostgreSQL 14+** - [Download from postgresql.org](https://www.postgresql.org/download/)
- **Git** - [Download from git-scm.com](https://git-scm.com/)

### Verify Installation
```bash
node --version    # Should show v18.0.0 or higher
npm --version     # Should show 9.0.0 or higher
psql --version    # Should show PostgreSQL 14+
git --version     # Should show git version
```

## 🛠️ Installation Steps

### 1. Install Node.js Dependencies
```bash
# Navigate to project directory
cd "c:\Users\ASUS\Desktop\xampp\htdocs\shree mahendra secondary school"

# Install all dependencies
npm install
```

### 2. Database Setup

#### Create PostgreSQL Database
```sql
-- Connect to PostgreSQL as superuser
psql -U postgres

-- Create database
CREATE DATABASE shree_mahendra_school;

-- Create user (optional)
CREATE USER school_admin WITH PASSWORD 'your_secure_password';
GRANT ALL PRIVILEGES ON DATABASE shree_mahendra_school TO school_admin;

-- Exit psql
\q
```

#### Configure Environment Variables
```bash
# Copy environment template
cp .env.local.example .env.local

# Edit .env.local with your database credentials
```

Update `.env.local`:
```env
# Database
DATABASE_URL="postgresql://postgres:your_password@localhost:5432/shree_mahendra_school"

# NextAuth
NEXTAUTH_URL="http://localhost:3000"
NEXTAUTH_SECRET="your-very-secure-secret-key-here"

# Email Configuration (Optional)
SMTP_HOST="smtp.gmail.com"
SMTP_PORT=587
SMTP_USER="your-email@gmail.com"
SMTP_PASSWORD="your-app-password"

# Site Configuration
SITE_NAME="Shree Mahendra Secondary School"
SITE_URL="http://localhost:3000"
ADMIN_EMAIL="admin@shreemahendra.edu.np"
```

### 3. Database Migration and Seeding

```bash
# Generate Prisma client
npm run db:generate

# Push database schema
npm run db:push

# Seed database with sample data
npm run db:seed
```

### 4. Start Development Server

```bash
# Start the development server
npm run dev
```

The application will be available at: **http://localhost:3000**

## 👤 Default Login Credentials

After seeding, you can use these accounts:

### Administrator
- **Email**: `admin@shreemahendra.edu.np`
- **Password**: `admin123`
- **Role**: Full system access

### Teacher
- **Email**: `teacher@shreemahendra.edu.np`
- **Password**: `teacher123`
- **Role**: Content management, student questions

### Student
- **Email**: `student@shreemahendra.edu.np`
- **Password**: `student123`
- **Role**: View content, ask questions

## 🗂️ Project Structure

```
src/
├── app/                    # Next.js App Router
│   ├── (auth)/            # Authentication pages
│   ├── admin/             # Admin dashboard
│   ├── teacher/           # Teacher dashboard
│   ├── student/           # Student dashboard
│   ├── api/               # API routes
│   ├── login/             # Login page
│   ├── globals.css        # Global styles
│   ├── layout.tsx         # Root layout
│   └── page.tsx           # Home page
├── components/            # Reusable components
│   ├── ui/                # UI components (shadcn/ui)
│   ├── layout/            # Layout components
│   └── sections/          # Page sections
├── lib/                   # Utility functions
│   ├── auth.ts            # NextAuth configuration
│   ├── prisma.ts          # Prisma client
│   └── utils.ts           # Helper functions
└── types/                 # TypeScript types
    └── index.ts           # Type definitions
```

## 🔧 Available Scripts

```bash
# Development
npm run dev              # Start development server
npm run build           # Build for production
npm run start           # Start production server
npm run lint            # Run ESLint

# Database
npm run db:generate     # Generate Prisma client
npm run db:push         # Push schema to database
npm run db:migrate      # Run database migrations
npm run db:seed         # Seed database with sample data
npm run db:reset        # Reset database (⚠️ Destructive)
npm run db:studio       # Open Prisma Studio
```

## 🎨 Features Overview

### ✅ Completed Features
- **Multi-role Authentication** - Student, Teacher, Admin dashboards
- **Public Landing Page** - Hero, About, Programs, Events, Gallery
- **Database Schema** - Complete data model with relationships
- **API Routes** - User management, content, events, questions
- **Responsive Design** - Mobile-first approach
- **Multilingual Support** - Nepali and English content

### 🚧 In Development
- Content upload system
- Question & feedback system
- Course enrollment
- Notification system

### 📅 Planned Features
- Parent portal
- AI-powered search
- Mobile app
- Payment integration
- Advanced analytics

## 🌐 Deployment

### Frontend (Vercel)
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy to Vercel
vercel --prod
```

### Database (Railway/Heroku)
1. Create a PostgreSQL database on Railway or Heroku
2. Update `DATABASE_URL` in production environment
3. Run migrations: `npx prisma migrate deploy`

## 🔒 Security Considerations

- Change all default passwords in production
- Use strong `NEXTAUTH_SECRET`
- Enable HTTPS in production
- Configure proper CORS settings
- Set up database backups
- Use environment variables for sensitive data

## 🐛 Troubleshooting

### Common Issues

#### Database Connection Error
```bash
# Check if PostgreSQL is running
pg_isready

# Check database exists
psql -U postgres -l
```

#### Module Not Found Errors
```bash
# Clear node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
```

#### Prisma Client Issues
```bash
# Regenerate Prisma client
npm run db:generate
```

### Getting Help

1. Check the [GitHub Issues](https://github.com/your-repo/issues)
2. Review the [Next.js Documentation](https://nextjs.org/docs)
3. Check [Prisma Documentation](https://www.prisma.io/docs)
4. Contact the development team

## 📞 Support

For technical support or questions:
- **Email**: admin@shreemahendra.edu.np
- **Phone**: +977-1-4567890

---

**Built with ❤️ for education in Nepal**
