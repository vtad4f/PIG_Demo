
from pig_util import outputSchema
import re


class Regex:
   WORD = re.compile(r'([A-Za-z0-9_-]+)', re.MULTILINE)
   
   
@outputSchema('number:long')
def WordCount(string):
   return len(Regex.WORD.findall(string))
   
   