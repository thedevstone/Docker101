import sys

sys.path.append("")

import json
from flask import Flask, request
from restapi.model.student import Student
from restapi.model.university import University

app = Flask(__name__)

model = University("Unibo")


@app.route("/")
def hello_world():
    return "Hello world"


@app.route("/add-course", methods=["PUT"])
def add_course():
    data = request.get_json()
    course_name = data["name"]
    course_dimension = data["max_students"]
    res = model.add_course(course_name, course_dimension)
    if res:
        return '', 201
    else:
        return 'Data is invalid insert course name and dimension', 400


@app.route("/del-course", methods=["DELETE"])
def del_course():
    data = request.get_json()
    course_name = data["name"]
    res = model.del_course(course_name)
    if res:
        return '', 200
    else:
        return f'Cannot find the course with name {course_name}', 404


@app.route("/add-student", methods=["PUT"])
def add_student():
    data = request.get_json()
    course_name = data["course_name"]
    student_name = data["student_name"]
    student_surname = data["student_surname"]
    student_year = data["student_year"]
    student_id = data["student_card_id"]
    student = Student(card_id=student_id, name=student_name, surname=student_surname, year=student_year)
    res = model.add_student_to_course(student, course_name)
    if res:
        return '', 201
    else:
        return f"Cannot create student, check if course is present", 400


@app.route("/del-student", methods=["DELETE"])
def del_student():
    data = request.get_json()
    course_name = data["course_name"]
    student_id = data["student_card_id"]
    res = model.del_student_from_course(student_id, course_name)
    if res:
        return '', 200
    else:
        return f"Cannot find user with id {student_id}", 404


@app.route("/courses", methods=["GET"])
def get_courses():
    courses_names = list(map(lambda c: c.name, model.courses))
    return json.dumps(courses_names), 200
