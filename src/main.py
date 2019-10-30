

from reviews import Parse, Review
import csv
import os
import sys


def Main(input_dir, output_dir):
   """
      BRIEF  Main is a function so that we can use different dirs
   """
   input_path  = os.path.join('..', input_dir, 'movies.txt')
   output_path = os.path.join('..', output_dir, 'movies.csv')
   
   # Populate the csv file by parsing the reviews input file
   if os.path.isfile(input_path):
      with open(output_path, 'wb') as f:
         csv_writer = csv.writer(f)
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
   Main('in', 'out')
   
   