#todoLIst 관리 시스템
todos=[] #todos
id=0
#{"todoNum": , "title":  }


while True:

    print("\n====== todoList 관리 시스템=====")
    print("1.일정 등록")
    print("2.일정 전체 목록")
    print("3.일정 수정")
    print("4.일정 정보 삭제")
    print("5.일정 전체삭제")
    print("0.종료")

    menu=input("메뉴를 선택하세요")

    if menu =="1":

        todoNum = id
        title = input("일정이름: ")

        todo = {"todoNum": todoNum, "title": title }
        todos.append(todo)
        id+=1
        print("{0} 일정이 등록되었습니다.".format(title))

    elif menu=="2":

        print("\n=====전체 일정 목록 보기=====")
        print(todos)
       
    elif menu=="3":

        select = input("수정할 일정 id: ")
        while not select.isdecimal:
            print("숫자로 입력해주세요")
            select = input("일정 id: ")
        new_title = input("일정 수정: ")
        for std in todos:
            if std["todoNum"] == int(select):
                std["title"] = new_title
                print("일정이 {}으로 변경되었습니다.".format(new_title))
                break

    elif menu=="4":

        select = input("삭제할 일정 id: ")
        while not select.isdecimal:
            print("숫자로 입력해주세요")
            select = input("일정 id: ")
        for i in range(len(todos)) :
            if todos[i]["todoNum"] == int(select):
                print("{}번 {}의 정보가 삭제되었습니다".format(select,todos[i]["title"]))
                todos.pop(i)
                break
    
    elif menu=="5":

        response = input("정말 전체 삭제하시겠습니까? (y/n)")
        if(response=='y'):
            todos.clear()
            print("전체 삭제 되었습니다. 현재 {}의 요소".format(len(todos)))
        elif(response=='n'):
            print("첫 단계로 돌아갑니다.")

    elif menu=="0":
        print()
        print("프로그램을 종료합니다.")
        break
    
    else:
        print()
        print("1,2,3,4,0 번 중 선택하세요")