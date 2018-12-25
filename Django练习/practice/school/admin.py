from django.contrib import admin
from .models import *

# Register your models here.
@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
    list_display = ("name","gender")

@admin.register(Course)
class CourseAdmin(admin.ModelAdmin):
    list_display = ("name","teacher")

@admin.register(Score)
class ScoreAdmin(admin.ModelAdmin):
    list_display = ("student","course","number")

@admin.register(Teacher)
class TeacherAdmin(admin.ModelAdmin):
    list_display = ("name",)
