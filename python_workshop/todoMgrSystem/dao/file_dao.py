import os.path
from entity.todo import Todo

def save_list(todos):
    save_file = open("todoList.dat","w")
    for index, todo in enumerate(todos):
        save_file.write("{}번째 | {},{}\n".format(index,todo.todoNum,todo.title))

    save_file.close()


#프로그램 시작시 "students.dat" 파일이 존재하고 정보가 있는 경우 list students 초기화
#strip(): 공백제거
def init_data_load():
    fileExist = os.path.isfile("todoList.dat")
    todos =[]
    if fileExist:
        print("todoList file loaded")
        with open("todoList.dat","r") as f:
            while True:
                data = f.readline()
                if len(data.split("|")) == 2: #제대로 저장된 데이터인지 판단
                    todo = data.split("|")[1].strip("\n").split(",")
                    todos.append(Todo(todo[0].strip(), todo[1].strip()))
                if not data:
                    break
    return todos
    