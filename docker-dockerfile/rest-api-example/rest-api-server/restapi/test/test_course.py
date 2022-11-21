# Run with > pytest
from restapi.model.course import Course
from restapi.model.student import Student

course = Course("algebra", 10)


def test_add_course():
    assert course.name == "algebra"


def test_add_student():
    student = Student("001", "Mariano", "Capacchiolli", 2)
    course.add_student(student)
    assert len(course.students) == 1


def test_remove_student():
    course.del_student("001")
    assert len(course.students) == 0
