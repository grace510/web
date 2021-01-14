
from dao.file_dao import save_list,init_data_load

class TodoService:
    todos = [] #static
    #등록
    def register(self,todo):
        index = self.is_exist(todo.todoNum)
        if index <0:           
            TodoService.todos.append(todo)
            return ("{0} 일정이 등록되었습니다.".format(todo.title)) 
        else:
            return ("이미 존재하는 ID 입니다.")  
        #id+=1

    #수정
    def update(self,todoNum):
        index = self.is_exist(todoNum)
        if index >-1:
            new_title = input("일정 수정: ")
            TodoService.todos[index].title=new_title
            return("{}로 수정되었습니다.".format(new_title))
        else:
            return("존재하지 않는 일정 ID입니다")

    #선택 삭제
    def delete(self,todoNum):
        index = self.is_exist(todoNum)
        if index >-1:
            TodoService.todos.pop(index)
            return("{}가 삭제되었습니다.".format(index))
        else:
            return("존재하지 않는 일정 ID입니다")

    #전체 삭제
    def clearAll(self):
        response = input("정말 전체 삭제하시겠습니까? (y/n)")
        if(response=='y'):
            TodoService.todos.clear()
            return("전체 삭제 되었습니다. 현재 {}의 요소".format(len(TodoService.todos)))
        elif(response=='n'):
            return("첫 단계로 돌아갑니다.")

    #입력된 index 존재하는지 체크
    def is_exist(self,id):
        for i, todo in enumerate(TodoService.todos):
            if todo.todoNum == id:
                return i  #해당 student의 리스트 상 index
        return -1 #리스트에 해당 요소가 존재하지 않을때 음의 값을 리턴하는 것이 관습


    #service 와 dao 사이의 interface
    #일부분에 변화가 생겨도 충돌나지 않게 해줌
    def file_read(self):
        TodoService.todos = init_data_load()

    def file_write(self):
        save_list(TodoService.todos)