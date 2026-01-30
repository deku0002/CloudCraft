# ☁️ CloudCraft – Linux × AWS Deployment Workshop

Welcome to **CloudCraft** 👋  
In this workshop, you will learn how to **deploy a live web application on AWS EC2 using Linux**.

This is a **hands-on cloud deployment experience**, designed to help you understand how real servers work on the internet.

---

## 🎯 Workshop Goal

By the end of this workshop, you will:

- Launch a **Linux EC2 server** on AWS
- Connect to it using **SSH**
- Deploy a **Flask web application**
- Run a **live website on a public IP**
- See your app working on the cloud 🎉

No prior cloud or backend knowledge is required.

---

## 🚀 What This App Does

- Displays a simple web form
- Accepts your **name and email**
- Shows a **Congratulations page** after submission
- Runs fully on your EC2 instance

You do **not** need to configure anything inside the app.

---

## 🛠️ Tech Used (Conceptual)

- **Linux (Ubuntu)**
- **Python**
- **Flask**
- **AWS EC2**

You do **NOT** need to know:
- Databases
- SQL
- Backend internals
- AWS advanced services

Everything complex is handled behind the scenes.

---

## 📂 Project Structure (Do Not Modify)

.
├── main.py
├── setup.sh
├── requirements.txt
├── website/
│ ├── init.py
│ ├── views.py
│ ├── models.py
│ └── templates/
│ ├── index.html
│ └── success.html
└── venv/


You will **not** edit these files during the workshop.

---

## ⚙️ Deployment Steps (Follow Exactly)

### 1️⃣ Clone the repository on your EC2 instance
```bash
git clone <repository-url>
cd python-rds-project
2️⃣ Make the setup script executable
chmod +x setup.sh
3️⃣ Run the setup script
./setup.sh
This will:

Install Python and required tools

Set up a virtual environment

Install all dependencies

⏳ This may take a few minutes.

4️⃣ Activate the virtual environment
source venv/bin/activate
5️⃣ Run the application
python main.py
6️⃣ Open your website in a browser
http://<YOUR_EC2_PUBLIC_IP>:5000
🎉 If the page loads, your deployment is successful.

