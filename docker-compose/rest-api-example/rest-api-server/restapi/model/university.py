from typing import List

from restapi.model.course import Course
from restapi.model.student import Student


class University:
    def __init__(self, name: str):
        self.courses: List[Course] = []
        self.name = name

    def course_exists(self, course_name):
        for course in self.courses:
            if course.name == course_name:
                return True
        else:
            return False

    def add_course(self, course_name: str, max_students) -> bool:
        new_course: Course = Course(name=course_name, max_students=max_students)
        if self.course_exists(course_name):
            return False
        else:
            self.courses.append(new_course)
            self.name = course_name
            return True

    def del_course(self, course_name: str):
        if self.course_exists(course_name):
            self.courses = list(filter(lambda c: c.name != course_name, self.courses))
            return True
        else:
            return False

    def add_student_to_course(self, student: Student, course_name: str) -> bool:
        for course in self.courses:
            if course.name == course_name:
                course.add_student(student)
                return True
        else:
            return False

    def del_student_from_course(self, student_id: str, course_name: str) -> bool:
        for course in self.courses:
            if course.name == course_name:
                course.del_student(student_id)
                return True
        else:
            return False
