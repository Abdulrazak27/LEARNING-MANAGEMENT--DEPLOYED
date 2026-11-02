from django.db import models

class Course(models.Model):
    course_id = models.CharField(max_length=16, primary_key=True)
    course_name = models.CharField(max_length=255, null=True, blank=True)
    description = models.CharField(max_length=255, null=True, blank=True)
    instructor = models.CharField(max_length=255, null=True, blank=True)
    p_link = models.TextField(null=True, blank=True)
    price = models.IntegerField()
    y_link = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'course'
        managed = False