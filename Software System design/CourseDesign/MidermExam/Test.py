import csv
import os
import zipfile
import Classes
import NormLab
import Tools


def test_open_roster():
    x = NormLab.open_roster()
    assert ['L201926630101', 'Kipesha Mlondwa Kapera', 'Kipesha'] == x[1]


def test_read_zip():
    x = Tools.read_zip("res\\Lab03-JUnit for Unit Test.zip")
    assert type(x) == zipfile.ZipInfo


def test_delete_empty_folder():
    Tools.create_fold("folderA")
    Tools.create_fold("folderA\\folderB")
    Tools.create_fold("folderA\\folderB\\folderC")
    Tools.delete_folder("folderA")
    assert os.path.exists("folderA") == False


def test_create_class_student():
    stu = Classes.Student()
    assert type(stu.report.size) == int


def test_open_roster():
    roster_student = []
    with open("1.csv", "w") as f:
        w = csv.writer(f)
        w.writerow([['5', '6']])
