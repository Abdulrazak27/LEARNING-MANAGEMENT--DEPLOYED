from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.db import connection
import jwt
import datetime
import random
from django.conf import settings
import bcrypt
import base64
import uuid


def safe_val(v):
    if isinstance(v, (bytes, bytearray, memoryview)):
        try:
            return v.tobytes().hex() if isinstance(v, memoryview) else v.hex()
        except:
            return None
    return v


def hex_to_binary(hex_str):
    try:
        hex_str = hex_str.replace("-", "")
        return bytes.fromhex(hex_str)
    except:
        return None


# =========================================================
# 🔐 REGISTER
# =========================================================
@api_view(['POST'])
def register_user(request):
    try:
        email = request.data.get("email")
        password = request.data.get("password")
        username = request.data.get("username", "")
        mobile_number = request.data.get("mobileNumber", "")
        dob = request.data.get("dob", "")
        gender = request.data.get("gender", "")
        location = request.data.get("location", "")
        profession = request.data.get("profession", "")
        linkedin_url = request.data.get("linkedin_url", "")
        github_url = request.data.get("github_url", "")

        if not email or not password:
            return Response({"success": False, "error": "Email & password required"})

        hashed_password = bcrypt.hashpw(password.encode(), bcrypt.gensalt()).decode()

        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM users WHERE email=%s", [email])
            if cursor.fetchone():
                return Response({"success": False, "error": "User already exists"})

            user_id = uuid.uuid4().bytes

            cursor.execute("""
                INSERT INTO users (id, email, password, role, username, mobile_number,
                                   dob, gender, location, profession, linkedin_url,
                                   github_url, created_at)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, NOW())
            """, [
                user_id, email, hashed_password, "USER",
                username or email.split("@")[0],
                mobile_number, dob, gender, location,
                profession, linkedin_url, github_url
            ])

        return Response({"success": True, "message": "User registered successfully"})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


# =========================================================
# 🔐 LOGIN
# =========================================================
@api_view(['POST'])
def login_user(request):
    login_id = (request.data.get("email") or request.data.get("username") or "").strip()
    password = request.data.get("password")

    try:
        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT id, password, email, role, username
                FROM users
                WHERE email = %s OR username = %s
            """, [login_id, login_id])

            row = cursor.fetchone()

            if not row:
                return Response({"success": False, "error": "User not found"})

            user_id, db_password, user_email, role, username = row

            if not bcrypt.checkpw(password.encode(), db_password.encode()):
                return Response({"success": False, "error": "Invalid password"})

            payload = {
                "user_id": safe_val(user_id),
                "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=24),
                "iat": datetime.datetime.utcnow()
            }

            token = jwt.encode(payload, settings.SECRET_KEY, algorithm="HS256")

            return Response({
                "success": True,
                "data": {
                    "token": token,
                    "id": safe_val(user_id),
                    "name": username or "",
                    "email": user_email,
                    "role": role
                }
            })

    except Exception as e:
        return Response({"success": False, "error": str(e)})


# =========================================================
# 📚 COURSES
# =========================================================
@api_view(['GET'])
def get_courses(request):
    try:
        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT course_id, course_name, description, instructor, p_link, price, y_link
                FROM course
            """)
            columns = [col[0] for col in cursor.description]
            rows = cursor.fetchall()

        data = []
        for row in rows:
            item = {}
            for col, val in zip(columns, row):
                item[col] = safe_val(val)
            data.append(item)

        return Response({"success": True, "data": data})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['GET'])
def get_course_detail(request, course_id):
    try:
        binary_id = hex_to_binary(course_id)

        if not binary_id:
            return Response({"success": False, "error": "Invalid ID"})

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT course_id, course_name, description, instructor, p_link, price, y_link
                FROM course
                WHERE course_id = %s
            """, [binary_id])

            row = cursor.fetchone()

            if not row:
                return Response({"success": False, "error": "Not found"})

            columns = [col[0] for col in cursor.description]

        data = {}
        for col, val in zip(columns, row):
            data[col] = safe_val(val)

        return Response({"success": True, "data": data})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


# =========================================================
# 🎓 ENROLL — ✅ FIXED with uuid id
# =========================================================
@api_view(['POST'])
def enroll_user(request):
    try:
        user_id = request.data.get("user_id")
        course_id = request.data.get("course_id")

        user_bin = hex_to_binary(user_id)
        course_bin = hex_to_binary(course_id)

        if not user_bin or not course_bin:
            return Response({"success": False, "error": "Invalid IDs"})

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT * FROM learning
                WHERE user_id = %s AND course_id = %s
            """, [user_bin, course_bin])

            if cursor.fetchone():
                return Response({"success": True, "message": "Already enrolled"})

            cursor.execute("""
                INSERT INTO learning (id, user_id, course_id)
                VALUES (%s, %s, %s)
            """, [uuid.uuid4().bytes, user_bin, course_bin])

        return Response({"success": True, "message": "Enrolled successfully"})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['GET'])
def get_user_enrollments(request, user_id):
    try:
        user_bin = hex_to_binary(user_id)

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT c.course_id, c.course_name, c.description, c.instructor, c.p_link, c.price, c.y_link
                FROM learning l
                JOIN course c ON l.course_id = c.course_id
                WHERE l.user_id = %s
            """, [user_bin])

            columns = [col[0] for col in cursor.description]
            rows = cursor.fetchall()

        data = []
        for row in rows:
            item = {}
            for col, val in zip(columns, row):
                item[col] = safe_val(val)
            data.append(item)

        return Response({"success": True, "data": data})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['GET'])
def check_enrollment(request, user_id, course_id):
    try:
        user_bin = hex_to_binary(user_id)
        course_bin = hex_to_binary(course_id)

        if not user_bin or not course_bin:
            return Response({"success": False, "error": "Invalid IDs"})

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT * FROM learning
                WHERE user_id = %s AND course_id = %s
            """, [user_bin, course_bin])

            exists = cursor.fetchone() is not None

        return Response({"success": True, "enrolled": exists})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


# =========================================================
# 👤 USER PROFILE
# =========================================================
@api_view(['GET'])
def get_user_details(request, user_id):
    try:
        user_bin = hex_to_binary(user_id)

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT id, email, role, username, mobile_number, gender, dob,
                       profession, location, linkedin_url, github_url
                FROM users
                WHERE id = %s
            """, [user_bin])

            row = cursor.fetchone()

            if not row:
                return Response({"success": False, "error": "User not found"})

            columns = [col[0] for col in cursor.description]
            user_data = {}
            for col, val in zip(columns, row):
                user_data[col] = safe_val(val)

            cursor.execute("SELECT COUNT(*) FROM learning WHERE user_id = %s", [user_bin])
            count_row = cursor.fetchone()
            learning_count = count_row[0] if count_row else 0

        user_data["learningCourses"] = [None] * learning_count

        return Response({"success": True, "data": user_data})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['PUT'])
def update_user(request, user_id):
    try:
        user_bin = hex_to_binary(user_id)
        data = request.data

        with connection.cursor() as cursor:
            cursor.execute("""
                UPDATE users SET
                    username = %s,
                    mobile_number = %s,
                    gender = %s,
                    dob = %s,
                    profession = %s,
                    location = %s,
                    linkedin_url = %s,
                    github_url = %s,
                    updated_at = NOW()
                WHERE id = %s
            """, [
                data.get("username"),
                data.get("mobileNumber"),
                data.get("gender"),
                data.get("dob"),
                data.get("profession"),
                data.get("location"),
                data.get("linkedin_url"),
                data.get("github_url"),
                user_bin
            ])

        return Response({"success": True, "message": "Profile updated"})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['GET'])
def get_profile_image(request, user_id):
    try:
        user_bin = hex_to_binary(user_id)

        with connection.cursor() as cursor:
            cursor.execute("SELECT profile_image FROM users WHERE id = %s", [user_bin])
            row = cursor.fetchone()

        if not row or not row[0]:
            return Response({"success": True, "image": None})

        image_data = row[0]
        if isinstance(image_data, memoryview):
            image_data = bytes(image_data)

        encoded = base64.b64encode(image_data).decode("utf-8")
        return Response({
            "success": True,
            "image": f"data:image/jpeg;base64,{encoded}"
        })

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['POST'])
def upload_profile_image(request, user_id):
    try:
        user_bin = hex_to_binary(user_id)
        file = request.FILES.get("file")

        if not file:
            return Response({"success": False, "error": "No file provided"})

        image_bytes = file.read()

        with connection.cursor() as cursor:
            cursor.execute("""
                UPDATE users SET profile_image = %s WHERE id = %s
            """, [image_bytes, user_bin])

        return Response({"success": True, "message": "Image uploaded"})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


# =========================================================
# 📊 PROGRESS
# =========================================================
@api_view(['GET'])
def get_progress(request, user_id, course_id):
    try:
        user_bin = hex_to_binary(user_id)
        course_bin = hex_to_binary(course_id)

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT played_time, duration FROM progress
                WHERE user_id = %s AND course_id = %s
            """, [user_bin, course_bin])
            row = cursor.fetchone()

        if row and row[1] and row[1] > 0:
            percent = round((row[0] / row[1]) * 100)
        else:
            percent = 0

        return Response({"success": True, "progress": percent})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['POST'])
def update_progress(request, user_id, course_id):
    try:
        user_bin = hex_to_binary(user_id)
        course_bin = hex_to_binary(course_id)
        played_time = request.data.get("played_time", 0)
        duration = request.data.get("duration", 0)

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT id FROM progress
                WHERE user_id = %s AND course_id = %s
            """, [user_bin, course_bin])
            exists = cursor.fetchone()

            if exists:
                cursor.execute("""
                    UPDATE progress SET played_time = %s, duration = %s
                    WHERE user_id = %s AND course_id = %s
                """, [played_time, duration, user_bin, course_bin])
            else:
                cursor.execute("""
                    INSERT INTO progress (id, played_time, duration, user_id, course_id)
                    VALUES (%s, %s, %s, %s, %s)
                """, [uuid.uuid4().bytes, played_time, duration, user_bin, course_bin])

        return Response({"success": True, "message": "Progress updated"})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


# =========================================================
# 💬 FEEDBACK
# =========================================================
@api_view(['GET'])
def get_feedbacks(request, course_id):
    try:
        course_bin = hex_to_binary(course_id)

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT id, comment, course_id FROM feedback
                WHERE course_id = %s
            """, [course_bin])

            columns = [col[0] for col in cursor.description]
            rows = cursor.fetchall()

        data = []
        for row in rows:
            item = {}
            for col, val in zip(columns, row):
                item[col] = safe_val(val)
            data.append(item)

        return Response({"success": True, "data": data})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['GET', 'POST'])
def post_feedback(request):
    try:
        if request.method == 'GET':
            with connection.cursor() as cursor:
                cursor.execute("""
                    SELECT f.id, f.comment, f.course_id, c.course_name
                    FROM feedback f
                    LEFT JOIN course c ON f.course_id = c.course_id
                """)
                columns = [col[0] for col in cursor.description]
                rows = cursor.fetchall()

            data = []
            for row in rows:
                item = {col: safe_val(val) for col, val in zip(columns, row)}
                data.append(item)

            return Response({"success": True, "data": data})

        elif request.method == 'POST':
            course_id = request.data.get("course_id")
            comment = request.data.get("message") or request.data.get("comment")
            course_bin = hex_to_binary(course_id)

            with connection.cursor() as cursor:
                cursor.execute("""
                    INSERT INTO feedback (id, comment, course_id)
                    VALUES (%s, %s, %s)
                """, [uuid.uuid4().bytes, comment, course_bin])

            return Response({"success": True, "message": "Feedback posted"})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


# =========================================================
# 🗣️ DISCUSSION
# =========================================================
@api_view(['GET'])
def get_discussions(request, course_id):
    try:
        course_bin = hex_to_binary(course_id)

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT id, content, time, user_name, course_id FROM discussion
                WHERE course_id = %s
                ORDER BY time DESC
            """, [course_bin])

            columns = [col[0] for col in cursor.description]
            rows = cursor.fetchall()

        data = []
        for row in rows:
            item = {}
            for col, val in zip(columns, row):
                item[col] = safe_val(val)
            data.append(item)

        return Response({"success": True, "data": data})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['POST'])
def post_discussion(request):
    try:
        course_id = request.data.get("course_id")
        content = request.data.get("message") or request.data.get("content")
        user_name = request.data.get("user_name", "Anonymous")
        course_bin = hex_to_binary(course_id)

        with connection.cursor() as cursor:
            cursor.execute("""
                INSERT INTO discussion (id, content, time, user_name, course_id)
                VALUES (%s, %s, NOW(), %s, %s)
            """, [uuid.uuid4().bytes, content, user_name, course_bin])

        return Response({"success": True, "message": "Message posted"})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


# =========================================================
# 🏆 ASSESSMENT & QUESTIONS
# =========================================================
@api_view(['GET'])
def get_performance(request, user_id):
    try:
        user_bin = hex_to_binary(user_id)

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT a.id, a.marks, a.course_id, c.course_name
                FROM assessment a
                JOIN course c ON a.course_id = c.course_id
                WHERE a.user_id = %s
            """, [user_bin])

            columns = [col[0] for col in cursor.description]
            rows = cursor.fetchall()

        data = []
        for row in rows:
            item = {}
            for col, val in zip(columns, row):
                item[col] = safe_val(val)
            data.append(item)

        return Response({"success": True, "data": data})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['GET'])
def get_assessment(request, course_id):
    try:
        course_bin = hex_to_binary(course_id)

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT id, question, option1, option2, option3, option4, answer
                FROM questions
                WHERE course_id = %s
            """, [course_bin])

            columns = [col[0] for col in cursor.description]
            rows = cursor.fetchall()

        data = []
        for row in rows:
            item = {}
            for col, val in zip(columns, row):
                item[col] = safe_val(val)
            data.append(item)

        return Response({"success": True, "data": data})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['POST'])
def submit_assessment(request):
    try:
        user_id = request.data.get("user_id")
        course_id = request.data.get("course_id")
        marks = request.data.get("marks") or request.data.get("score", 0)

        user_bin = hex_to_binary(user_id)
        course_bin = hex_to_binary(course_id)

        with connection.cursor() as cursor:
            cursor.execute("""
                INSERT INTO assessment (id, marks, user_id, course_id)
                VALUES (%s, %s, %s, %s)
            """, [uuid.uuid4().bytes, marks, user_bin, course_bin])

        return Response({"success": True, "message": "Assessment submitted"})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


# =========================================================
# 🔑 FORGOT PASSWORD & 2-STEP / OTP VERIFICATION FLOW
# =========================================================
@api_view(['POST'])
def send_reset_code(request):
    try:
        query_input = (
            request.data.get("identifier") or
            request.data.get("email") or
            request.data.get("username") or
            request.data.get("mobile_number") or ""
        ).strip()

        if not query_input:
            return Response({"success": False, "error": "Please enter your mobile number, username, or email."})

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT id, email, username, mobile_number
                FROM users
                WHERE email = %s OR username = %s OR mobile_number = %s
            """, [query_input, query_input, query_input])
            row = cursor.fetchone()
            if not row:
                return Response({
                    "success": False,
                    "error": "No account found matching this mobile number, username, or email."
                })

            user_id, user_email, user_name, mobile_num = row

        code = f"{random.randint(100000, 999999)}"
        request_id = f"REQ-{uuid.uuid4().hex[:8].upper()}"
        notification_target = "devtrio98@gmail.com"
        expires_at = datetime.datetime.now() + datetime.timedelta(minutes=15)

        with connection.cursor() as cursor:
            cursor.execute("""
                INSERT INTO password_resets (id, email, admin_email, otp_code, expires_at, status, created_at)
                VALUES (%s, %s, %s, %s, %s, %s, NOW())
            """, [request_id, user_email, notification_target, code, expires_at, "OTP_SENT"])

        # Format masked email e.g. "d***8@gmail.com"
        parts = user_email.split('@')
        if len(parts) == 2 and len(parts[0]) > 2:
            masked_email = f"{parts[0][0]}***{parts[0][-1]}@{parts[1]}"
        else:
            masked_email = user_email

        subject = f"[Nexora LMS] Your Password Reset Confirmation Code: {code}"
        message_body = (
            f"Hello {user_name or 'Learner'},\n\n"
            f"We received a request to reset the password for your Nexora LMS account ({user_email}).\n\n"
            f"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
            f"CONFIRMATION CODE:  {code}\n"
            f"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n"
            f"This code will expire in 15 minutes.\n\n"
            f"AUDIT DETAILS:\n"
            f"• Request ID: {request_id}\n"
            f"• Target Account: {user_email}\n"
            f"• Security Copy Dispatched To: {notification_target}\n"
            f"• Status: Pending OTP Verification\n\n"
            f"If you did not request a password reset, please ignore this email or review your account credentials.\n\n"
            f"Best regards,\n"
            f"Nexora LMS Security Team"
        )

        try:
            from django.core.mail import send_mail
            recipients = [user_email]
            if notification_target.lower() != user_email.lower():
                recipients.append(notification_target)
            send_mail(
                subject,
                message_body,
                getattr(settings, 'DEFAULT_FROM_EMAIL', 'noreply@nexora.lms'),
                recipients,
                fail_silently=True
            )
        except Exception as mail_err:
            print("Email dispatch notice:", mail_err)

        return Response({
            "success": True,
            "message": f"Confirmation code sent! Please check your email inbox at {user_email}.",
            "user_email": user_email,
            "masked_email": masked_email,
            "username": user_name,
            "notification_target": notification_target,
            "request_id": request_id,
            "expires_in_minutes": 15
        })

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['POST'])
def verify_reset_code(request):
    try:
        email = (request.data.get("email") or "").strip()
        code = (request.data.get("code") or "").strip()

        if not email or not code:
            return Response({"success": False, "error": "Email and 6-digit verification code required."})

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT id, otp_code, expires_at, status
                FROM password_resets
                WHERE (email = %s OR id = %s)
                ORDER BY created_at DESC
                LIMIT 1
            """, [email, email])
            row = cursor.fetchone()

            if not row:
                return Response({"success": False, "error": "No active reset request found. Please request a new code."})

            req_id, db_code, expires_at, status = row

            if str(db_code).strip() != str(code).strip():
                return Response({"success": False, "error": "Invalid verification code. Please check and try again."})

            if expires_at and datetime.datetime.now() > expires_at:
                return Response({"success": False, "error": "Verification code has expired. Please request a new one."})

            cursor.execute("""
                UPDATE password_resets
                SET status = 'OTP_VERIFIED'
                WHERE id = %s
            """, [req_id])

        return Response({
            "success": True,
            "message": "Verification code confirmed! Please create your new password.",
            "email": email,
            "request_id": req_id
        })

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['POST'])
def reset_password_confirm(request):
    try:
        email = (request.data.get("email") or "").strip()
        code = (request.data.get("code") or "").strip()
        new_password = request.data.get("new_password") or request.data.get("password")

        if not email or not new_password:
            return Response({"success": False, "error": "Email and new password required."})

        if len(new_password) < 6:
            return Response({"success": False, "error": "Password must be at least 6 characters long."})

        with connection.cursor() as cursor:
            cursor.execute("SELECT id, email, username FROM users WHERE email = %s OR username = %s", [email, email])
            user_row = cursor.fetchone()
            if not user_row:
                return Response({"success": False, "error": "User account not found."})

            user_id, user_email, user_name = user_row

            if code:
                cursor.execute("""
                    SELECT id FROM password_resets
                    WHERE email = %s AND otp_code = %s AND status IN ('OTP_SENT', 'OTP_VERIFIED')
                    ORDER BY created_at DESC LIMIT 1
                """, [user_email, code])
                if not cursor.fetchone():
                    return Response({"success": False, "error": "Invalid or expired reset session. Please request a new code."})

            hashed_password = bcrypt.hashpw(new_password.encode(), bcrypt.gensalt()).decode()
            cursor.execute("""
                UPDATE users SET password = %s, updated_at = NOW()
                WHERE id = %s
            """, [hashed_password, user_id])

            notification_target = "devtrio98@gmail.com"
            request_id = f"REQ-{uuid.uuid4().hex[:8].upper()}"
            cursor.execute("""
                INSERT INTO password_resets (id, email, admin_email, otp_code, status, created_at)
                VALUES (%s, %s, %s, %s, 'RESET_COMPLETED', NOW())
            """, [request_id, user_email, notification_target, code or "COMPLETED"])

        # Send final confirmation email
        subject = f"[Nexora LMS] Password Reset Successful - {user_email}"
        message_body = (
            f"Hello {user_name or 'Learner'},\n\n"
            f"Your Nexora LMS password has been successfully reset and updated.\n\n"
            f"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
            f"CONFIRMATION DETAILS:\n"
            f"• Account: {user_email}\n"
            f"• Username: {user_name}\n"
            f"• Admin Notification: {notification_target}\n"
            f"• Status: Password Changed & Secured\n"
            f"• Timestamp: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
            f"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n"
            f"If you did not perform this change, please contact platform administration immediately.\n\n"
            f"Best regards,\n"
            f"Nexora LMS Security System"
        )

        try:
            from django.core.mail import send_mail
            send_mail(
                subject,
                message_body,
                'noreply@nexora.lms',
                [notification_target, user_email],
                fail_silently=True
            )
        except Exception:
            pass

        return Response({
            "success": True,
            "message": f"Password reset successfully! Confirmation dispatched to {notification_target}.",
            "notification_target": notification_target,
            "user_email": user_email,
            "request_id": request_id,
            "email_subject": subject,
            "email_body": message_body,
            "timestamp": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        })

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['POST'])
def forgot_password(request):
    try:
        login_input = (request.data.get("email") or request.data.get("username") or "").strip()
        new_password = request.data.get("new_password") or request.data.get("password")

        if not login_input or not new_password:
            return Response({"success": False, "error": "Email and new password required"})

        with connection.cursor() as cursor:
            cursor.execute("SELECT id, email, username FROM users WHERE email = %s OR username = %s", [login_input, login_input])
            row = cursor.fetchone()
            if not row:
                return Response({"success": False, "error": "User with this email not found"})

            user_id, user_email, user_name = row

            hashed_password = bcrypt.hashpw(new_password.encode(), bcrypt.gensalt()).decode()
            cursor.execute("""
                UPDATE users SET password = %s, updated_at = NOW()
                WHERE id = %s
            """, [hashed_password, user_id])

        notification_target = "devtrio98@gmail.com"
        subject = f"[Nexora LMS] Password Reset Request - {user_email}"
        message_body = (
            f"Hello,\n\n"
            f"A password reset request has been processed on the Nexora LMS platform.\n\n"
            f"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
            f"REQUEST DETAILS:\n"
            f"• Target Email: {user_email}\n"
            f"• Account Username: {user_name}\n"
            f"• Notification Sent To: {notification_target}\n"
            f"• Status: Password successfully updated and verified\n"
            f"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n"
            f"If you did not initiate this request, please review platform credentials immediately.\n\n"
            f"Best regards,\n"
            f"Nexora LMS Security System"
        )
        try:
            from django.core.mail import send_mail
            send_mail(
                subject,
                message_body,
                'noreply@nexora.lms',
                [notification_target, user_email],
                fail_silently=True
            )
        except Exception:
            pass

        request_id = f"REQ-{uuid.uuid4().hex[:8].upper()}"
        with connection.cursor() as cursor:
            cursor.execute("""
                INSERT INTO password_resets (id, email, admin_email, status, created_at)
                VALUES (%s, %s, %s, %s, NOW())
            """, [request_id, user_email, notification_target, "RESET_COMPLETED"])

        return Response({
            "success": True,
            "message": f"Password reset successfully! Request notification email has been dispatched to {notification_target}.",
            "notification_target": notification_target,
            "user_email": user_email,
            "request_id": request_id,
            "email_subject": subject,
            "email_body": message_body,
            "timestamp": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        })

    except Exception as e:
        return Response({"success": False, "error": str(e)})


# =========================================================
# 👥 ADMIN USER MANAGEMENT
# =========================================================
@api_view(['GET', 'POST'])
def admin_users_collection(request):
    try:
        if request.method == 'GET':
            with connection.cursor() as cursor:
                cursor.execute("""
                    SELECT id, email, role, username, mobile_number, gender, dob,
                           profession, location, linkedin_url, github_url, is_active, created_at
                    FROM users
                    ORDER BY created_at DESC
                """)
                columns = [col[0] for col in cursor.description]
                rows = cursor.fetchall()

            data = []
            for row in rows:
                item = {}
                for col, val in zip(columns, row):
                    if col == 'is_active':
                        item['isActive'] = bool(val) if val is not None else True
                    elif col == 'mobile_number':
                        item['mobileNumber'] = val
                    else:
                        item[col] = safe_val(val)
                data.append(item)

            return Response({"success": True, "data": data})

        elif request.method == 'POST':
            email = request.data.get("email")
            password = request.data.get("password") or "Password@123"
            username = request.data.get("username") or (email.split("@")[0] if email else "")
            role = request.data.get("role") or "USER"
            mobile_number = request.data.get("mobileNumber", "")
            profession = request.data.get("profession", "")
            location = request.data.get("location", "")

            if not email:
                return Response({"success": False, "error": "Email is required"})

            hashed = bcrypt.hashpw(password.encode(), bcrypt.gensalt()).decode()
            user_id = uuid.uuid4().bytes

            with connection.cursor() as cursor:
                cursor.execute("SELECT id FROM users WHERE email = %s", [email])
                if cursor.fetchone():
                    return Response({"success": False, "error": "User already exists"})

                cursor.execute("""
                    INSERT INTO users (id, email, password, role, username, mobile_number,
                                       profession, location, is_active, created_at)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, 1, NOW())
                """, [user_id, email, hashed, role, username, mobile_number, profession, location])

            return Response({"success": True, "message": "User created successfully", "id": safe_val(user_id)})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['GET', 'PUT', 'DELETE'])
def admin_user_item(request, user_id):
    try:
        user_bin = hex_to_binary(user_id)
        if not user_bin:
            return Response({"success": False, "error": "Invalid user ID"})

        if request.method == 'GET':
            with connection.cursor() as cursor:
                cursor.execute("""
                    SELECT id, email, role, username, mobile_number, gender, dob,
                           profession, location, linkedin_url, github_url
                    FROM users
                    WHERE id = %s
                """, [user_bin])
                row = cursor.fetchone()
                if not row:
                    return Response({"success": False, "error": "User not found"})
                columns = [col[0] for col in cursor.description]
                user_data = {}
                for col, val in zip(columns, row):
                    user_data[col] = safe_val(val)
                cursor.execute("SELECT COUNT(*) FROM learning WHERE user_id = %s", [user_bin])
                count_row = cursor.fetchone()
                learning_count = count_row[0] if count_row else 0
            user_data["learningCourses"] = [None] * learning_count
            return Response({"success": True, "data": user_data})

        elif request.method == 'PUT':
            data = request.data
            with connection.cursor() as cursor:
                is_active_val = 1 if data.get("isActive", True) else 0
                role_val = data.get("role")
                cursor.execute("""
                    UPDATE users SET
                        username = COALESCE(%s, username),
                        email = COALESCE(%s, email),
                        mobile_number = COALESCE(%s, mobile_number),
                        gender = COALESCE(%s, gender),
                        dob = COALESCE(%s, dob),
                        profession = COALESCE(%s, profession),
                        location = COALESCE(%s, location),
                        linkedin_url = COALESCE(%s, linkedin_url),
                        github_url = COALESCE(%s, github_url),
                        role = COALESCE(%s, role),
                        is_active = %s,
                        updated_at = NOW()
                    WHERE id = %s
                """, [
                    data.get("username"),
                    data.get("email"),
                    data.get("mobileNumber"),
                    data.get("gender"),
                    data.get("dob"),
                    data.get("profession"),
                    data.get("location"),
                    data.get("linkedin_url"),
                    data.get("github_url"),
                    role_val,
                    is_active_val,
                    user_bin
                ])
            return Response({"success": True, "message": "User updated successfully"})

        elif request.method == 'DELETE':
            with connection.cursor() as cursor:
                cursor.execute("DELETE FROM assessment WHERE user_id = %s", [user_bin])
                cursor.execute("DELETE FROM progress WHERE user_id = %s", [user_bin])
                cursor.execute("DELETE FROM learning WHERE user_id = %s", [user_bin])
                cursor.execute("DELETE FROM users WHERE id = %s", [user_bin])
            return Response({"success": True, "message": "User deleted successfully"})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


# =========================================================
# 📚 ADMIN COURSE MANAGEMENT (POST, PUT, DELETE)
# =========================================================
@api_view(['GET', 'POST'])
def courses_collection(request):
    if request.method == 'GET':
        try:
            with connection.cursor() as cursor:
                cursor.execute("""
                    SELECT course_id, course_name, description, instructor, p_link, price, y_link
                    FROM course
                """)
                columns = [col[0] for col in cursor.description]
                rows = cursor.fetchall()

            data = []
            for row in rows:
                item = {}
                for col, val in zip(columns, row):
                    item[col] = safe_val(val)
                data.append(item)

            return Response({"success": True, "data": data})
        except Exception as e:
            return Response({"success": False, "error": str(e)})

    elif request.method == 'POST':
        try:
            data = request.data
            course_name = data.get("course_name")
            description = data.get("description", "")
            instructor = data.get("instructor", "Admin")
            p_link = data.get("p_link", "")
            y_link = data.get("y_link", "")
            price = data.get("price", 0) or 0

            if not course_name:
                return Response({"success": False, "error": "Course name is required"})

            course_id = uuid.uuid4().bytes

            with connection.cursor() as cursor:
                cursor.execute("""
                    INSERT INTO course (course_id, course_name, description, instructor, p_link, price, y_link)
                    VALUES (%s, %s, %s, %s, %s, %s, %s)
                """, [course_id, course_name, description, instructor, p_link, price, y_link])

            return Response({
                "success": True,
                "message": "Course created successfully",
                "data": {"course_id": safe_val(course_id), "course_name": course_name}
            })

        except Exception as e:
            return Response({"success": False, "error": str(e)})


@api_view(['GET', 'PUT', 'DELETE'])
def course_item(request, course_id):
    try:
        binary_id = hex_to_binary(course_id)
        if not binary_id:
            return Response({"success": False, "error": "Invalid course ID"})

        if request.method == 'GET':
            with connection.cursor() as cursor:
                cursor.execute("""
                    SELECT course_id, course_name, description, instructor, p_link, price, y_link
                    FROM course
                    WHERE course_id = %s
                """, [binary_id])
                row = cursor.fetchone()
                if not row:
                    return Response({"success": False, "error": "Not found"})
                columns = [col[0] for col in cursor.description]
            data = {col: safe_val(val) for col, val in zip(columns, row)}
            return Response({"success": True, "data": data})

        elif request.method == 'PUT':
            data = request.data
            with connection.cursor() as cursor:
                cursor.execute("""
                    UPDATE course SET
                        course_name = COALESCE(%s, course_name),
                        description = COALESCE(%s, description),
                        instructor = COALESCE(%s, instructor),
                        p_link = COALESCE(%s, p_link),
                        y_link = COALESCE(%s, y_link),
                        price = COALESCE(%s, price)
                    WHERE course_id = %s
                """, [
                    data.get("course_name"),
                    data.get("description"),
                    data.get("instructor"),
                    data.get("p_link"),
                    data.get("y_link"),
                    data.get("price", 0),
                    binary_id
                ])
            return Response({"success": True, "message": "Course updated successfully"})

        elif request.method == 'DELETE':
            with connection.cursor() as cursor:
                cursor.execute("DELETE FROM questions WHERE course_id = %s", [binary_id])
                cursor.execute("DELETE FROM assessment WHERE course_id = %s", [binary_id])
                cursor.execute("DELETE FROM progress WHERE course_id = %s", [binary_id])
                cursor.execute("DELETE FROM learning WHERE course_id = %s", [binary_id])
                cursor.execute("DELETE FROM course WHERE course_id = %s", [binary_id])
            return Response({"success": True, "message": "Course deleted successfully"})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


# =========================================================
# 📊 ALL LEARNING / ENROLLMENTS (FOR ADMIN STATS)
# =========================================================
@api_view(['GET'])
def get_all_learning(request):
    try:
        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT l.id, l.user_id, l.course_id, c.course_name, u.username, u.email
                FROM learning l
                LEFT JOIN course c ON l.course_id = c.course_id
                LEFT JOIN users u ON l.user_id = u.id
            """)
            columns = [col[0] for col in cursor.description]
            rows = cursor.fetchall()

        data = []
        for row in rows:
            item = {}
            for col, val in zip(columns, row):
                item[col] = safe_val(val)
            data.append(item)

        return Response({"success": True, "data": data})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


# =========================================================
# ❓ QUESTION / QUIZ MANAGEMENT (FOR ADMIN & ASSESSMENTS)
# =========================================================
@api_view(['GET', 'POST'])
def questions_collection(request):
    try:
        if request.method == 'GET':
            with connection.cursor() as cursor:
                cursor.execute("SELECT id, question, option1, option2, option3, option4, answer, course_id FROM questions")
                columns = [col[0] for col in cursor.description]
                rows = cursor.fetchall()
            data = []
            for row in rows:
                item = {col: safe_val(val) for col, val in zip(columns, row)}
                data.append(item)
            return Response({"success": True, "data": data})

        elif request.method == 'POST':
            data = request.data
            course_id = data.get("course_id") or data.get("courseId")
            course_bin = hex_to_binary(course_id)
            if not course_bin:
                return Response({"success": False, "error": "Invalid course ID"})

            qid = uuid.uuid4().bytes
            with connection.cursor() as cursor:
                cursor.execute("""
                    INSERT INTO questions (id, question, option1, option2, option3, option4, answer, course_id)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                """, [
                    qid,
                    data.get("question"),
                    data.get("option1"),
                    data.get("option2"),
                    data.get("option3"),
                    data.get("option4"),
                    data.get("answer"),
                    course_bin
                ])
            return Response({"success": True, "message": "Question created successfully", "id": safe_val(qid)})

    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['GET'])
def get_questions_by_course(request, course_id):
    try:
        course_bin = hex_to_binary(course_id)
        if not course_bin:
            return Response({"success": False, "error": "Invalid course ID"})
        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT id, question, option1, option2, option3, option4, answer
                FROM questions
                WHERE course_id = %s
            """, [course_bin])
            columns = [col[0] for col in cursor.description]
            rows = cursor.fetchall()
        data = []
        for row in rows:
            data.append({col: safe_val(val) for col, val in zip(columns, row)})
        return Response({"success": True, "data": data})
    except Exception as e:
        return Response({"success": False, "error": str(e)})


@api_view(['GET', 'PUT', 'DELETE'])
def question_item(request, question_id):
    try:
        q_bin = hex_to_binary(question_id)
        if not q_bin:
            return Response({"success": False, "error": "Invalid question ID"})

        if request.method == 'GET':
            with connection.cursor() as cursor:
                cursor.execute("SELECT id, question, option1, option2, option3, option4, answer, course_id FROM questions WHERE id = %s", [q_bin])
                row = cursor.fetchone()
                if not row:
                    return Response({"success": False, "error": "Question not found"}, status=404)
                columns = [col[0] for col in cursor.description]
                item = {col: safe_val(val) for col, val in zip(columns, row)}
            return Response({"success": True, "data": item})

        elif request.method == 'PUT':
            data = request.data
            with connection.cursor() as cursor:
                cursor.execute("""
                    UPDATE questions SET
                        question = COALESCE(%s, question),
                        option1 = COALESCE(%s, option1),
                        option2 = COALESCE(%s, option2),
                        option3 = COALESCE(%s, option3),
                        option4 = COALESCE(%s, option4),
                        answer = COALESCE(%s, answer)
                    WHERE id = %s
                """, [
                    data.get("question"),
                    data.get("option1"),
                    data.get("option2"),
                    data.get("option3"),
                    data.get("option4"),
                    data.get("answer"),
                    q_bin
                ])
            return Response({"success": True, "message": "Question updated successfully"})

        elif request.method == 'DELETE':
            with connection.cursor() as cursor:
                cursor.execute("DELETE FROM questions WHERE id = %s", [q_bin])
            return Response({"success": True, "message": "Question deleted successfully"})

    except Exception as e:
        return Response({"success": False, "error": str(e)})