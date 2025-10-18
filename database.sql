-- Shree Mahendra Secondary School Database Schema
-- Generated from Prisma Schema for traditional SQL setup

-- Create Database
CREATE DATABASE IF NOT EXISTS shree_mahendra_school;
USE shree_mahendra_school;

-- Create ENUM types (for MySQL, we'll use VARCHAR with CHECK constraints)
-- For PostgreSQL, you can use actual ENUMs

-- Users table
CREATE TABLE users (
    id VARCHAR(36) PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    username VARCHAR(255) UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('STUDENT', 'TEACHER', 'ADMIN', 'PARENT') DEFAULT 'STUDENT',
    status ENUM('ACTIVE', 'INACTIVE', 'SUSPENDED') DEFAULT 'ACTIVE',
    
    -- Profile Information
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    dateOfBirth DATE,
    gender VARCHAR(10),
    avatar VARCHAR(500),
    
    -- Academic Information
    grade VARCHAR(10),
    section VARCHAR(10),
    rollNumber VARCHAR(20),
    
    -- Timestamps
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    lastLogin TIMESTAMP NULL
);

-- Profiles table
CREATE TABLE profiles (
    id VARCHAR(36) PRIMARY KEY,
    userId VARCHAR(36) UNIQUE NOT NULL,
    bio TEXT,
    website VARCHAR(500),
    socialLinks JSON,
    preferences JSON,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
);

-- Courses table
CREATE TABLE courses (
    id VARCHAR(36) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    titleEn VARCHAR(255),
    description TEXT,
    descriptionEn TEXT,
    code VARCHAR(50) UNIQUE NOT NULL,
    credits INT,
    duration VARCHAR(100),
    level VARCHAR(50),
    category VARCHAR(100),
    image VARCHAR(500),
    syllabus VARCHAR(500),
    isActive BOOLEAN DEFAULT TRUE,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Content table
CREATE TABLE contents (
    id VARCHAR(36) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    content LONGTEXT,
    type ENUM('ANNOUNCEMENT', 'ASSIGNMENT', 'LESSON', 'DOCUMENT', 'VIDEO', 'LINK') NOT NULL,
    
    -- File information
    fileUrl VARCHAR(500),
    fileName VARCHAR(255),
    fileSize INT,
    mimeType VARCHAR(100),
    
    -- Visibility and targeting
    isPublic BOOLEAN DEFAULT FALSE,
    targetGrade VARCHAR(10),
    targetSection VARCHAR(10),
    
    -- Author
    authorId VARCHAR(36) NOT NULL,
    
    -- Timestamps
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    publishedAt TIMESTAMP NULL,
    
    FOREIGN KEY (authorId) REFERENCES users(id)
);

-- Enrollments table
CREATE TABLE enrollments (
    id VARCHAR(36) PRIMARY KEY,
    userId VARCHAR(36) NOT NULL,
    courseId VARCHAR(36) NOT NULL,
    enrolledAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completedAt TIMESTAMP NULL,
    UNIQUE KEY unique_enrollment (userId, courseId),
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (courseId) REFERENCES courses(id)
);

-- Questions table
CREATE TABLE questions (
    id VARCHAR(36) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    category VARCHAR(100),
    subject VARCHAR(100),
    grade VARCHAR(10),
    status ENUM('OPEN', 'ANSWERED', 'CLOSED') DEFAULT 'OPEN',
    authorId VARCHAR(36) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (authorId) REFERENCES users(id)
);

-- Answers table
CREATE TABLE answers (
    id VARCHAR(36) PRIMARY KEY,
    content TEXT NOT NULL,
    questionId VARCHAR(36) NOT NULL,
    authorId VARCHAR(36) NOT NULL,
    isAccepted BOOLEAN DEFAULT FALSE,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (questionId) REFERENCES questions(id) ON DELETE CASCADE,
    FOREIGN KEY (authorId) REFERENCES users(id)
);

-- Events table
CREATE TABLE events (
    id VARCHAR(36) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    titleEn VARCHAR(255),
    description TEXT,
    descriptionEn TEXT,
    startDate TIMESTAMP NOT NULL,
    endDate TIMESTAMP,
    venue VARCHAR(255),
    venueEn VARCHAR(255),
    category VARCHAR(100),
    image VARCHAR(500),
    gallery JSON,
    status ENUM('UPCOMING', 'ONGOING', 'COMPLETED', 'CANCELLED') DEFAULT 'UPCOMING',
    isPublic BOOLEAN DEFAULT TRUE,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Gallery table
CREATE TABLE gallery (
    id VARCHAR(36) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    titleEn VARCHAR(255),
    description TEXT,
    imageUrl VARCHAR(500) NOT NULL,
    thumbnailUrl VARCHAR(500),
    altText VARCHAR(255),
    category VARCHAR(100),
    tags JSON,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Notifications table
CREATE TABLE notifications (
    id VARCHAR(36) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    type VARCHAR(50),
    userId VARCHAR(36),
    isRead BOOLEAN DEFAULT FALSE,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    readAt TIMESTAMP NULL,
    FOREIGN KEY (userId) REFERENCES users(id)
);

-- Settings table
CREATE TABLE settings (
    id VARCHAR(36) PRIMARY KEY,
    `key` VARCHAR(255) UNIQUE NOT NULL,
    value TEXT NOT NULL,
    type VARCHAR(50) DEFAULT 'string',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO users (id, email, password, firstName, lastName, role, status) VALUES
('admin-001', 'admin@shreemahendra.edu.np', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj8xLRw7iDH.', 'प्रशासक', 'महेन्द्र', 'ADMIN', 'ACTIVE'),
('teacher-001', 'teacher@shreemahendra.edu.np', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj8xLRw7iDH.', 'राम प्रसाद', 'शर्मा', 'TEACHER', 'ACTIVE'),
('student-001', 'student@shreemahendra.edu.np', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj8xLRw7iDH.', 'राम बहादुर', 'श्रेष्ठ', 'STUDENT', 'ACTIVE');

-- Insert sample courses
INSERT INTO courses (id, title, titleEn, description, descriptionEn, code, credits, duration, level, category, isActive) VALUES
('course-001', 'गणित', 'Mathematics', 'कक्षा १० को गणित पाठ्यक्रम', 'Grade 10 Mathematics curriculum', 'MATH-10', 100, '1 वर्ष', 'कक्षा १०', 'अनिवार्य विषय', TRUE),
('course-002', 'विज्ञान', 'Science', 'कक्षा १० को विज्ञान पाठ्यक्रम', 'Grade 10 Science curriculum', 'SCI-10', 100, '1 वर्ष', 'कक्षा १०', 'अनिवार्य विषय', TRUE);

-- Insert sample events
INSERT INTO events (id, title, titleEn, description, descriptionEn, startDate, venue, venueEn, category, status, isPublic) VALUES
('event-001', 'वार्षिक खेलकुद प्रतियोगिता', 'Annual Sports Competition', 'सबै कक्षाका विद्यार्थीहरूका लागि खेलकुद प्रतियोगिता', 'Sports competition for students of all grades', '2024-12-01 09:00:00', 'विद्यालय खेल मैदान', 'School Sports Ground', 'खेलकुद', 'UPCOMING', TRUE),
('event-002', 'विज्ञान मेला', 'Science Fair', 'विद्यार्थीहरूका वैज्ञानिक परियोजनाहरूको प्रदर्शनी', 'Exhibition of students scientific projects', '2024-12-08 13:00:00', 'विज्ञान प्रयोगशाला', 'Science Laboratory', 'शिक्षा', 'UPCOMING', TRUE);

-- Insert sample settings
INSERT INTO settings (id, `key`, value, type) VALUES
('setting-001', 'school_name', 'श्री महेन्द्र माध्यमिक विद्यालय', 'string'),
('setting-002', 'school_address', 'काठमाडौं, नेपाल', 'string'),
('setting-003', 'school_phone', '+977-1-4567890', 'string'),
('setting-004', 'school_email', 'info@shreemahendra.edu.np', 'string');

-- Create indexes for better performance
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_content_author ON contents(authorId);
CREATE INDEX idx_content_type ON contents(type);
CREATE INDEX idx_questions_author ON questions(authorId);
CREATE INDEX idx_questions_status ON questions(status);
CREATE INDEX idx_events_date ON events(startDate);
CREATE INDEX idx_events_status ON events(status);

-- Note: Default passwords are hashed versions of:
-- admin123, teacher123, student123
