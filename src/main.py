# -*- coding: utf-8 -*-
"""
Created on Wed Oct  2 21:38:19 2019

@author: Vince
"""

from reviews import Parse, Review
from mock import patch
import csv
import os
import sys


class Col:
   ALL = [
      "MovieID" ,
      "UserID"  ,
      "UserName",
      "Helpful" ,
      "Score"   ,
      "Time"    ,
      "Summary" ,
      "Text"
   ]
   
   
def Main(input_dir, output_dir):
   """
      BRIEF  Main is a function so that we can use mock.patch
   """
   input_path  = os.path.join('..', input_dir, 'movies.txt')
   output_path = os.path.join('..', output_dir, 'movies.csv')
   
   # Populate the csv file by parsing the reviews input file
   with open(output_path, 'wb') as f:
      csv_writer = csv.writer(f)
      csv_writer.writerow(Col.ALL)
      Parse(input_path, 1000, _AppendReviews, csv_writer)
      
      
def _AppendReviews(reviews, csv_writer):
   """
      BRIEF  Add the reviews to the file
   """
   for review in reviews:
      csv_writer.writerow([
         review[Review.MOVIE_ID ],
         review[Review.USER_ID  ],
         review[Review.USER_NAME],
         review[Review.HELPFUL  ],
         review[Review.SCORE    ],
         review[Review.TIME     ],
         review[Review.SUMMARY  ],
         review[Review.TEXT     ]
      ])
   
   
if __name__ == '__main__':
   """
      BRIEF  Main execution
   """
   Main('test', 'test')
   # Main('in', 'out') # Uncomment once the test works
   
   
   