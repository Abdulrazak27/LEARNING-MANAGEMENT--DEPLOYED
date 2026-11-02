from django.urls import path
from .views import *

urlpatterns = [
    # 🔐 AUTH
    path('auth/login/', login_user),
    path('auth/register/', register_user),
    path('auth/send-reset-code/', send_reset_code),
    path('auth/send-reset-code', send_reset_code),
    path('auth/verify-reset-code/', verify_reset_code),
    path('auth/verify-reset-code', verify_reset_code),
    path('auth/reset-password-confirm/', reset_password_confirm),
    path('auth/reset-password-confirm', reset_password_confirm),
    path('auth/forgot-password/', forgot_password),
    path('auth/forgot-password', forgot_password),

    # 📚 COURSES (GET list, POST create, GET detail, PUT update, DELETE delete)
    path('courses/', courses_collection),
    path('courses', courses_collection),
    path('courses/<str:course_id>/', course_item),
    path('courses/<str:course_id>', course_item),

    # 🎓 ENROLL
    path('enroll/', enroll_user),
    path('enroll/<str:user_id>/', get_user_enrollments),
    path('enroll/check/<str:user_id>/<str:course_id>/', check_enrollment),

    # 👤 USERS & ADMIN USER MANAGEMENT
    path('users/', admin_users_collection),
    path('users', admin_users_collection),
    path('users/<str:user_id>/', admin_user_item),
    path('users/<str:user_id>', admin_user_item),
    path('users/<str:user_id>/update/', update_user),
    path('users/<str:user_id>/profile-image/', get_profile_image),
    path('users/<str:user_id>/upload-image/', upload_profile_image),

    # 📊 LEARNING & PROGRESS
    path('learning/', get_all_learning),
    path('learning', get_all_learning),
    path('progress/<str:user_id>/<str:course_id>/', get_progress),
    path('progress/update/<str:user_id>/<str:course_id>/', update_progress),

    # ❓ QUESTIONS & QUIZZES
    path('questions/', questions_collection),
    path('questions', questions_collection),
    path('questions/course/<str:course_id>/', get_questions_by_course),
    path('questions/course/<str:course_id>', get_questions_by_course),
    path('questions/<str:question_id>/', question_item),
    path('questions/<str:question_id>', question_item),

    # 💬 FEEDBACK
    path('feedbacks/<str:course_id>/', get_feedbacks),
    path('feedbacks/', post_feedback),
    path('feedbacks', post_feedback),

    # 🗣️ DISCUSSIONS
    path('discussions/<str:course_id>/', get_discussions),
    path('discussions/', post_discussion),

    # 🏆 ASSESSMENT & PERFORMANCE
    path('assessments/performance/<str:user_id>/', get_performance),
    path('assessments/<str:course_id>/', get_assessment),
    path('assessments/', submit_assessment),
]