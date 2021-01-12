#todoLIst 관리 시스템
import os.path
todos=[] #todos
id=0
#{"todoNum": , "title":  }

#Display Menu
def display_menu():
    print("\n====== todoList 관리 시스템=====")
    print("1.일정 등록")
    print("2.일정 전체 목록")
    print("3.일정 수정")
    print("4.일정 정보 삭제")
    print("5.일정 전체삭제")
    print("0.종료")

#등록
def register(todoNum,title):
    index = is_exist(todoNum)
    if index <0:
        todo = {"todoNum": todoNum, "title": title }
        todos.append(todo)
        return ("{0} 일정이 등록되었습니다.".format(title)) 
    else:
        return ("이미 존재하는 ID 입니다.")  
    #id+=1

#수정
def update(todoNum):
    index = is_exist(todoNum)
    if index >-1:
        new_title = input("일정 수정: ")
        todos[index]["title"]=new_title
        return("{}로 수정되었습니다.".format(new_title))
    else:
        return("존재하지 않는 일정 ID입니다")

#삭제
def delete(todoNum):
    index = is_exist(todoNum)
    if index >-1:
        todos.pop(index)
        return("{}가 삭제되었습니다.".format(index))
    else:
        return("존재하지 않는 일정 ID입니다")

#입력된 index 존재하는지 체크
def is_exist(id):
    for i, todo in enumerate(todos):
        if todo["todoNum"] == id:
            return i  #해당 student의 리스트 상 index
    return -1 #리스트에 해당 요소가 존재하지 않을때 음의 값을 리턴하는 것이 관습


def save_list():
    save_file = open("todoList.dat","w")
    for index, todo in enumerate(todos):
        save_file.write("{}번째 | {},{}\n".format(index,todo["todoNum"],todo["title"]))

    save_file.close()


#프로그램 시작시 "students.dat" 파일이 존재하고 정보가 있는 경우 list students 초기화
#strip(): 공백제거
def init_data_load():
    fileExist = os.path.isfile("todoList.dat")
    if fileExist:
        with open("todoList.dat","r") as f:
            while True:
                data = f.readline()
                if len(data.split("|")) == 2: #제대로 저장된 데이터인지 판단
                    todo = data.split("|")[1].strip("\n").split(",")
                    todos.append({"todoNum":todo[0].strip(), "title":todo[1].strip()})
                if not data:
                    break

def clearAll():
    response = input("정말 전체 삭제하시겠습니까? (y/n)")
    if(response=='y'):
        todos.clear()
        print("전체 삭제 되었습니다. 현재 {}의 요소".format(len(todos)))
    elif(response=='n'):
        print("첫 단계로 돌아갑니다.")

def display_message(msg):
    print(msg)

init_data_load()

while True:

    display_menu()

    menu=input("메뉴를 선택하세요")

    if menu =="1":

        todoNum = input("일정 ID번호: ")
        title = input("일정이름: ")

        display_message(register(todoNum,title))
        #todo = {"todoNum": todoNum, "title": title }
        #todos.append(todo)
        #id+=1
        #print("{0} 일정이 등록되었습니다.".format(title))

    elif menu=="2":

        print("\n=====전체 일정 목록 보기=====")
        display_message(todos)
       
    elif menu=="3":

        select = input("수정할 일정 id: ")
        while not select.isdecimal:
            print("숫자로 입력해주세요")
            select = input("일정 id: ")

        display_message(update(select))
        #new_title = input("일정 수정: ")


        #for std in todos:
        #    if std["todoNum"] == int(select):
        #        std["title"] = new_title
        #        print("일정이 {}으로 변경되었습니다.".format(new_title))
        #        break

    elif menu=="4":

        select = input("삭제할 일정 id: ")
        while not select.isdecimal:
            print("숫자로 입력해주세요")
            select = input("일정 id: ")
        
        display_message(delete(select))
        #for i in range(len(todos)) :
        #    if todos[i]["todoNum"] == int(select):
        #        print("{}번 {}의 정보가 삭제되었습니다".format(select,todos[i]["title"]))
        #        todos.pop(i)
        #        break
    
    elif menu=="5":
        clearAll()
        
    elif menu=="0":
        print()
        print("프로그램을 종료합니다.")
        save_list()
        break
    
    else:
        print()
        print("1,2,3,4,0 번 중 선택하세요")