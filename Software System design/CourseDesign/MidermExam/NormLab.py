import csv
import sys
import Classes
import Tools

temp_address = "TEMP"                                                   # 设置程序处理过程中出现的文件的临时存放路径
file_name = 'res\\International Student List - 留学生名册.csv'            # 定义读取的csv文件的路径
operating_program_address = "res/Lab03-JUnit for Unit Test.zip"         # 定义读取的压缩包的路径
lab_number = Tools.find_lab_num(operating_program_address)
lab_name = Tools.find_lab_name(operating_program_address)


def open_roster(f_name):          # 打开学生列表，读取留学生名册的每一行并且返回一个列表
    roster_student = []
    with open(f_name) as f:
        f_csv = csv.reader(f)
        for x in f_csv:
            roster_student.append(x[:3])
    return roster_student


def turn_roster_into_student_class(roster, origin_zip_list):  # 将所有的文件与学生进行绑定
    student_obj_list = []
    for x in roster:
        student_obj = Classes.Student()                       # 创建学生对象并将其读入
        student_obj.id = x[0]                               # 读入留学生学号
        student_obj.fullName = x[1]                         # 读入留学生全名
        student_obj.shortName = x[2]                        # 读入留学生简称
        student_obj.lab_number = lab_number                 # 给学生对象定义实验名和实验代号以便后续操作
        student_obj.lab_name = lab_name
        for origin_zip in origin_zip_list:                  # 给学生对象绑定压缩包对象
            if origin_zip.name[:13] == student_obj.id:
                student_obj.before_operate_file.name = origin_zip.name
                student_obj.before_operate_file.address = temp_address + "\\" + origin_zip.name
                student_obj.before_operate_file.size = origin_zip.stat().st_size
                student_obj.before_operate_file.m_time = origin_zip.stat().st_mtime
        student_obj_list.append(student_obj)
    return student_obj_list


def operate(z_name):
    # 读取学生列表
    student_list = open_roster(file_name)[1:]
    # 将总的压缩包解压到temp_address位置
    Tools.operate_zip_all(z_name, temp_address)
    # 读取每个学生提交作业的压缩包的信息
    former_zip_list = Tools.get_folder_list(temp_address)
    # 将文件与学生进行绑定，只要对学生对象进行相关操作就可以完成对每个学生作业的处理
    students = turn_roster_into_student_class(student_list, former_zip_list)
    # 预设操作文件夹
    Tools.create_fold(lab_name)
    Tools.create_fold(temp_address + "\\temp_report")
    # 以学生为单位对学生绑定的文件进行操作
    for stu in students:
        stu.open_zip()          # 解压并删除包内的所有doc文件（因为需要的是docx文件）
        stu.check_report()      # 读取
        stu.sort_stu_package()
    print("Finish document operation!")
    similar_checker = Classes.CheckSame(students)
    similar_checker.check()
    similar_checker.output_info()
    print("Done!")


if __name__ == '__main__':
    zip_name = ""
    for i in sys.argv[1:]:  # 将命令行中调用指令后的输入合并为一个，即压缩包名
        zip_name += i + " "
    operate(zip_name)
