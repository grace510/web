from service.todo_service import TodoService
from view.view import message_display,list_display

class TodoController:
    
    #등록
    def register(self,todo):
        service = TodoService()
        message = service.register(todo)
        message_display(message)

    #수정
    def update(self,todoNum):
        service = TodoService()
        message = service.update(todoNum)
        message_display(message)

    #삭제
    def delete(self,todo):
        service = TodoService()
        message = service.delete(todo)
        message_display(message)
        
    #전체삭제
    def clearAll(self):
        service = TodoService()
        message= service.clearAll()
        message_display(message)


    def getAlltodos(self):
        service = TodoService()
        todos = service.todos
        list_display(todos)


    def file_read(self):
        service = TodoService()
        service.file_read()
        

    def file_write(self):
        service = TodoService()
        service.file_write()
    


    
