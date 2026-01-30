from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
import os

def generate_certificate(name):
    """
    Generates a PDF certificate (manual send later)
    """
    safe_name = name.replace(" ", "_")
    os.makedirs("certificates", exist_ok=True)

    file_path = f"certificates/{safe_name}_CloudCraft_Certificate.pdf"

    c = canvas.Canvas(file_path, pagesize=A4)
    width, height = A4

    c.setFont("Helvetica-Bold", 32)
    c.drawCentredString(width / 2, height - 150, "Certificate of Completion")

    c.setFont("Helvetica", 18)
    c.drawCentredString(width / 2, height - 220, "This is to certify that")

    c.setFont("Helvetica-Bold", 26)
    c.drawCentredString(width / 2, height - 270, name)

    c.setFont("Helvetica", 18)
    c.drawCentredString(width / 2, height - 320, "has successfully completed")

    c.setFont("Helvetica-Bold", 22)
    c.drawCentredString(width / 2, height - 360, "CloudCraft Workshop")

    c.setFont("Helvetica", 14)
    c.drawCentredString(
        width / 2,
        height - 430,
        "Hands-on Cloud Deployment using Flask, EC2 & RDS"
    )

    c.save()
    return file_path
