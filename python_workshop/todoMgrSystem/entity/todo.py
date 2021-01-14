#{"todoNum": , "title":  }
class Todo:
    def __init__(self,todoNum,title):
        self.todoNum = todoNum
        self.title = title
    
    #중복되는 id인지 확인
    def __eq__(self, todoNum):
        return self.todoNum == todoNum 

    #객체를 대표하는 문자열
    def __str__(self):
        return ("일정번호:{} 일정명:{} ".format(self.todoNum, self.title))
        

