from action import ActionController
from report import Report
from idlelib.replace import replace
import os.path

class actionListener(object):
    ROBOT_LISTENER_API_VERSION = 2
    
    def __init__(self, delete_assistive_keywords=False):
        self.ROBOT_LIBRARY_LISTENER = self
        self.delete_assistive_keywords = delete_assistive_keywords
        self.action = ActionController()
    
    def output_file(self, path):
        if self.delete_assistive_keywords:
            Report(path, self.action.get_all_run_ass_keywords())
            
    def start_suite(self, name, attrs):
        self.action.load_keywords()
     
    def start_keyword(self, name, attrs):
        self.action.pre_do('pre', name, attrs['args'])
 
    def end_keyword(self, name, attrs):
        self.action.post_do('post', name, attrs['status'], attrs['args'])