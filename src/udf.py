
from pig_util import outputSchema
import re


class Regex:
   WORD = re.compile(r'([A-Za-z0-9_-]+)', re.MULTILINE)
   
   
@outputSchema('number:long')
def WordCount(string):
   return len(Regex.WORD.findall(string))
   
   
@outputSchema('number:double')
def Ratio(string):
   try:
      num, den = map(float, string.split('/'))
      if den:
         return num / den
      else:
         return 0.0
   except TypeError:
      return 0.0
      
      
@outputSchema('number:long')
def Denominator(string):
   try:
      num, den = map(int, string.split('/'))
      return den
   except TypeError:
      return 0
      
      