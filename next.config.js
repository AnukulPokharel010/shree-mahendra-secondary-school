/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  trailingSlash: true,
  images: {
    domains: ['localhost', 'images.unsplash.com'],
    unoptimized: true
  },
  assetPrefix: process.env.NODE_ENV === 'production' ? undefined : '',
  basePath: '',
  distDir: 'out'
}

module.exports = nextConfig
