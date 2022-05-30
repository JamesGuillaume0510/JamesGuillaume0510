import Tools
import os
import csv
# 共有三个类，学生类、文件类和查重类

temp_address = "TEMP"
output_address = "OUTPUT"
file_name = 'International Student List - 留学生名册.csv'


# 文件类，将实体文件进行抽象化为一个个代码中的对象
class File:
    def __init__(self):  # 构造函数
        self.name = "un_named"      # 文件名（其实就是文件地址的末端）
        self.size = 0               # 文件大小
        self.address = ""           # 文件地址（处理文件的时候真正要用的东西）
        self.mtime = ""             # 最后修改时间，不过说实话这个作用不太大，因为似乎文件在解压后修改时间就是解压的时间了

    def unzip(self):  # 解压文件
        Tools.unzip(self.address)


class Student:
    def __init__(self):
        self.fullName = ""
        self.shortName = ""
        self.id = ""
        self.before_operate_file = File()
        self.report = File()
        self.package_file = File()
        self.lab_number = ""
        self.lab_name = ""

    def open_zip(self):  # 解压压缩包并放入文件夹中
        if not (self.before_operate_file.address == ""):  # 只有交了作业的学生才执行
            self.before_operate_file.unzip()  # 解压压缩包内的所有文件，并删除了.doc文件
        Tools.delete_empty_folder(temp_address)

    def check_report(self):     # 提取压缩包中的报告文件
        if not (self.before_operate_file.address == ""):  # 只有交了作业的学生才执行
            # 找到文件目录下的所有.docx文件
            vv = []

            def read(path):
                for i in os.scandir(path):
                    fi_d = i.path
                    if os.path.isdir(fi_d):
                        # 调用递归
                        read(fi_d)
                    else:
                        if os.path.splitext(i)[1] == '.docx':
                            vv.append(i)

            read(self.before_operate_file.address)
            if len(vv) == 1:  # 若该文件目录下只有一个.doc文件
                operating_file = vv[0]
                report_name = self.lab_number + "-" + self.id + "-" + self.shortName + ".docx"
                Tools.rename(operating_file.path, self.lab_name + "\\" + report_name)  # 更名并复制到新位置
                self.report.address = self.lab_name + "\\" + report_name
                self.report.name = operating_file.name
                self.report.size = operating_file.stat().st_size
                self.report.mtime = operating_file.stat().st_mtime
                Tools.delete_file(operating_file.path)
            elif len(vv) == 0:
                pass
            else:  # 学生交的文件夹有多个.docx文件,新成立一个文件夹，专门用来存放该同学的report
                report_name = "Report-" + self.lab_number + "-" + self.id + "-" + self.shortName
                operating_fold = self.lab_name + "\\" + report_name
                Tools.create_fold(operating_fold)
                # 更名并复制到新位置
                count = 1
                for x in vv:
                    Tools.move(x.path, operating_fold + "\\" + x.name[:-4] + "(" + str(count) + ").docx")
                    Tools.delete_file(x.path)
                    count = count + 1
        Tools.delete_empty_folder(temp_address)  # 清除整个包内部的空文件夹

    def sort_stu_package(self):
        for i in range(10):
            Tools.check_package(self.before_operate_file.address)
        if not (self.before_operate_file.address == ""):  # 只有交了作业的学生才执行
            # 为该同学的代码新建文件夹，并且把处理后的学生代码放进指定的位置
            package_file_name = "Code-" + self.lab_number + "-" + self.id + "-" + self.shortName
            path = self.lab_name + "\\" + package_file_name
            Tools.rename(self.before_operate_file.address, path)
            Tools.delete_folder(self.before_operate_file.address)
            self.package_file.address = path
        Tools.delete_empty_folder(temp_address)


class CheckSame:
    def __init__(self, students):
        self.students = students
        self.same_report_name = []
        self.same_report_size = []
        self.same_size = []
        self.same_structure = []

    def check(self):
        for stu1 in self.students:
            if not (stu1.before_operate_file.address == ""):  # 只有交了作业的学生才执行
                for stu2 in self.students:
                    if not (stu2.before_operate_file.address == ""):  # 只有交了作业的学生才执行
                        if stu1.id != stu2.id:
                            if (stu1.before_operate_file.size - stu2.before_operate_file.size) / 1000 == 0:
                                # print(stu1.id, "  ", stu2.id)
                                # print(stu1.package_file.size , "    ", stu2.package_file.size)
                                self.same_size.append(stu1.id)
                                self.same_size.append(stu2.id)
                            if stu1.report.name == stu2.report.name:
                                self.same_report_name.append(stu1.id)
                                self.same_report_name.append(stu2.id)
                            if (stu1.report.size - stu2.report.size) / 1000 == 0:
                                self.same_report_size.append(stu1.id)
                                self.same_report_size.append(stu2.id)

    def output_info(self):
        csv_path = "Similar Works Report - List.csv"
        f = open(csv_path, "w")
        f.close()
        head_line = ["Problem", "StudentID"]
        problem1 = ["similar report name"]
        problem2 = ["similar report size"]
        problem3 = ["similar code size"]
        for e in set(self.same_report_name):
            problem1.append(e)
        for e in set(self.same_report_size):
            problem2.append(e)
        for e in set(self.same_size):
            problem3.append(e)
        data_line = [problem1, problem2, problem3]
        Tools.write_csv(csv_path, head_line, data_line)
