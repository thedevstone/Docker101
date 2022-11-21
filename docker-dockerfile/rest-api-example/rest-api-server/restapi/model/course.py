from typing import List

from restapi.model.student import Student


class Course:
    def __init__(self, name: str, max_students: int):
        self.name = name
        self.max_students = max_students
        self.students: List[Student] = []

    def add_student(self, student: Student):
        self.students.append(student)

    def del_student(self, card_id: str):
        self.students = list(filter(lambda s: s.card_id != card_id, self.students))

    def set_name(self, new_name: str):
        self.name = new_name

    def set_max_students(self, max_students: int):
        self.max_students = max_students

