from restapi.model.student import Student
from restapi.model.university import University

uni = University("Info")
student = Student("001", "Mariano", "Capacchiolli", 2)


def test_university_course():
    uni.add_course("algebra", 20)
    assert uni.course_exists("algebra")


def test_university_student():
    uni.add_student_to_course(student, "algebra")
    uni.del_student_from_course(student.card_id, "algebra")
    assert len(uni.courses[0].students) == 0


def test_university_del():
    uni.del_course("algebra")
    assert not uni.course_exists("algebra")