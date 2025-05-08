# Chatbot App DevOps 

This repository contains a simple chatbot web application integrated with a CI/CD pipeline using **GitHub Actions**, deployed to **AWS S3**, and monitored using **UptimeRobot**.

## 🔗 Repository

[GitHub Repo](https://github.com/saadali112/chatbot-app-devops)

---

## 📌 Problem Statement

Traditional deployment methods are slow, error-prone, and lack automation. This project solves the issue by:

- Automating build & deployment using GitHub Actions
- Hosting the app on AWS S3 for high availability
- Monitoring uptime and health using UptimeRobot

---

## 🛠️ Architecture

![Architecture Diagram](./.github/architecture.png)

**Flow:**
1. Developer pushes code to `main`
2. GitHub Actions runs CI/CD workflow
3. Code is deployed to AWS S3
4. UptimeRobot monitors app uptime and alerts on downtime

---

## 🚀 Key Technical Achievements

- ✅ Automated deployment pipeline via GitHub Actions
- ✅ S3-hosted static site deployment
- ✅ Public access and hosting setup using AWS CLI & policies
- ✅ Real-time monitoring with UptimeRobot

---

## 🧪 Live Demo

**Demo Flow:**

1. Make a Git commit and push to `main`
2. GitHub Actions deploys updated app to AWS S3
3. Check [Live URL](http://your-s3-website-url) for updated site
4. UptimeRobot ensures app stays up (90s polling)

---

## 📈 Monitoring

We use [UptimeRobot](https://uptimerobot.com/) to:

- Monitor HTTP status of the S3-hosted chatbot
- Alert via email when downtime is detected
- Display uptime % on a public dashboard

---

## 🎓 Lessons Learned

- Setting up CI/CD with GitHub Actions is easier than it looks
- AWS S3 + static websites is cost-effective and reliable
- Monitoring is crucial — even for simple apps
- `.terraform` files should never be pushed to Git (large file limits!)

---

## 🤝 Contributors

- Saad Ali  
- Team Members

---

## 📂 Directory Structure

