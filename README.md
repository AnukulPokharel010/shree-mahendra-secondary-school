# श्री महेन्द्र माध्यमिक विद्यालय - Official Website

## Shree Mahendra Secondary School - Official Website

A comprehensive educational web platform built with modern technologies to serve students, teachers, administrators, and parents.

### 🚀 Features

- **Multi-role Authentication**: Student, Teacher, Admin, Parent portals
- **Content Management**: Upload and manage educational materials
- **Event Management**: Organize and display school events
- **Question & Feedback System**: Interactive Q&A platform
- **Course Management**: Academic and extra-curricular courses
- **Gallery**: Photo and video galleries
- **Multilingual Support**: Nepali and English
- **Responsive Design**: Mobile-first approach
- **SEO Optimized**: Search engine friendly

### 🛠️ Tech Stack

- **Frontend**: Next.js 14, TypeScript, Tailwind CSS
- **UI Components**: shadcn/ui, Radix UI
- **Icons**: Lucide React
- **Database**: PostgreSQL with Prisma ORM
- **Authentication**: NextAuth.js
- **Styling**: Tailwind CSS with custom Nepali font support
- **Deployment**: Vercel (Frontend), Railway/Heroku (Backend)

### 📋 Prerequisites

Before running this project, make sure you have:

- Node.js 18+ installed
- PostgreSQL database
- Git

### 🔧 Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd shree-mahendra-secondary-school
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   ```bash
   cp .env.local.example .env.local
   ```
   Edit `.env.local` with your configuration

4. **Set up the database**
   ```bash
   npx prisma migrate dev
   npx prisma db seed
   ```

5. **Run the development server**
   ```bash
   npm run dev
   ```

6. **Open your browser**
   Navigate to [http://localhost:3000](http://localhost:3000)

### 🗂️ Project Structure

```
src/
├── app/                    # Next.js App Router
│   ├── (auth)/            # Authentication pages
│   ├── (dashboard)/       # Role-based dashboards
│   ├── api/               # API routes
│   └── globals.css        # Global styles
├── components/            # Reusable components
│   ├── ui/                # UI components
│   ├── layout/            # Layout components
│   └── sections/          # Page sections
├── lib/                   # Utility functions
├── types/                 # TypeScript types
└── hooks/                 # Custom React hooks
```

### 🎯 User Roles

1. **Student**
   - View announcements and events
   - Access course materials
   - Submit questions
   - View grades and attendance

2. **Teacher**
   - Upload course materials
   - Manage student questions
   - Create announcements
   - View student progress

3. **Admin**
   - Full system management
   - User management
   - Content moderation
   - System analytics

4. **Parent** (Future feature)
   - View child's progress
   - Communication with teachers
   - Event notifications

### 🌐 Multilingual Support

The website supports:
- **Nepali (Default)**: नेपाली
- **English**: English
- **Hindi** (Future): हिन्दी

### 📱 Responsive Design

- Mobile-first approach
- Tablet optimization
- Desktop enhancement
- Touch-friendly interfaces

### 🔒 Security Features

- JWT-based authentication
- Role-based access control
- Input validation and sanitization
- CSRF protection
- Secure file uploads

### 🚀 Deployment

#### Frontend (Vercel)
```bash
npm run build
vercel --prod
```

#### Database (Railway/Heroku)
```bash
# Set up production database
# Run migrations
npx prisma migrate deploy
```

### 📊 Performance

- Optimized images with Next.js Image component
- Lazy loading for better performance
- Code splitting and tree shaking
- SEO optimization with meta tags

### 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

### 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

### 📞 Support

For support, email admin@shreemahendra.edu.np or create an issue in the repository.

### 🙏 Acknowledgments

- School administration and staff
- Students and parents
- Open source community
- Contributors and developers

---

**Built with ❤️ for education in Nepal**
