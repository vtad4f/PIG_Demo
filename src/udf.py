
from pig_util import outputSchema
import re


class Regex:
   WORD = re.compile(r'([A-Za-z0-9_-]+)', re.MULTILINE)
   
   
@outputSchema('number:long')
def WordCount(string):
   return len(Regex.WORD.findall(string))
   
   
@outputSchema('number:float')
def Ratio(string):
   try:
      num, den = map(float, string.split('/'))
      return num / den
   except TypeError:
      return 0.0
   
   