from entity.todo import Todo

#Display Menu
def display_menu():
    print("\n====== todoList 관리 시스템=====")
    print("1.일정 등록")
    print("2.일정 전체 목록")
    print("3.일정 수정")
    print("4.일정 정보 삭제")
    print("5.일정 전체삭제")
    print("0.종료")

def menu_select():
    menu=input("메뉴를 선택하세요")
    return menu

#message 리턴
def message_display(message):
    print(message)

#display todo list info
def list_display(todos):
    print("----- 일정 목록 -----")
    for todo in todos :
        print(todo) #Student 클래스의 재정의된 __str__에 의해 원하는 형식의 정보 출력됨
        

#input display
def input_display():
    todoNum = input("일정 아이디: ")
    title = input("일정명: ")        
    return Todo(todoNum,title)


def update_display():
    todoNum = input("수정할 일정의 아이디: ")
    return todoNum

def delete_display():
    todoNum = input("삭제할 일정의 아이디: ")
    while not todoNum.isdecimal:
            print("숫자로 입력해주세요")
            todoNum = input("일정 id: ")
    return todoNum
