# Flask + AWS RDS (PostgreSQL) Project 🚀

A production-ready Flask web application connected to **AWS RDS (PostgreSQL)** and deployed on **EC2 (Ubuntu)**.  
This project demonstrates real-world backend concepts including cloud databases, environment-based configuration, and Linux automation.

---

## 🔥 Features

- User authentication (Sign up / Login / Logout)
- Notes management (add & delete notes)
- PostgreSQL database hosted on **AWS RDS**
- Flask backend with **SQLAlchemy ORM**
- Secure configuration using **environment variables**
- Automated EC2 setup using a shell script
- Ready for production deployment

---

## 🏗️ Tech Stack

- **Backend**: Flask (Python)
- **Database**: PostgreSQL (AWS RDS)
- **ORM**: Flask-SQLAlchemy
- **Auth**: Flask-Login
- **Server**: AWS EC2 (Ubuntu)
- **OS**: Linux
- **Cloud**: AWS

---

## 🗂️ Project Structure

.
├── main.py
├── requirements.txt
├── setup_ec2.sh
├── website/
│ ├── init.py
│ ├── models.py
│ ├── views.py
│ ├── auth.py
│ ├── templates/
│ └── static/
└── .gitignore


---

## ⚙️ Environment Variables

This project uses environment variables for security.

| Variable | Description |
|-------|------------|
| `DATABASE_URL` | PostgreSQL connection string |
| `SECRET_KEY` | Flask secret key |

Example:
```bash
export DATABASE_URL="postgresql://user:password@host:5432/dbname"
export SECRET_KEY="your_secret_key"
🚀 Deployment on AWS EC2
1️⃣ Launch EC2
Ubuntu 20.04 / 22.04

Open inbound ports:

22 (SSH)

5000 (Flask, temporary)

2️⃣ Clone the repo
git clone https://github.com/deku0002/python-rds-project.git
cd python-rds-project
3️⃣ Run the setup script
chmod +x setup_ec2.sh
./setup_ec2.sh
The script will:

Install all dependencies

Create a virtual environment

Ask for DATABASE_URL and SECRET_KEY

Export and persist them

Start the Flask app automatically

▶️ Running the App
After setup:

python main.py
Access in browser:

http://<EC2_PUBLIC_IP>:5000
🛡️ Security Notes
Database credentials are never hardcoded

Environment variables are used instead

.gitignore prevents secrets from being pushed

RDS should be restricted to EC2 security group only in production

🧪 Database Verification (Optional)
psql -h <rds-endpoint> -U postgres -d notes_app
\dt
📌 Future Improvements
Gunicorn + systemd

Nginx reverse proxy

HTTPS with SSL

CI/CD with GitHub Actions

Docker support

👨‍💻 Author
Devansh Sharma
Computer Science Undergraduate
Interested in Backend, Cloud, and Security

⭐ Acknowledgements
Flask Documentation

AWS RDS & EC2

PostgreSQL

📜 License
This project is open-source and available under the MIT License.


---

## ✅ What this README does well
- Recruiter-friendly
- Explains **cloud architecture**
- Shows **real deployment**
- Clean structure
- No secrets exposed

---

### Next smart upgrades (optional)
- Add **architecture diagram**
- Add **screenshots**
- Add **Gunicorn + Nginx** section

If you want, I can:
- Review your repo like a **recruiter**
- Optimize this README for **internship shortlisting**
- Add badges + screenshots

Just say the word 👌
