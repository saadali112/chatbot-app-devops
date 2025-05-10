
# 🚀 Static Chatbot Web App Deployment Using DevOps on AWS

A fully automated CI/CD pipeline to deploy a static chatbot web app to AWS S3, monitored by UptimeRobot. Built with GitHub Actions, Terraform, and AWS.


## 🌟 Features
- **Zero-Touch Deployments**: Push code to GitHub → Auto-deployed to S3 via GitHub Actions.
- **Cost-Efficient**: Uses AWS S3 Free Tier (~$0/month).
- **24/7 Monitoring**: UptimeRobot checks site every 5 minutes.
- **Infrastructure as Code**: Terraform for reproducible S3 bucket setup.

## 🛠️ Tech Stack
| Component          | Tool                                                                 |
|--------------------|---------------------------------------------------------------------|
| **Frontend**       | HTML/CSS/JS (Static Chatbot)                                        |
| **Hosting**        | AWS S3 (Static Website Hosting)                                     |
| **CI/CD**          | GitHub Actions                                                      |
| **Infrastructure** | Terraform ([See `terraform/`](terraform/))                          |
| **Monitoring**     | [UptimeRobot](https://uptimerobot.com/)                             |

## 🚀 Quick Start
### Prerequisites
- AWS Account (Free Tier)
- GitHub Account
- Terraform (Optional, for IaC)

### 1. Manual Deployment (Without Terraform)
```bash
# Clone the repo
git clone https://github.com/your-username/chatbot-webapp-devops.git
cd chatbot-webapp-devops

# Deploy to S3 using AWS CLI (Replace BUCKET_NAME)
aws s3 sync ./frontend s3://BUCKET_NAME --delete
```

### 2. Automated CI/CD Setup
1. **Configure AWS Secrets in GitHub**:
   - Go to Repo → Settings → Secrets → Actions.
   - Add:
     - `AWS_ACCESS_KEY_ID`
     - `AWS_SECRET_ACCESS_KEY`
2. **Push Code**:
   ```bash
   git push origin main  # Triggers GitHub Actions workflow
   ```

### 3. Using Terraform (Optional)
```bash
cd terraform
terraform init
terraform apply -var="bucket_name=your-unique-bucket-name"
```

## 📊 Monitoring Setup
1. Sign up at [UptimeRobot](https://uptimerobot.com/).
2. Add a new monitor:
   - **URL**: Your S3 endpoint (e.g., `http://BUCKET_NAME.s3-website-us-east-1.amazonaws.com`)
   - **Check Interval**: 5 minutes.
3. Configure alerts (Email/SMS).

## 📂 Project Structure
```
.
├── frontend/               # Static chatbot files
│   ├── index.html          # Chatbot UI
│   ├── style.css           # Styles
│   └── script.js           # Chatbot logic
├── .github/workflows/      # CI/CD pipelines
│   └── deploy.yml          # GitHub Actions workflow
├── terraform/              # Infrastructure as Code
│   ├── main.tf             # S3 bucket definition
│    
└── README.md               # You are here!
```



## 💡 Lessons Learned
- **Automation is Key**: Reduced deployment time from 15 mins to 2 mins.
- **S3 > EC2 for Static Sites**: Cheaper and serverless.
- **Monitor Early**: UptimeRobot caught 2 downtime incidents during testing.


## 🙏 Credits
- [AWS Free Tier](https://aws.amazon.com/free/)
- [UptimeRobot Free Plan](https://uptimerobot.com/)

## 🤝 Contributors

- Saad Ali  
- Aurangzaib Bhatti

