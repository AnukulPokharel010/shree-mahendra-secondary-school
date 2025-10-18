# 🚀 Shree Mahendra Secondary School - Deployment Guide

## 🌐 Get Your Live Domain Name

Follow these steps to deploy your website and get a live domain that can be accessed from anywhere:

## Option 1: Netlify Deployment (Recommended)

### Step 1: Prepare for Deployment
```bash
# First, build the project
npm run build

# This will create an 'out' folder with static files
```

### Step 2: Deploy to Netlify

#### Method A: Drag & Drop (Easiest)
1. Go to [netlify.com](https://netlify.com)
2. Sign up/Login with GitHub, GitLab, or email
3. Drag and drop the `out` folder to Netlify's deploy area
4. Your site will be live at: `https://random-name-12345.netlify.app`

#### Method B: Netlify CLI
```bash
# Install Netlify CLI (run as administrator)
npm install -g netlify-cli

# Login to Netlify
netlify login

# Deploy the site
netlify deploy --prod --dir=out

# Your site will be live at the provided URL
```

#### Method C: Git Integration
1. Push your code to GitHub
2. Connect your GitHub repo to Netlify
3. Set build command: `npm run build`
4. Set publish directory: `out`
5. Deploy automatically on every push

### Step 3: Custom Domain (Optional)
- In Netlify dashboard, go to Domain settings
- Add your custom domain (e.g., `shreemahendra.edu.np`)
- Follow DNS configuration instructions

## Option 2: Vercel Deployment

### Step 1: Deploy to Vercel
```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel --prod

# Follow the prompts
```

### Step 2: Access Your Site
- Your site will be live at: `https://your-project-name.vercel.app`

## Option 3: GitHub Pages

### Step 1: Push to GitHub
```bash
git add .
git commit -m "Deploy website"
git push origin main
```

### Step 2: Enable GitHub Pages
1. Go to your GitHub repository
2. Settings → Pages
3. Source: Deploy from a branch
4. Branch: main, folder: /out
5. Your site will be live at: `https://yourusername.github.io/repository-name`

## Option 4: Firebase Hosting

### Step 1: Install Firebase CLI
```bash
npm install -g firebase-tools
firebase login
firebase init hosting
```

### Step 2: Deploy
```bash
firebase deploy
```

## 🔧 Environment Variables for Production

Create `.env.local` file with:
```env
NEXTAUTH_URL=https://your-domain.com
NEXTAUTH_SECRET=your-super-secure-secret-key
SITE_URL=https://your-domain.com
```

## 🌟 Your Website Features

Once deployed, your website will have:

### ✅ **Multi-Role Access**
- **Students**: `https://your-domain.com/student/dashboard`
- **Teachers**: `https://your-domain.com/teacher/dashboard`
- **Admin**: `https://your-domain.com/admin/dashboard`
- **Parents**: `https://your-domain.com/parent/dashboard`

### ✅ **Core Features**
- Real-time marks upload by teachers → visible to students
- Q&A system: Students ask, teachers answer
- Notification system for new updates
- Nepal CDC curriculum integration
- Bilingual support (Nepali/English)
- Mobile responsive design

### ✅ **Admin Features**
- User management
- System monitoring
- Activity logs
- Settings configuration

## 🎯 Quick Deployment Commands

```bash
# 1. Build the project
npm run build

# 2. Test locally (optional)
npx serve out

# 3. Deploy to Netlify (easiest)
# Just drag the 'out' folder to netlify.com

# 4. Or use CLI
netlify deploy --prod --dir=out
```

## 🔗 Expected Domain Examples

After deployment, you'll get URLs like:
- **Netlify**: `https://shree-mahendra-school.netlify.app`
- **Vercel**: `https://shree-mahendra-school.vercel.app`
- **GitHub Pages**: `https://yourusername.github.io/shree-mahendra-school`

## 📱 Access from Any Device

Once deployed, anyone can access your website from:
- ✅ Desktop computers
- ✅ Mobile phones
- ✅ Tablets
- ✅ Any browser (Chrome, Firefox, Safari, Edge)
- ✅ Any location worldwide

## 🛡️ Security Features Included

- Secure authentication system
- Role-based access control
- Data encryption
- HTTPS by default
- XSS protection
- CSRF protection

## 🎉 Next Steps After Deployment

1. **Test all features** on the live site
2. **Share the URL** with teachers, students, and parents
3. **Set up custom domain** (optional)
4. **Configure email notifications** (optional)
5. **Add real student/teacher data**

## 🆘 Need Help?

If you encounter any issues:
1. Check the build logs
2. Ensure all dependencies are installed
3. Verify environment variables
4. Contact support for your chosen platform

---

**🎊 Congratulations! Your school management system is now live and accessible worldwide! 🎊**
